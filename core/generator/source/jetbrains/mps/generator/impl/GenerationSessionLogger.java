/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.generator.impl;

import codeOrchestra.actionscript.view.ASMessageMarker;
import jetbrains.mps.generator.GenerationSessionContext;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.messages.IMessageHandler;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.messages.NodeWithContext;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

/**
 * Igor Alshannikov
 * Nov 30, 2007
 */
public class GenerationSessionLogger implements IGeneratorLogger {

  private GenerationSessionContext myOperationContext;
  private int myWarningsCount;
  private int myErrorsCount;

  private final IMessageHandler myMessageHandler;
  private final boolean myHandleInfo;
  private final boolean myHandleWarnings;
  private final boolean myKeepModelsWithWarnings;

  public GenerationSessionLogger(GeneratorLoggerAdapter logger) {
    myMessageHandler = logger.myMessageHandler;
    myHandleInfo = logger.myHandleInfo;
    myHandleWarnings = logger.myHandleWarnings;
    myKeepModelsWithWarnings = logger.myKeepModelsWithWarnings;
  }

  public boolean needsInfo() {
    return myHandleInfo;
  }

  public boolean needsWarnings() {
    return myHandleWarnings;
  }

  public void setOperationContext(GenerationSessionContext operationContext) {
    myOperationContext = operationContext;
  }

  public void info(SNode node, String message) {
    if (!myHandleInfo) {
      return;
    }
    report(MessageKind.INFORMATION, message, node);
  }

  public void info(String message) {
    if (!myHandleInfo) {
      return;
    }
    report(MessageKind.INFORMATION, message, (SNode) null);
  }

  public void warning(String message) {
    if (!myHandleWarnings) {
      return;
    }
    myWarningsCount++;
    report(MessageKind.WARNING, message, (SNode) null);
  }

  public void warning(SNode node, String message, ProblemDescription... descriptions) {
    if (!myHandleWarnings) {
      return;
    }
    myWarningsCount++;
    report(MessageKind.WARNING, message, node, descriptions);
  }

  @Override
  public void error(SNode node, String message, ProblemDescription... descriptions) {
    myErrorsCount++;
    report(MessageKind.ERROR, message, node, descriptions);
  }

  /* package */ void error(@NotNull ModuleReference moduleReference, String message) {
    myErrorsCount++;
    report(MessageKind.ERROR, message, moduleReference);
  }

  public void error(String message) {
    myErrorsCount++;
    report(MessageKind.ERROR, message, (SNode) null);
  }

  public void handleException(Throwable t) {
    String text = t.getMessage();
    if(text == null) {
      Throwable cause = t.getCause();
      int tries = 0;
      while(text == null && cause != null && tries < 10) {
        text = cause.getMessage();
        cause = cause.getCause();
        tries++;
      }
    }
    if(text == null) {
      text = "An exception was encountered: " + t.getClass().getName() + " (no message) (right-click to see)";
    } else {
      text = "(" + t.getClass().getName() + "): " + text + " (right-click to see)";
    }

    Message message = new Message(MessageKind.ERROR, text);
    message.setException(t);
    synchronized (myMessageHandler) {
      myMessageHandler.handle(message);
    }
  }

  private void report(MessageKind kind, String text, SNode node) {
    Message message = prepare(kind, text, node);
    synchronized (myMessageHandler) {
      myMessageHandler.handle(message);
    }
  }

  private void report(MessageKind kind, String text, ModuleReference module) {
    Message message = prepare(kind, text, module);
    synchronized (myMessageHandler) {
      myMessageHandler.handle(message);
    }
  }

  @CodeOrchestraPatch
  private void report(MessageKind kind, String text, SNode node, ProblemDescription... descriptions) {
    List<Message> messages = new ArrayList<Message>(descriptions == null ? 1 : descriptions.length + 1);
    Message mainMessage = prepare(kind, text, node);
    mainMessage.setViewMarker(ASMessageMarker.MARKER);
    messages.add(mainMessage);
    if (descriptions != null) {
      for (ProblemDescription d : descriptions) {
        if (d != null) {
          SNode descriptionNode = d.getNode();
          if (descriptionNode != null) {
            mainMessage.setHintObject(new SNodePointer(descriptionNode));
          }
          messages.add(prepare(kind, "-- " + d.getMessage(), (SNode) null));
        }
      }
    }
    synchronized (myMessageHandler) {
      for (Message m : messages) {
        myMessageHandler.handle(m);
      }
    }
  }

  private Message prepare(MessageKind kind, String text, @NotNull ModuleReference module) {
    Message message = new Message(kind, text);
    message.setHintObject(module);
    return message;
  }

  private Message prepare(MessageKind kind, String text, SNode node) {
    Message message = new Message(kind, text);

    if (node != null) {
      if (myOperationContext != null) {
        if (keepModel(node.getModel(), kind != MessageKind.ERROR)) {
          NodeWithContext context = new NodeWithContext(node, myOperationContext.getInvocationContext());
          message.setHintObject(context);
        }
      } else if (node.isRegistered() && node.getModel() != null && !node.getModel().isTransient()) {
        message.setHintObject(new SNodePointer(node));
      }
    }
    return message;
  }


  private boolean keepModel(SModel model, boolean isWarning) {
    if (model == null) {
      return false;
    }
    if (model.isTransient()) {
      if (isWarning && !myKeepModelsWithWarnings) {
        return false;
      }
      return myOperationContext.keepTransientModel(model, false);
    }
    return true;
  }

  public int getErrorCount() {
    return myErrorsCount;
  }

  public int getWarningCount() {
    return myWarningsCount;
  }
}
