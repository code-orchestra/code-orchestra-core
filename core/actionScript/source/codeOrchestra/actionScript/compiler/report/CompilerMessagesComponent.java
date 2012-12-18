package codeOrchestra.actionScript.compiler.report;

import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class CompilerMessagesComponent extends AbstractProjectComponent {

  public static CompilerMessagesComponent instance() {
    return ProjectHolder.getProject().getComponent(CompilerMessagesComponent.class);
  }

  public CompilerMessagesComponent(Project project) {
    super(project);
  }

  private Map<SNodePointer, CompilerMessage> lastCompilationMessages = new HashMap<SNodePointer, CompilerMessage>();

  private List<CompilerMessageListener> listeners = new ArrayList<CompilerMessageListener>();
  private Object listenerMonitor = new Object();

  public synchronized void addMessage(CompilerMessage compilerMessage) {
    SNodePointer nodePointer = compilerMessage.getNodePointer();
    if (nodePointer != null) {
      SNode node = getNodeForMessage(nodePointer);
      if (node != null) {
        lastCompilationMessages.put(nodePointer, compilerMessage);
        fireMessageAdd(compilerMessage, node);
      }
    }
  }

  private SNode getNodeForMessage(final SNodePointer nodePointer) {
    return ModelAccess.instance().runReadAction(new Computable<SNode>() {
      @Override
      public SNode compute() {
        SNode node = nodePointer.getNode();

        SNode ancestorStatement = SNodeOperations.getAncestor(node, Concepts.STATEMENT, false, false);
        if (ancestorStatement != null) {
          return ancestorStatement;
        }

        return node;
      }
    });
  }

  public synchronized void invalidate() {
    for (SNodePointer nodePointer : lastCompilationMessages.keySet()) {
      SNode node = nodePointer.getNode();
      if (node != null) {
        fireMessageInvalidate(node);
      }
    }

    lastCompilationMessages.clear();
  }


  private void fireMessageAdd(CompilerMessage message, SNode node) {
    synchronized (listenerMonitor) {
      for (CompilerMessageListener listener : listeners) {
        listener.onCompilerMessageAdd(message, node);
      }
    }
  }

  private void fireMessageInvalidate(SNode node) {
    synchronized (listenerMonitor) {
      for (CompilerMessageListener listener : listeners) {
        listener.onCompilerMessageInvalidate(node);
      }
    }
  }

  public void addListener(CompilerMessageListener listener) {
    synchronized (listenerMonitor) {
      listeners.add(listener);
    }
  }

  public void removeListener(CompilerMessageListener listener) {
    synchronized (listenerMonitor) {
      listeners.remove(listener);
    }
  }

}
