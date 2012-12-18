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
package jetbrains.mps.workbench.editors;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.ex.IdeDocumentHistory;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.IdeFocusManager;
import com.intellij.openapi.wm.ToolWindowManager;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.NodeEditor;
import jetbrains.mps.ide.editorTabs.TabbedEditor;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.nodeEditor.InspectorTool;
import jetbrains.mps.nodeEditor.NodeEditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import jetbrains.mps.workbench.nodesFs.MPSNodesVirtualFileSystem;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.awt.Component;

public class MPSEditorOpener {
  private Project myProject;

  public MPSEditorOpener(Project project) {
    myProject = project;
    assert myProject != null;
  }

  public IEditor createEditorFor(IOperationContext operationContext, SNode node) {
    IEditor nodeEditor = null;
    MPSEditorOpenHandler handler = getOpenHandler(operationContext);
    if (handler.canOpen(operationContext, node)) {
      nodeEditor = handler.open(operationContext, node);
    }

    if (nodeEditor != null) return nodeEditor;

    return new NodeEditor(operationContext, node);
  }

  private MPSEditorOpenHandler getOpenHandler(IOperationContext operationContext) {
    return operationContext.getProject().getComponent(ProjectPluginManager.class).getEditorOpenHandler();
  }

  @Deprecated
  public void openNode(final SNode node) {
    if (node == null) return;
    //todo why later?
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        ModuleContext context = ModuleContext.create(node, myProject);
        if (context == null) return;
        boolean select = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
          public Boolean compute() {
            return !node.isRoot();
          }
        });
        openNode(node, context, true, select);
      }
    });
  }

  public IEditor editNode(@NotNull final SNode node, final IOperationContext context) {
    return editNode(node, context, true);
  }

  public IEditor editNodeExplicitly(@NotNull final SNode node, final IOperationContext context) {
    return editNode(node, context, false);
  }

  public IEditor openNode(@NotNull final SNode node, final IOperationContext context, final boolean focus, final boolean select) {
    return openNode(node, context, focus, select, true);
  }

  public IEditor openNodeExplicitly(@NotNull final SNode node, final IOperationContext context, final boolean focus, final boolean select) {
    return openNode(node, context, focus, select, false);
  }

  //----------generic

  private IEditor editNode(final SNode node, final IOperationContext context, boolean openBaseNode) {
    boolean select = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        return !node.isRoot();
      }
    });
    return openNode(node, context, true, select, openBaseNode);
  }

  private IEditor openNode(final SNode node, @NotNull final IOperationContext context, final boolean focus, final boolean select, final boolean openBaseNode) {
    final Project ideaProject = context.getProject();
    ideaProject.getComponent(IdeDocumentHistory.class).includeCurrentCommandAsNavigation();
    /* TODO use SNodePointer instead of SNode */
    /* temp hack: runWriteAction instead of read, TODO move sync into doOpenNode */
    return ModelAccess.instance().runReadAction(new Computable<IEditor>() {
      public IEditor compute() {
        return doOpenNode(node, context, focus, select, openBaseNode);
      }
    });
  }

  private IEditor doOpenNode(final SNode node, IOperationContext context, final boolean focus, boolean select, boolean openBaseNode) {
    assert node.isRegistered() : "You can't edit unregistered node";

    if (node.getModel().getModelDescriptor() == null) {
      return null;
    }

    //open editor
    SNode containingRoot = node.getContainingRoot();
    // [++] for http://youtrack.jetbrains.net/issue/MPS-7663
    if (containingRoot == null) {
      SNode current = node;
      while (current.getParent() != null) {
        current = current.getParent();
      }
      assert false : "Containing root was not found for node: " + node.toString() +
        ", top-level node: " + current +
        ", isDisposed: " + node.isDisposed() +
        ", model: " + node.getModel() +
        (node.getModel() != null ? ", modelDisposed: " + node.getModel().isDisposed() : "");
    }
    // [--] for http://youtrack.jetbrains.net/issue/MPS-7663
    final IEditor nodeEditor = openEditor(containingRoot, context, openBaseNode);

    //restore inspector state for opened editor (if exists)
    if (!restorePrevSelectionInInspector(nodeEditor, nodeEditor.getOperationContext(), getInspector())) {
      //open inspector (if no cell is selected in editor, inspector won't be opened)
      DataContext dataContext = DataManager.getInstance().getDataContext(nodeEditor.getCurrentEditorComponent());
      FileEditor fileEditor = MPSDataKeys.FILE_EDITOR.getData(dataContext);
      getInspector().inspect(node, nodeEditor.getOperationContext(), fileEditor);
    }

    //select and its parents in editor and inspector(if exist)
    if (select) {
      selectNodeParentInEditor(nodeEditor, node);
      selectNodeParentInInspector(node, nodeEditor.getOperationContext());
    }

    //move focus if needed - to editor or to inspector
    if (focus) {
      focus(nodeEditor, focusNeededInInspector(node));
    }

    return nodeEditor;
  }

  private IEditor openEditor(final SNode root, IOperationContext context, boolean openBaseNode) {
    SNode baseNode = null;

    if (openBaseNode && isUseTabs()) {
      baseNode = getOpenHandler(context).getBaseNode(context, root);
    }

    if (baseNode == null) {
      baseNode = root;
    }

    // [++] assertions for http://youtrack.jetbrains.net/issue/MPS-7792
    assert baseNode.isRegistered() : "BaseNode is not registered";
    SNodePointer sNodePointer = new SNodePointer(baseNode);
    SNode node = sNodePointer.getNode();
    assert node != null : "Unable to get Node by SNodePointer: " + sNodePointer + " (baseNode = " + baseNode + ", root = " + root + ")";
    assert node.isRegistered() : "Returned node is not registered (" + node + "|" + baseNode + ")";
    // [--] assertions for http://youtrack.jetbrains.net/issue/MPS-7792
    MPSNodeVirtualFile file = MPSNodesVirtualFileSystem.getInstance().getFileFor(baseNode);
    // [++] assertion for http://youtrack.jetbrains.net/issue/MPS-9753
    assert file.hasValidMPSNode() : "Invalid file returned for: " + baseNode + ", corresponding node from SNodePointer: " + new SNodePointer(baseNode).getNode();
    // [--] assertion for http://youtrack.jetbrains.net/issue/MPS-9753
    FileEditorManager editorManager = FileEditorManager.getInstance(myProject);
    FileEditor fileEditor = editorManager.openFile(file, true)[0];

    MPSFileNodeEditor fileNodeEditor = (MPSFileNodeEditor) fileEditor;

    IEditor nodeEditor = fileNodeEditor.getNodeEditor();

    if (nodeEditor instanceof TabbedEditor) {
      nodeEditor.showNode(root, false);
    }

    return nodeEditor;
  }

  private boolean isUseTabs() {
    return ApplicationManager.getApplication().getComponent(EditorSettings.class).getState().isShow();
  }

  //----------util

  private boolean focusNeededInInspector(SNode node) {
    final InspectorTool inspectorTool = getInspector();
    if (inspectorTool == null) return false;
    EditorComponent inspector = inspectorTool.getInspector();
    while (node != null) {
      EditorCell cellInInspector = inspector.findNodeCell(node);
      if (cellInInspector != null) {
        if (cellInInspector == inspectorTool.getInspector().getRootCell()) return false;
        return true;
      }
      node = node.getParent();
    }

    return false;
  }

  private void focus(IEditor nodeEditor, boolean cellInInspector) {
    if (!cellInInspector) {
      final ToolWindowManager manager = ToolWindowManager.getInstance(myProject);
      manager.activateEditorComponent();
      Component toBeFocused;
      // Workaround for: http://youtrack.jetbrains.net/issue/MPS-7882
      if (nodeEditor.getCurrentEditorComponent() != null) {
        toBeFocused = nodeEditor.getCurrentEditorComponent();
      } else {
        toBeFocused = nodeEditor.getComponent();
      }
      getFocusManager().requestFocus(toBeFocused, false);
    } else {
      final InspectorTool inspectorTool = getInspector();
      inspectorTool.getToolWindow().activate(null);
      getFocusManager().requestFocus(inspectorTool.getInspector(), false);
    }
  }

  private InspectorTool getInspector() {
    return myProject.getComponent(InspectorTool.class);
  }

  private IdeFocusManager getFocusManager() {
    return IdeFocusManager.getInstance(myProject);
  }

  private void selectNodeParentInInspector(final SNode node, IOperationContext context) {
    final InspectorTool inspectorTool = getInspector();
    if (inspectorTool == null) return;
    final EditorComponent inspector = inspectorTool.getInspector();

    SNode currentTargetNode = node;
    while (currentTargetNode != null) {
      EditorCell cellInInspector = inspector.findNodeCell(currentTargetNode);
      if (cellInInspector != null) {
        inspector.changeSelection(cellInInspector);
        return;
      }
      currentTargetNode = currentTargetNode.getParent();
    }
  }

  private boolean restorePrevSelectionInInspector(IEditor nodeEditor, IOperationContext context, InspectorTool inspectorTool) {
    if (!(nodeEditor.getCurrentEditorComponent() instanceof NodeEditorComponent)) return false;
    NodeEditorComponent nec = (NodeEditorComponent) nodeEditor.getCurrentEditorComponent();
    if (nec == null || nec.getLastInspectedNode() == null) return false;

    DataContext dataContext = DataManager.getInstance().getDataContext(nodeEditor.getComponent());
    FileEditor fileEditor = MPSDataKeys.FILE_EDITOR.getData(dataContext);
    inspectorTool.inspect(nec.getLastInspectedNode(), context, fileEditor);
    return true;
  }

  //select parent node, which is in editor, or the whole root node if the node given is not visible at all
  private void selectNodeParentInEditor(IEditor nodeEditor, SNode node) {
    SNode currentSelectionTarget = node;
    EditorComponent component = nodeEditor.getCurrentEditorComponent();
    if (component == null) {
      return;
    }

    while (currentSelectionTarget != null) {
      EditorCell cell = component.findNodeCell(currentSelectionTarget);
      if (cell != null) {
        component.changeSelection(cell);
        return;
      }
      currentSelectionTarget = currentSelectionTarget.getParent();
    }

    component.changeSelection(component.getRootCell());
  }
}
