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

import com.intellij.openapi.fileEditor.FileEditorManager;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.InspectorTool;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.inspector.InspectorEditorComponent;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSFileNodeEditor;
import jetbrains.mps.workbench.highlighter.EditorsHelper;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class EditorUtil {
  @Nullable
  public static EditorComponent scrollToNode(@NotNull SNode node, @Nullable EditorComponent component, FileEditorManager manager) {

    EditorComponent inspector = findInspector(manager);

    if (inspector != null && component != null) {
      boolean searchInInspector = false;
      SNode currentTargetNode = node;
      while (currentTargetNode != null) {
        EditorCell cell = component.findNodeCell(currentTargetNode);
        if (cell != null) {
          if (currentTargetNode != node) {
            // so we are probably in inspector...
            // we need to select to find a node in inspector
            component.changeSelection(cell);
            searchInInspector = true;
          }
          break;
        }
        currentTargetNode = currentTargetNode.getParent();
      }

      currentTargetNode = node;
      while (currentTargetNode != null && searchInInspector) {
        EditorCell cellInInspector = inspector.findNodeCell(currentTargetNode);
        if (cellInInspector != null) {
          inspector.scrollToCell(cellInInspector);
          return inspector;
        }
        currentTargetNode = currentTargetNode.getParent();
      }
    }

    if (component == null) return null;

    component.scrollToNode(node);
    return component;
  }

  @NotNull
  public static List<EditorComponent> findComponentForNode(SNode node, FileEditorManager fileEditorManager) {
    ModelAccess.assertLegalRead();
    List<EditorComponent> result = new ArrayList<EditorComponent>();
    EditorComponent inspector = findInspector(fileEditorManager);
    if (inspector != null) {
      if (isNodeShownInTheComponent(inspector, node)) {
        result.add(inspector);
      }
    }
    for (EditorComponent editorComponent : getAllEditorComponents(fileEditorManager, false)) {
      if (isNodeShownInTheComponent(editorComponent, node)) {
        result.add(editorComponent);
      }
    }
    return result;
  }

  public static boolean isNodeShownInTheComponent(@NotNull EditorComponent component, @NotNull SNode node) {
    if (component instanceof InspectorEditorComponent) {
      SNode editedNode = component.getEditedNode();
      return editedNode != null && editedNode.isAncestorOf(node) && (editedNode != node);
    } else {
      return component.getEditedNode() == node.getContainingRoot();
    }
  }

  public static List<EditorComponent> getAllEditorComponents(FileEditorManager manager, boolean includeInspector) {
    if (manager.getProject().isDisposed()) return Collections.emptyList();

    List<EditorComponent> result = new ArrayList<EditorComponent>();

    if (includeInspector) {
      EditorComponent inspector = findInspector(manager);
      if (inspector != null) {
        result.add(inspector);
      }
    }

    List<MPSFileNodeEditor> allEditors = EditorsHelper.getAllEditors(manager);
    for (MPSFileNodeEditor editor : allEditors) {
      EditorComponent currentEditorComponent = editor.getNodeEditor().getCurrentEditorComponent();
      if (currentEditorComponent != null) {
        result.add(currentEditorComponent);
      }
    }
    return result;
  }

  @Nullable
  public static EditorComponent findInspector(FileEditorManager manager) {
    if (manager.getProject().isDisposed()) return null;
    InspectorTool tool = manager.getProject().getComponent(InspectorTool.class);
    if (tool == null) return null;
    return tool.getInspector();
  }
}