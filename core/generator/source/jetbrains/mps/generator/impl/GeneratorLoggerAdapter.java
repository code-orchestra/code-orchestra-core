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
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.messages.IMessageHandler;
import jetbrains.mps.messages.Message;
import jetbrains.mps.messages.MessageKind;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.ArrayList;
import java.util.List;

/**
 * Evgeny Gryaznov, Feb 23, 2010
 */
public class GeneratorLoggerAdapter implements IGeneratorLogger {

  protected final IMessageHandler myMessageHandler;
  protected final boolean myHandleInfo;
  protected final boolean myHandleWarnings;
  protected final boolean myKeepModelsWithWarnings;

  public GeneratorLoggerAdapter(IMessageHandler messageHandler, boolean handleInfo, boolean handleWarnings, boolean keepModelsWithWarnings) {
    myMessageHandler = messageHandler;
    myHandleInfo = handleInfo;
    myHandleWarnings = handleWarnings;
    myKeepModelsWithWarnings = keepModelsWithWarnings && handleWarnings;
  }

  @Override
  public boolean needsInfo() {
    return myHandleInfo;
  }

  @Override
  public boolean needsWarnings() {
    return myHandleWarnings;
  }

  @Override
  public void info(SNode node, String message) {
    if (!myHandleInfo) {
      return;
    }
    report(MessageKind.INFORMATION, message, node);
  }

  @Override
  public void info(String message) {
    if (!myHandleInfo) {
      return;
    }
    report(MessageKind.INFORMATION, message, null);
  }

  public void trace(String message) {
    for (String s : message.split("\n")) {
      report(MessageKind.INFORMATION, s, null);
    }
  }

  @Override
  public void warning(String message) {
    if (!myHandleWarnings) {
      return;
    }
    report(MessageKind.WARNING, message, null);
  }

  @Override
  public void warning(SNode node, String message, ProblemDescription... descriptions) {
    if (!myHandleWarnings) {
      return;
    }
    report(MessageKind.WARNING, message, node, descriptions);
  }

  @Override
  public void error(SNode node, String message, ProblemDescription... descriptions) {
    report(MessageKind.ERROR, message, node, descriptions);
  }

  @Override
  public void error(String message) {
    report(MessageKind.ERROR, message, null);
  }

  @Override
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
          messages.add(prepare(kind, "-- " + d.getMessage(), null));
        }
      }
    }
    synchronized (myMessageHandler) {
      for (Message m : messages) {
        myMessageHandler.handle(m);
      }
    }
  }

  private Message prepare(MessageKind kind, String text, SNode node) {
    Message message = new Message(kind, text);
    if (node != null && node.isRegistered() && node.getModel() != null && !node.getModel().isTransient()) {
      message.setHintObject(new SNodePointer(node));
    }
    return message;
  }

  void clear() {
    myMessageHandler.clear();
  }
}
