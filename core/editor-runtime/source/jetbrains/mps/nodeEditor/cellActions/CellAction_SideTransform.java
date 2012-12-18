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
package jetbrains.mps.nodeEditor.cellActions;

import jetbrains.mps.editor.runtime.impl.CellUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.SNodeEditorUtil;
import jetbrains.mps.smodel.action.ModelActions;
import jetbrains.mps.util.Condition;
import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.CellFinders;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;

public class CellAction_SideTransform extends EditorCellAction {
  private CellSide mySide;

  public CellAction_SideTransform(CellSide side) {
    mySide = side;
  }

  public boolean canExecute(EditorContext context) {
    return context.getSelectedCell() != null && canCreateRightTransformHint(context.getSelectedCell());
  }

  private boolean canCreateRightTransformHint(EditorCell selectedCell) {
    EditorContext editorContext = selectedCell.getEditorContext();
    SNode node = selectedCell.getSNode();
    if (node == null) return false;
    if (getSideTransformHintAnchorCell(selectedCell, mySide) == null) return false;
    if (selectedCell instanceof EditorCell_Error) return false;

    String anchorTag = selectedCell.getRightTransformAnchorTag();
    return ModelActions.canCreateSideTransformHintSubstituteActions(node, mySide, anchorTag, editorContext.getOperationContext());
  }

  private EditorCell getSideTransformHintAnchorCell(EditorCell selectedCell, CellSide side) {
    final SNode node = selectedCell.getSNode();
    EditorCell anchorCell = null;
    String anchorTag = selectedCell.getRightTransformAnchorTag();
    if (anchorTag != null) {
      anchorCell = selectedCell;
    } else {
      EditorCell nodeMainCell = selectedCell.getContainingBigCell();
      EditorCell defAnchorCell = nodeMainCell.findChild(CellFinders.byCondition(new Condition<EditorCell>() {
        public boolean met(EditorCell object) {
          return object.hasRightTransformAnchorTag(CellUtil.getDefaultSideTransformTag()) && object.getSNode() == node;
        }
      }, true), true);

      if (defAnchorCell == null) {
        defAnchorCell = nodeMainCell;
      }

      if (defAnchorCell == selectedCell || defAnchorCell.isAncestorOf(selectedCell)) {
        anchorCell = defAnchorCell;
      }
    }

    if (side == CellSide.RIGHT && anchorCell != null && anchorCell.findChild(CellFinders.LAST_SELECTABLE_LEAF, true) != selectedCell) {
      return null;
    }

    if (side == CellSide.LEFT && anchorCell != null && anchorCell.findChild(CellFinders.FIRST_SELECTABLE_LEAF, true) != selectedCell) {
      return null;
    }

    return anchorCell;
  }

  public void execute(EditorContext context) {
    EditorCell selectedCell = context.getSelectedCell();
    SNode node = selectedCell.getSNode();

    if (SNodeEditorUtil.hasRightTransformHint(node)) {
      SNodeEditorUtil.removeRightTransformHint(node);
    }
    if (SNodeEditorUtil.hasLeftTransformHint(node)) {
      SNodeEditorUtil.removeLeftTransformHint(node);
    }

    EditorCell anchorCell = getSideTransformHintAnchorCell(selectedCell, mySide);

    String anchorTag = selectedCell.getRightTransformAnchorTag();
    if (mySide == CellSide.LEFT) {
      SNodeEditorUtil.addLeftTransformHint(node);
    } else {
      SNodeEditorUtil.addRightTransformHint(node);
    }

    node.putUserObject(EditorManager.SIDE_TRANSFORM_HINT_ANCHOR_CELL_ID, anchorCell.getCellId());
    if (anchorTag != null) {
      node.putUserObject(EditorManager.SIDE_TRANSFORM_HINT_ANCHOR_TAG, anchorTag);
    } else {
      node.removeUserObject(EditorManager.SIDE_TRANSFORM_HINT_ANCHOR_TAG);
    }

    context.flushEvents();

    EditorCell nodeCell = context.getNodeEditorComponent().findNodeCell(node);
    assert nodeCell != null : "can't find cell for node " + node.getId() +  " " + node.getModel();
    assert node.equals(nodeCell.getSNode()) : "node cell has incorrect node: " + nodeCell.getSNode();
    EditorCell rtHint = nodeCell.getSTHintCell();
    if (rtHint == null) {
      String anchorCellID = anchorCell.getCellId();
      EditorCell anchor_Cell = context.getNodeEditorComponent().findCellWithId(node, anchorCellID);
      assert rtHint != null : "can't find RT Hint for cell " + nodeCell + " with node " + node.getId() +  " " + node.getModel() + " ( anchorCellId = " + anchorCellID + ", anchor_Cell = " + anchor_Cell + ", original anchor cell: " + anchorCell + ")" ;
    }
    context.getNodeEditorComponent().changeSelection(rtHint);
  }
}
