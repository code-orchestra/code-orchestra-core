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
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/13/11
 * Time: 7:12 PM
 * To change this template use File | Settings | File Templates.
 */
public class EditorCellLabelSelection extends EditorCellSelection {
  private static final String HAS_NON_TRIVIAL_SELECTION_PROPERTY_NAME = "hasNonTrivialSelection";
  private static final String SELECTION_START_PROPERTY_NAME = "selectionStart";
  private static final String SELECTION_END_PROPERTY_NAME = "selectionEnd";

  private int mySelectionStart = -1;
  private int mySelectionEnd = -1;
  private boolean myNonTrivialSelection = false;

  public EditorCellLabelSelection(EditorComponent editorComponent, Map<String, String> properties, CellInfo cellInfo) throws SelectionStoreException, SelectionRestoreException {
    super(editorComponent, properties, cellInfo);
    if (!(getEditorCell() instanceof EditorCell_Label)) {
      throw new SelectionRestoreException();
    }
    myNonTrivialSelection = SelectionInfo.Util.getBooleanProperty(properties, HAS_NON_TRIVIAL_SELECTION_PROPERTY_NAME);
    if (getEditorCell().getCellInfo().equals(cellInfo)) {
      if (myNonTrivialSelection) {
        /*
         This is kind of hack for EditorManager.STHintCellInfo - if located cell is different from the original one
         then we do not restore selection.
         */
        mySelectionStart = SelectionInfo.Util.getIntProperty(properties, SELECTION_START_PROPERTY_NAME);
        mySelectionEnd = SelectionInfo.Util.getIntProperty(properties, SELECTION_END_PROPERTY_NAME);
      }
    } else {
      myNonTrivialSelection = false;
    }
  }

  public EditorCellLabelSelection(EditorCell_Label editorCell) {
    super(editorCell);
    mySelectionStart = editorCell.getSelectionStart();
    mySelectionEnd = editorCell.getSelectionEnd();
    myNonTrivialSelection = mySelectionStart != mySelectionEnd;
  }

  @NotNull
  public EditorCell_Label getEditorCellLabel() {
    return (EditorCell_Label) getEditorCell();
  }

  public int getSelectionStart() {
    return isActive() ? getEditorCellLabel().getSelectionStart() : mySelectionStart;
  }

  public int getSelectionEnd() {
    return isActive() ? getEditorCellLabel().getSelectionEnd() : mySelectionEnd;
  }

  public boolean hasNonTrivialSelection() {
    return isActive() ? getSelectionStart() != getSelectionEnd() : myNonTrivialSelection;
  }

  @Override
  public void activate() {
    if (!isEditable()) {
      return;
    }
    super.activate();
    if (myNonTrivialSelection) {
      getEditorCellLabel().setSelectionStart(mySelectionStart);
      getEditorCellLabel().setSelectionEnd(mySelectionEnd);
    }
  }

  @Override
  public void deactivate() {
    if (!isEditable()) {
      return;
    }
    super.deactivate();
    mySelectionStart = getEditorCellLabel().getSelectionStart();
    mySelectionEnd = getEditorCellLabel().getSelectionEnd();
    myNonTrivialSelection = mySelectionStart != mySelectionEnd;
    getEditorCellLabel().deselectAll();
  }

  @Override
  public SelectionInfo getSelectionInfo() throws SelectionStoreException {
    SelectionInfo selectionInfo = super.getSelectionInfo();
    selectionInfo.getPropertiesMap().put(HAS_NON_TRIVIAL_SELECTION_PROPERTY_NAME, Boolean.toString(hasNonTrivialSelection()));
    if (hasNonTrivialSelection()) {
      selectionInfo.getPropertiesMap().put(SELECTION_START_PROPERTY_NAME, Integer.toString(getSelectionStart()));
      selectionInfo.getPropertiesMap().put(SELECTION_END_PROPERTY_NAME, Integer.toString(getSelectionEnd()));
    }
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

    EditorCellLabelSelection that = (EditorCellLabelSelection) another;
    if (!getEditorCell().equals(that.getEditorCell())) {
      return false;
    }
    if (getCaretX() != that.getCaretX()) {
      return false;
    }
    if (hasNonTrivialSelection() != that.hasNonTrivialSelection()) {
      return false;
    }
    if (hasNonTrivialSelection()) {
      if (getSelectionEnd() != that.getSelectionEnd()) {
        return false;
      }
      if (getSelectionStart() != that.getSelectionStart()) {
        return false;
      }
    }
    return true;
  }

  @Override
  public void executeAction(CellActionType type) {
    if (type == CellActionType.DELETE || type == CellActionType.BACKSPACE) {
      performDeleteAction(type);
      return;
    }
    if (type == CellActionType.DELETE_TO_WORD_END) {
      super.executeAction(CellActionType.DELETE);
      return;
    }
    super.executeAction(type);
  }

  @Override
  protected boolean suppressDelete() {
    if (!super.suppressDelete()) {
      return false;
    }
    EditorCell_Label label = getEditorCellLabel();
    if (label.getText().length() == 0) {
      return false;
    }
    if (label instanceof EditorCell_Constant || label instanceof EditorCell_Property) {
      return label.isEditable() || label.getContainingBigCell().getLastLeaf(CellConditions.SELECTABLE) != label;
    }
    return true;
  }

  private void performDeleteAction(CellActionType type) {
    if (getEditorCellLabel().executeTextAction(type, false)) {
      return;
    }
    if (processSideDeletes(type)) {
      return;
    }
    if (getEditorCellLabel().executeTextAction(type, true)) {
      return;
    }
    super.executeAction(type);
  }

  @CodeOrchestraPatch
  private boolean processSideDeletes(CellActionType type) {
    // TODO: review this logic - it was originally copied from EditorComponentKeyboardHandler
    final EditorCell selectedCell = getEditorCell();
    if (type == CellActionType.DELETE && selectedCell.isLastPositionInBigCell() && !selectedCell.isFirstPositionInBigCell()) {
      final EditorCell target;
      if (selectedCell.isLastPositionInBigCell() && selectedCell.getContainingBigCell().getNextSibling() != null) {
        target = selectedCell.getContainingBigCell().getNextSibling();
      } else if (selectedCell.getNextSibling() != null) {
        target = selectedCell.getNextSibling();
      } else {
        target = selectedCell.getNextLeaf(CellConditions.SELECTABLE);
      }

      if (target == null || ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          return target.getSNode().isAncestorOf(selectedCell.getSNode());
        }
      })) return false;

      return target.executeAction(CellActionType.DELETE);
    }

    if (type == CellActionType.BACKSPACE && selectedCell.isFirstPositionInBigCell() && !selectedCell.isLastPositionInBigCell()) {
      final EditorCell target;
      if (selectedCell.isFirstPositionInBigCell() && selectedCell.getContainingBigCell().getPrevSibling() != null) {
        target = selectedCell.getContainingBigCell().getPrevSibling();
      } else if (selectedCell.getPrevSibling() != null) {
        target = selectedCell.getPrevSibling();
      } else {
        target = selectedCell.getPrevLeaf(CellConditions.SELECTABLE);

        // RE-3221
        final SNode targetNode = target.getSNode();
        if (targetNode != null && NodeUtils.isBackspaceAscensionBlocked(targetNode)) {
          return true;
        }
      }

      if (target == null) return false;
      /*
      if (ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          return target.getSNode().isAncestorOf(selectedCell.getSNode());
        }
      })) return false;
      */
      return target.executeAction(CellActionType.DELETE);
    }
    return false;
  }
}
