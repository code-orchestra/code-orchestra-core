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
package jetbrains.mps.nodeEditor.selection;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.actions.nodes.DeleteNodesHelper;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.EditorCellAction;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.CellInfo;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/13/11
 * Time: 7:55 PM
 * To change this template use File | Settings | File Templates.
 */
public class NodeRangeSelection extends AbstractMultipleSelection implements MultipleSelection {
  private static final String ROLE_PROPERTY_NAME = "role";
  private static final String MODEL_ID_PROPERTY_NAME = "modelId";
  private static final String FIRST_NODE_ID_PROPERTY_NAME = "firstNodeId";
  private static final String LAST_NODE_ID_PROPERTY_NAME = "lastNodeId";
  private static final String PARENT_NODE_ID_PROPERTY_NAME = "parentNodeId";

  private SNode myFirstNode;
  private SNode myLastNode;
  private SNode myParentNode;
  private String myRole;

  public NodeRangeSelection(@NotNull EditorComponent editorComponent, Map<String, String> properties, CellInfo cellInfo) throws SelectionStoreException, SelectionRestoreException {
    super(editorComponent);
    if (cellInfo != null) {
      throw new SelectionStoreException("Non-null CellInfo objet passed as a parameter: " + cellInfo);
    }
    myRole = properties.get(ROLE_PROPERTY_NAME);
    if (myRole == null) {
      throw new SelectionStoreException("Role property missed");
    }

    String modelId = properties.get(MODEL_ID_PROPERTY_NAME);
    if (modelId == null) {
      throw new SelectionStoreException("Model ID property missed");
    }
    SModelDescriptor sModelDescriptor = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(modelId));
    if (sModelDescriptor == null) {
      throw new SelectionRestoreException();
    }
    SModel sModel = sModelDescriptor.getSModel();
    myFirstNode = findNode(sModel, properties, FIRST_NODE_ID_PROPERTY_NAME);
    myLastNode = findNode(sModel, properties, LAST_NODE_ID_PROPERTY_NAME);
    myParentNode = findNode(sModel, properties, PARENT_NODE_ID_PROPERTY_NAME);

    if (myParentNode != myFirstNode.getParent() || myParentNode != myLastNode.getParent()) {
      throw new SelectionRestoreException();
    }
    if (!myRole.equals(myFirstNode.getRole_()) || !myRole.equals(myLastNode.getRole_())) {
      throw new SelectionRestoreException();
    }
    initSelectedCells();
  }

  public NodeRangeSelection(@NotNull EditorComponent editorComponent, @NotNull SNode firstNode, @NotNull SNode lastNode) {
    super(editorComponent);
    myFirstNode = firstNode;
    myLastNode = lastNode;
    myParentNode = myFirstNode.getParent();
    myRole = myFirstNode.getRole_();

    assert myParentNode != null;
    assert myParentNode == myLastNode.getParent();
    assert myRole != null && myRole.equals(myLastNode.getRole_()) : "First node role: " + myRole + ", last node role: " + myLastNode.getRole_();
    initSelectedCells();
  }

  private void initSelectedCells() {
    List<EditorCell> selectedCells = new ArrayList<EditorCell>();
    List<SNode> children = myParentNode.getChildren(myRole);
    int i1 = children.indexOf(myFirstNode);
    assert i1 != -1;
    int i2 = children.indexOf(myLastNode);
    assert i2 != -1;
    for (int index = Math.min(i1, i2); index <= Math.max(i1, i2); index++) {
      SNode nextNode = children.get(index);
      EditorCell editorCell = getEditorComponent().findNodeCell(nextNode);
      assert editorCell != null : "editor cell was not found for node: " + nextNode;
      selectedCells.add(editorCell);
    }
    setSelectedCells(selectedCells);
  }

  @Override
  public SelectionInfo getSelectionInfo() {
    SelectionInfo selectionInfo = new SelectionInfo(this.getClass().getName());
    selectionInfo.getPropertiesMap().put(ROLE_PROPERTY_NAME, myRole);
    selectionInfo.getPropertiesMap().put(MODEL_ID_PROPERTY_NAME, myParentNode.getModel().getSModelReference().toString());
    selectionInfo.getPropertiesMap().put(FIRST_NODE_ID_PROPERTY_NAME, myFirstNode.getId());
    selectionInfo.getPropertiesMap().put(LAST_NODE_ID_PROPERTY_NAME, myLastNode.getId());
    selectionInfo.getPropertiesMap().put(PARENT_NODE_ID_PROPERTY_NAME, myParentNode.getId());
    return selectionInfo;
  }

  @Override
  public boolean isSame(Selection another) {
    if (this == another) {
      return true;
    }
    if (another == null || getClass() != another.getClass()) {
      return false;
    }

    NodeRangeSelection that = (NodeRangeSelection) another;
    if (!myFirstNode.equals(that.myFirstNode)) {
      return false;
    }
    if (!myLastNode.equals(that.myLastNode)) {
      return false;
    }
    if (!myParentNode.equals(that.myParentNode)) {
      return false;
    }
    if (!myRole.equals(that.myRole)) {
      return false;
    }
    return true;
  }

  @Override
  public void executeAction(CellActionType type) {
    if (type == CellActionType.BACKSPACE || type == CellActionType.DELETE) {
      performDeleteAction(type);
      return;
    }
    super.executeAction(type);
  }

  @NotNull
  private SNode findNode(SModel sModel, Map<String, String> properties, String propertyName) throws SelectionStoreException, SelectionRestoreException {
    String sNodeId = properties.get(propertyName);
    if (sNodeId == null) {
      throw new SelectionStoreException("Required node Id property missed, propertyName = " + propertyName);
    }
    SNode sNode = sModel.getNodeById(sNodeId);
    if (sNode == null) {
      throw new SelectionRestoreException();
    }
    return sNode;
  }

  private void performDeleteAction(CellActionType type) {
    // TODO: handle delete action similar to all other actions (using corresponding editor component action)
    final EditorContext editorContext = getEditorComponent().getEditorContext();
    int selectedCellsSize = getSelectedCells().size();
    if (selectedCellsSize > 1) {
      editorContext.executeCommand(new Runnable() {
        public void run() {
          new DeleteNodesHelper(getSelectedNodes(), editorContext.getOperationContext(), false).deleteNodes(false);
        }
      });
    } else if (selectedCellsSize == 1) {
      EditorCell nodeCell = getFirstCell();
      final EditorCellAction action = nodeCell.getAction(CellActionType.DELETE);
      if (action == null) return;

      if (!ModelAccess.instance().tryRead(new Computable<Boolean>() {
        public Boolean compute() {
          return action.canExecute(editorContext);
        }
      })) return;

      if (action.executeInCommand()) {
        editorContext.executeCommand(new Runnable() {
          public void run() {
            action.execute(editorContext);
          }
        });
      } else {
        action.execute(editorContext);
      }
    }
  }

  // TODO: enlargeSelection action should be handled specifically by executeAction() method
  public NodeRangeSelection enlargeSelection(boolean next) {
    List<SNode> children = myParentNode.getChildren(myRole);

    SNode newLastNode = null;
    for (Iterator<SNode> it = children.iterator(); it.hasNext(); ) {
      SNode semanticNode = it.next();
      if (semanticNode == myLastNode) {
        if (next) {
          if (it.hasNext()) {
            newLastNode = it.next();
          } else {
            newLastNode = null;
          }
        }
        break;
      }
      newLastNode = semanticNode;
    }
    return newLastNode != null ? new NodeRangeSelection(getEditorComponent(), myFirstNode, newLastNode) : null;
  }
}
