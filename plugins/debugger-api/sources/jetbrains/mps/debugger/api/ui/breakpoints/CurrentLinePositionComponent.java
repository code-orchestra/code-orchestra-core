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
package jetbrains.mps.debugger.api.ui.breakpoints;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.project.Project;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.api.DebugSessionManagerComponent.DebugSessionListener;
import jetbrains.mps.debug.api.SessionChangeAdapter;
import jetbrains.mps.debug.api.SessionChangeListener;
import jetbrains.mps.debug.api.programState.ILocation;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.NullLocation;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.workbench.highlighter.EditorComponentCreateListener;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CurrentLinePositionComponent implements ProjectComponent {
  private static final Logger LOG = Logger.getLogger(CurrentLinePositionComponent.class);
  private final FileEditorManager myFileEditorManager;
  private final MPSEditorOpener myEditorOpener;
  private final Map<AbstractDebugSession, CurrentLinePainter> mySessionToContextPainterMap =
    new HashMap<AbstractDebugSession, CurrentLinePainter>();
  private final Project myProject;
  private final SessionChangeListener myChangeListener = new MySessionChangeListener();
  private volatile boolean myIsDisposed = false;

  //todo extract and generify
  private final DebugSessionListener myCurrentDebugSessionListener = new MyCurrentDebugSessionListener();
  private final EditorComponentCreateListener myEditorComponentCreationHandler = new MyEditorComponentCreateListener();
  private MessageBusConnection myMessageBusConnection;

  public CurrentLinePositionComponent(Project project, FileEditorManager fileEditorManager, MPSEditorOpener editorOpener) {
    myFileEditorManager = fileEditorManager;
    myEditorOpener = editorOpener;
    myProject = project;
  }

  private List<CurrentLinePainter> getAllPainters() {
    synchronized (mySessionToContextPainterMap) {
      List<CurrentLinePainter> painters = new ArrayList<CurrentLinePainter>();
      painters.addAll(mySessionToContextPainterMap.values());
      return painters;
    }
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Current Line Position Project Component";
  }

  @Override
  public void initComponent() {
    DebugSessionManagerComponent component = myProject.getComponent(DebugSessionManagerComponent.class);
    component.addDebugSessionListener(myCurrentDebugSessionListener);
    myMessageBusConnection = myProject.getMessageBus().connect();
    myMessageBusConnection.subscribe(EditorComponentCreateListener.EDITOR_COMPONENT_CREATION, myEditorComponentCreationHandler);
  }

  @Override
  public void disposeComponent() {
    myIsDisposed = true;
    myMessageBusConnection.disconnect();
    DebugSessionManagerComponent component = myProject.getComponent(DebugSessionManagerComponent.class);
    component.removeDebugSessionListener(myCurrentDebugSessionListener);
  }

  private void detachPainter(AbstractDebugSession newDebugSession) {
    final CurrentLinePainter painter;

    synchronized (mySessionToContextPainterMap) {
      painter = mySessionToContextPainterMap.get(newDebugSession);
      mySessionToContextPainterMap.remove(newDebugSession);
    }

    if (painter != null) {
      ApplicationManager.getApplication().invokeLater(new Runnable() {
        @Override
        public void run() {
          detachPainter(painter);
        }
      });
    }
  }

  private void detachPainter(@NotNull CurrentLinePainter painter) {
    for (EditorComponent editor : EditorUtil.getAllEditorComponents(myFileEditorManager, true)) {
      detach(painter, editor);
    }
  }

  private void detach(@NotNull final CurrentLinePainter painter, @NotNull final EditorComponent editorComponent) {
    ApplicationManager.getApplication().assertIsDispatchThread();
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        if (EditorUtil.isNodeShownInTheComponent(editorComponent, painter.getItem())) {
          editorComponent.removeAdditionalPainter(painter);
          editorComponent.repaint();
        }
      }
    });
  }

  private void attachPainter(AbstractDebugSession debugSession) {
    IStackFrame stackFrame = debugSession.getUiState().getStackFrame();
    if (stackFrame != null) {
      ILocation location = stackFrame.getLocation();
      if (location != null && !(location instanceof NullLocation)) {
        SNode node = TraceInfoUtil.getNode(location.getUnitName(), location.getFileName(), location.getLineNumber());
        if (node != null) {
          final CurrentLinePainter newPainter = new CurrentLinePainter(node);

          // we lock here, since we do not want to acquire read lock inside while having mySessionToContextPainterMap 
          synchronized (mySessionToContextPainterMap) {
            mySessionToContextPainterMap.put(debugSession, newPainter);
            ApplicationManager.getApplication().invokeLater(new Runnable() {
              @Override
              public void run() {
                attachPainterAndOpenEditor(newPainter);
              }
            });
          }

        }
      }
    }
  }

  private void attachPainterAndOpenEditor(@NotNull final CurrentLinePainter painter) {
    EditorComponent currentEditorComponent = myEditorOpener.openNode(painter.getItem(), ProjectOperationContext.get(myProject), true, false).getCurrentEditorComponent();
    currentEditorComponent = EditorUtil.scrollToNode(painter.getItem(), currentEditorComponent, myFileEditorManager);
    if (currentEditorComponent != null) {
      attach(painter, currentEditorComponent);
    }
  }

  private void attach(@NotNull final CurrentLinePainter painter, @NotNull final EditorComponent editorComponent) {
    ApplicationManager.getApplication().assertIsDispatchThread();
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        if (EditorUtil.isNodeShownInTheComponent(editorComponent, painter.getItem())) {
          if (!editorComponent.getAdditionalPainters().contains(painter)) {
            editorComponent.addAdditionalPainter(painter);
          }
          editorComponent.repaint();
        }
      }
    });
  }

  private class MyCurrentDebugSessionListener implements DebugSessionListener {
    @Override
    public void registered(AbstractDebugSession session) {
      session.addChangeListener(myChangeListener);
    }

    @Override
    public void currentSessionChanged(AbstractDebugSession newDebugSession) {
      synchronized (mySessionToContextPainterMap) {
        for (AbstractDebugSession session : mySessionToContextPainterMap.keySet()) {
          CurrentLinePainter painter = mySessionToContextPainterMap.get(session);
          if (painter != null) {
            painter.setVisible(newDebugSession != null && newDebugSession == session);
          }
        }
      }
      ApplicationManager.getApplication().invokeLater(new Runnable() {
        @Override
        public void run() {
          for (EditorComponent editorComponent : EditorUtil.getAllEditorComponents(myFileEditorManager, true)) {
            editorComponent.repaint();
          }
        }
      });
    }

    @Override
    public void detached(AbstractDebugSession newDebugSession) {
      detachPainter(newDebugSession);
      newDebugSession.removeChangeListener(myChangeListener);
    }
  }

  private class MySessionChangeListener extends SessionChangeAdapter {
    @Override
    public void stateChanged(AbstractDebugSession session) {
      detachPainter(session);
      attachPainter(session);
    }

    @Override
    public void paused(AbstractDebugSession debugSession) {
      detachPainter(debugSession);
      attachPainter(debugSession);
    }

    @Override
    public void resumed(AbstractDebugSession debugSession) {
      detachPainter(debugSession);
    }
  }

  private class MyEditorComponentCreateListener implements EditorComponentCreateListener {
    @Override
    public void editorComponentCreated(@NotNull EditorComponent editorComponent) {
      for (CurrentLinePainter p : getAllPainters()) {
        attach(p, editorComponent);
      }
    }

    @Override
    public void editorComponentDisposed(@NotNull EditorComponent editorComponent) {
      for (CurrentLinePainter p : getAllPainters()) {
        detach(p, editorComponent);
      }
    }
  }
}
