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
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.util.Computable;
import com.intellij.util.messages.MessageBusConnection;
import codeOrchestra.actionScript.Concepts;
import jetbrains.mps.debug.api.*;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointManagerListener;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointsIO;
import jetbrains.mps.debug.api.DebugSessionManagerComponent.DebugSessionAdapter;
import jetbrains.mps.debug.api.DebugSessionManagerComponent.DebugSessionListener;
import jetbrains.mps.debug.api.breakpoints.*;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.LeftMarginMouseListener;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.highlighter.EditorComponentCreateListener;
import org.jdom.Attribute;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.awt.event.MouseEvent;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BreakpointsUiComponent implements ProjectComponent {
  private static final Logger LOG = Logger.getLogger(BreakpointsUiComponent.class);
  private static final String BREAKPOINT_ELEMENT = "breakpoint";
  private static final String KIND_TAG = "kind";
  private final Project myProject;
  private final BreakpointManagerComponent myBreakpointsManagerComponent;
  private final BreakpointProvidersManager myProvidersManager;
  private final DebugInfoManager myDebugInfoManager;
  private final FileEditorManager myFileEditorManager;

  private final LeftMarginMouseListener myMouseListener = new MyLeftMarginMouseListener();

  private final MyBreakpointManagerListener myBreakpointManagerListener = new MyBreakpointManagerListener();
  private final MyBreakpointListener myBreakpointListener = new MyBreakpointListener();
  private final SessionChangeListener myChangeListener = new MySessionChangeAdapter();
  private final DebugSessionListener myDebugSessionListener = new MyDebugSessionAdapter();
  private final MyEditorComponentCreateListener myEditorComponentCreationHandler = new MyEditorComponentCreateListener();
  private MessageBusConnection myMessageBusConnection;

  public static BreakpointsUiComponent getInstance(Project project) {
    return project.getComponent(BreakpointsUiComponent.class);
  }

  public BreakpointsUiComponent(Project project, BreakpointManagerComponent breakpointsManagerComponent, DebugInfoManager debugInfoManager, BreakpointProvidersManager providersManager, FileEditorManager fileEditorManager) {
    myProject = project;
    myBreakpointsManagerComponent = breakpointsManagerComponent;
    myDebugInfoManager = debugInfoManager;
    myProvidersManager = providersManager;
    myFileEditorManager = fileEditorManager;
    myBreakpointsManagerComponent.setBreakpointsIO(new MyBreakpointsIO());
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Breakpoints Ui Component";
  }

  @Override
  public void initComponent() {
    DebugSessionManagerComponent component = myProject.getComponent(DebugSessionManagerComponent.class);
    component.addDebugSessionListener(myDebugSessionListener);
    myBreakpointsManagerComponent.addChangeListener(myBreakpointManagerListener);
    myMessageBusConnection = myProject.getMessageBus().connect();
    myMessageBusConnection.subscribe(EditorComponentCreateListener.EDITOR_COMPONENT_CREATION, myEditorComponentCreationHandler);
    for (EditorComponent editor : EditorUtil.getAllEditorComponents(myFileEditorManager, true)) {
      editorComponentCreated(editor);
    }
  }

  @Override
  public void disposeComponent() {
    myMessageBusConnection.disconnect();
    myBreakpointsManagerComponent.removeChangeListener(myBreakpointManagerListener);
    DebugSessionManagerComponent component = myProject.getComponent(DebugSessionManagerComponent.class);
    component.removeDebugSessionListener(myDebugSessionListener);
  }

  public void editBreakpointProperties(final ILocationBreakpoint breakpoint) {
    final BreakpointsBrowserDialog breakpointsBrowserDialog = new BreakpointsBrowserDialog(ProjectOperationContext.get(myProject));
    breakpointsBrowserDialog.showDialog();
    ApplicationManager.getApplication().invokeLater(new Runnable() {
      @Override
      public void run() {
        breakpointsBrowserDialog.selectBreakpoint(breakpoint);
      }
    });
  }

  @NotNull
  private Set<ILocationBreakpoint> getBreakpointsForComponent(@NotNull final EditorComponent editorComponent) {
    final SNode editedNode = editorComponent.getEditedNode();
    if (editedNode == null) return Collections.emptySet();
    if (editedNode.isDisposed()) {
      Set<IBreakpoint> allBreakpoints = myBreakpointsManagerComponent.getAllIBreakpoints();
      Set<ILocationBreakpoint> locationBreakpoints = new HashSet<ILocationBreakpoint>();
      for (IBreakpoint breakpoint : allBreakpoints) {
        if (breakpoint instanceof ILocationBreakpoint) {
          locationBreakpoints.add((ILocationBreakpoint) breakpoint);
        }
      }
      return locationBreakpoints;
    }
    SNodePointer rootPointer = ModelAccess.instance().runReadAction(new Computable<SNodePointer>() {
      @Override
      public SNodePointer compute() {
        final SNode rootNode = editedNode.getContainingRoot();
        if (rootNode == null) return null;
        return new SNodePointer(rootNode);
      }
    });
    if (rootPointer == null) return Collections.emptySet();
    final Set<ILocationBreakpoint> breakpointsForRoot = myBreakpointsManagerComponent.getBreakpoints(rootPointer);
    if (breakpointsForRoot == null) return Collections.emptySet();
    final Set<ILocationBreakpoint> result = new HashSet<ILocationBreakpoint>();
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        for (ILocationBreakpoint locationBreakpoint : breakpointsForRoot) {
          SNode node = locationBreakpoint.getLocation().getSNode();
          if (node != null && EditorUtil.isNodeShownInTheComponent(editorComponent, node)) {
            result.add(locationBreakpoint);
          }
        }
      }
    });
    return result;
  }

  private void editorComponentCreated(@Nullable EditorComponent editorComponent) {
    if (editorComponent == null) return;
    if (!editorComponent.getLeftMarginPressListeners().contains(myMouseListener)) {
      editorComponent.addLeftMarginPressListener(myMouseListener);
    }
    Set<ILocationBreakpoint> breakpointsForRoot = getBreakpointsForComponent(editorComponent);
    for (ILocationBreakpoint breakpoint : breakpointsForRoot) {
      editorComponent.addAdditionalPainter(new BreakpointPainter(breakpoint));
      editorComponent.getLeftEditorHighlighter().addIconRenderer(new BreakpointIconRenderer(breakpoint, editorComponent));
    }
    editorComponent.repaint();
  }

  private void editorComponentDisposed(@Nullable EditorComponent editorComponent) {
    if (editorComponent == null) return;
    editorComponent.removeLeftMarginPressListener(myMouseListener);
    Set<ILocationBreakpoint> breakpointsForRoot = getBreakpointsForComponent(editorComponent);
    for (ILocationBreakpoint breakpoint : breakpointsForRoot) {
      editorComponent.removeAdditionalPainterByItem(breakpoint);
    }
    editorComponent.getLeftEditorHighlighter().removeAllIconRenderers(BreakpointIconRenderer.TYPE);
  }

  public void toggleBreakpoint(EditorCell cell) {
    EditorCell debuggableCell = findDebuggableOrTraceableCell(cell);
    if (debuggableCell != null) {
      toggleBreakpoint(debuggableCell.getSNode(), true);
    }
  }

  public boolean isDebuggable(EditorCell cell) {
    return findDebuggableCell(cell) != null || findTraceableCell(cell) != null;
  }

  @CodeOrchestraPatch
  private SNode findDebuggableNode(final EditorComponent editorComponent, int x, final int y) {
    EditorCell foundCell = editorComponent.getRootCell().findCellWeak(x, y, new Condition<EditorCell>() {
      @Override
      public boolean met(EditorCell object) {
        EditorCell debuggableOrTraceableCell = findDebuggableOrTraceableCell(object);
        if (debuggableOrTraceableCell == null) {
          return false;
        }
        // todo do we need to know about ui?
        EditorCell iconAnchorCell = BreakpointIconRenderer.getBreakpointIconAnchorCell(editorComponent.findNodeCell(debuggableOrTraceableCell.getSNode()));

        // RF-845
        if (iconAnchorCell == null) {
          return false;
        }

        // ignoring mouse clicks to any other rows except one containing "BreakpointIconAnchorCell"
        // (this cell will be marked with breakpoint icon in LeftEditorHighlighter)
        return (y >= iconAnchorCell.getY() && iconAnchorCell.getBaseline() >= y);
      }
    });
    if (foundCell == null) return null;
    EditorCell cell = findDebuggableOrTraceableCell(foundCell);
    if (cell == null) return null;
    return cell.getSNode();
  }

  private EditorCell findDebuggableOrTraceableCell(EditorCell foundCell) {
    EditorCell cell = findDebuggableCell(foundCell);
    if (cell == null) {
      cell = findTraceableCell(foundCell);
    }
    if (cell == null) return null;
    return cell;
  }

  private EditorCell findDebuggableCell(EditorCell foundCell) {
    EditorCell cell = foundCell;
    while (cell != null) {
      SNode node = cell.getSNode();
      if (myDebugInfoManager.isDebuggableNode(node)) {
        return cell;
      }
      cell = cell.getParent();
    }
    return null;
  }

  private EditorCell findTraceableCell(EditorCell foundCell) {
    final TraceInfoCache traceInfoCache = TraceInfoCache.getInstance();
    EditorCell cell = foundCell;
    while (cell != null) {
      SNode node = cell.getSNode();
      if (node != null) {
        DebugInfo debugInfo = traceInfoCache.get(node.getModel().getModelDescriptor());
        if (debugInfo != null && debugInfo.getPositionForNode(node.getId()) != null) {
          break;
        }
      }
      cell = cell.getParent();
    }
    return cell;
  }


  private void toggleBreakpoint(@NotNull SNode node, boolean handleRemoveBreakpoint) {
    SNode root = node.getContainingRoot();
    if (root == null) return;
    boolean hasBreakpoint = false;
    IBreakpoint breakpoint = null;
    SNodePointer rootPointer = new SNodePointer(root);
    Set<ILocationBreakpoint> mpsBreakpointSet = myBreakpointsManagerComponent.getBreakpoints(rootPointer);
    if (mpsBreakpointSet != null) {
      hasBreakpoint = false;
      for (ILocationBreakpoint mpsBreakpoint : mpsBreakpointSet) {
        // RE-2981
        SNode toggledNode = mpsBreakpoint.getLocation().getSNode();
        if (toggledNode == node ||
          (node.getParent() == toggledNode && toggledNode.isInstanceOfConcept(Concepts.STATEMENTS_LIST))) {
          hasBreakpoint = true;
          breakpoint = mpsBreakpoint;
          break;
        }
      }
    } else {
      hasBreakpoint = false;
    }
    if (hasBreakpoint) {
      if (handleRemoveBreakpoint) {
        myBreakpointsManagerComponent.removeBreakpoint(breakpoint);
      }
    } else {
      ILocationBreakpoint newBreakpoint = myDebugInfoManager.createBreakpoint(node, myProject);
      if (newBreakpoint != null) {
        myBreakpointsManagerComponent.addBreakpoint(newBreakpoint);
      } else if (myDebugInfoManager.isDebuggableNode(node)) {
        /*
         RE-2693 - don't report an error on null breakpoint — currently there's no way to
         disable breakpoint creation for quasi-abstract concepts like Statement, so we return
         a null breakpoint in the breakpoint creator
        */

        // LOG.error("Node is debuggable but created breakpoint is null.", node);
      } else {
        LOG.error("Trying to create breakpoint on non-debuggable node.", node);
      }
    }
  }


  public void createFromUi(IBreakpointKind kind) {
    IBreakpointsProvider provider = myProvidersManager.getProvider(kind);
    if (provider == null) {
      Messages.showErrorDialog(myProject, "Can not create " + kind.getPresentation() + ". Provider was not found.", "Error Creating" + kind.getPresentation());
    } else {
      IBreakpoint breakpoint = provider.createFromUi(kind, myProject);
      if (breakpoint != null) {
        myBreakpointsManagerComponent.addBreakpoint(breakpoint);
      }
    }
  }

  @NotNull
  @CodeOrchestraPatch
  private List<EditorComponent> findComponentForLocationBreakpoint(@NotNull ILocationBreakpoint breakpoint) {
    final SNode node = breakpoint.getLocation().getSNode();
    if (node != null) {
      // RE-2968
      return ModelAccess.instance().runReadAction(new Computable<List<EditorComponent>>() {
        @Override
        public List<EditorComponent> compute() {
          return EditorUtil.findComponentForNode(node, myFileEditorManager);
        }
      });
    }
    return Collections.emptyList();
  }

  private void addLocationBreakpoint(ILocationBreakpoint breakpoint) {
    List<EditorComponent> editorComponents = findComponentForLocationBreakpoint(breakpoint);
    for (EditorComponent editorComponent : editorComponents) {
      editorComponent.addAdditionalPainter(new BreakpointPainter(breakpoint));
      editorComponent.getLeftEditorHighlighter().addIconRenderer(new BreakpointIconRenderer(breakpoint, editorComponent));
      editorComponent.repaint(); //todo should it be executed in ED thread?
    }
  }

  private void removeLocationBreakpoint(ILocationBreakpoint breakpoint) {
    List<EditorComponent> editorComponents = findComponentForLocationBreakpoint(breakpoint);
    for (EditorComponent editorComponent : editorComponents) {
      editorComponent.removeAdditionalPainterByItem(breakpoint);
      editorComponent.getLeftEditorHighlighter().removeIconRenderer(breakpoint.getLocation().getSNode(), BreakpointIconRenderer.TYPE);
      editorComponent.repaint(); //todo should it be executed in ED thread?
    }
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  private class MyEditorComponentCreateListener implements EditorComponentCreateListener {
    @Override
    public void editorComponentCreated(@NotNull EditorComponent editorComponent) {
      BreakpointsUiComponent.this.editorComponentCreated(editorComponent);
    }

    @Override
    public void editorComponentDisposed(@NotNull EditorComponent editorComponent) {
      BreakpointsUiComponent.this.editorComponentDisposed(editorComponent);
    }
  }

  private class MyLeftMarginMouseListener implements LeftMarginMouseListener {

    @Override
    public void mousePressed(MouseEvent e, EditorComponent editorComponent) {
    }

    @Override
    public void mouseReleased(MouseEvent e, EditorComponent editorComponent) {
    }

    @Override
    public void mouseClicked(final MouseEvent e, final EditorComponent editorComponent) {
      if (e.getButton() == MouseEvent.BUTTON1) {
        ModelAccess.instance().runReadAction(new Runnable() {
          @Override
          public void run() {
            SNode node = findDebuggableNode(editorComponent, e.getX(), e.getY());
            if (node != null) {
              toggleBreakpoint(node, true);
            }
          }
        });
      }
    }

  }

  private class MyBreakpointsIO implements IBreakpointsIO {
    @Override
    public IBreakpoint readBreakpoint(@NotNull Element element) {
      String kindName = element.getAttributeValue(KIND_TAG);

      IBreakpointKind kind = myProvidersManager.getKind(kindName);
      if (kind == null) {
        return null;
      }

      IBreakpointsProvider provider = myProvidersManager.getProvider(kind);
      if (provider == null) {
        return null;
      }

      IBreakpoint breakpoint = provider.loadFromState((Element) element.getChildren().get(0), kind, myProject);
      if (breakpoint != null) {
        breakpoint.addBreakpointListener(myBreakpointListener);
      }
      return breakpoint;
    }

    @Override
    public Element writeBreakpoint(@NotNull IBreakpoint breakpoint) {
      IBreakpointKind kind = breakpoint.getKind();
      IBreakpointsProvider provider = myProvidersManager.getProvider(kind);
      if (provider == null) {
        return null;
      }

      Element element = provider.saveToState(breakpoint);
      if (element != null) {
        Element breakpointElement = new Element(BREAKPOINT_ELEMENT);
        breakpointElement.setAttribute(new Attribute(KIND_TAG, kind.getName()));
        breakpointElement.addContent(element);
        return breakpointElement;
      }

      return null;
    }
  }

  private class MyBreakpointManagerListener implements IBreakpointManagerListener {

    @Override
    public void breakpointAdded(@NotNull IBreakpoint breakpoint) {
      if (breakpoint instanceof ILocationBreakpoint) {
        addLocationBreakpoint((ILocationBreakpoint) breakpoint);
      }
      breakpoint.addBreakpointListener(myBreakpointListener);
    }

    @Override
    public void breakpointRemoved(@NotNull IBreakpoint breakpoint) {
      if (breakpoint instanceof ILocationBreakpoint) {
        removeLocationBreakpoint((ILocationBreakpoint) breakpoint);
      }
      breakpoint.removeBreakpointListener(myBreakpointListener);
    }
  }

  private class MyBreakpointListener implements IBreakpointListener {
    @Override
    public void breakpointEnabledStateToggled(final IBreakpoint breakpoint, boolean enabled) {
      ModelAccess.instance().runReadAction(new Runnable() {
        @Override
        public void run() {
          if (breakpoint instanceof ILocationBreakpoint) {
            List<EditorComponent> editorComponents = findComponentForLocationBreakpoint((ILocationBreakpoint) breakpoint);
            for (EditorComponent editorComponent : editorComponents) {
              editorComponent.repaint();
            }
          }
        }
      });
    }
  }

  private class MyDebugSessionAdapter extends DebugSessionAdapter {
    @Override
    public void registered(AbstractDebugSession session) {
      session.addChangeListener(myChangeListener);
    }

    @Override
    public void detached(AbstractDebugSession session) {
      session.removeChangeListener(myChangeListener);
    }
  }

  private class MySessionChangeAdapter extends SessionChangeAdapter {
    @Override
    public void muted(AbstractDebugSession session) {
      ApplicationManager.getApplication().invokeLater((new Runnable() {
        @Override
        public void run() {
          for (EditorComponent editorComponent : EditorUtil.getAllEditorComponents(myFileEditorManager, true)) {
            editorComponent.repaint();
          }
        }
      }));
    }
  }
}
