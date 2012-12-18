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

import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.CellInfo;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import java.awt.Graphics2D;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/13/11
 * Time: 7:11 PM
 * To change this template use File | Settings | File Templates.
 */
public class EditorCellSelection implements SingularSelection {
  private static final String CARET_X_PROPERTY_NAME = "caretX";
  private static final String SIDE_SELECT_DIRECTION_PROPERTY_NAME = "sideSelectDirection";

  private EditorCell myEditorCell;
  private int myCaretX;
  private boolean myActive = false;
  private SideSelectDirection mySideSelectDirection = SideSelectDirection.NONE;

  public EditorCellSelection(EditorComponent editorComponent, Map<String, String> properties, CellInfo cellInfo) throws SelectionStoreException, SelectionRestoreException {
    if (cellInfo == null) {
      throw new SelectionStoreException("Requred CellInfo parameter is null");
    }
    // TODO: think about better way to restore relevant selection in case of deleted cell (EditorManager.EditorCell_STHint)
    myEditorCell = cellInfo.findClosestCell(editorComponent);
    if (myEditorCell == null) {
      throw new SelectionRestoreException();
    }
    myCaretX = SelectionInfo.Util.getIntProperty(properties, CARET_X_PROPERTY_NAME);
    mySideSelectDirection = (SideSelectDirection) SelectionInfo.Util.getEnumProperty(properties, SIDE_SELECT_DIRECTION_PROPERTY_NAME, SideSelectDirection.class, mySideSelectDirection);
  }

  public EditorCellSelection(@NotNull EditorCell editorCell) {
    myEditorCell = editorCell;
    myCaretX = editorCell.getCaretX();
  }

  @NotNull
  @Override
  public EditorCell getEditorCell() {
    return myEditorCell;
  }

  @Override
  public void setSideSelectDirection(SideSelectDirection direction) {
    mySideSelectDirection = direction;
  }

  @Override
  public SideSelectDirection getSideSelectDirection() {
    return mySideSelectDirection;
  }

  public int getCaretX() {
    return isActive() ? myEditorCell.getCaretX() : myCaretX;
  }

  @Override
  public void activate() {
    if (!isEditable()) {
      return;
    }
    myEditorCell.setSelected(true);
    myEditorCell.setCaretX(getCaretX());
    myActive = true;
  }

  @Override
  public void deactivate() {
    myActive = false;
    myEditorCell.setSelected(false);
    myCaretX = myEditorCell.getCaretX();
  }

  public boolean isActive() {
    return myActive;
  }

  @Override
  public SelectionInfo getSelectionInfo() throws SelectionStoreException {
    SelectionInfo selectionInfo = new SelectionInfo(this.getClass().getName());
    selectionInfo.setCellInfo(myEditorCell.getCellInfo());
    selectionInfo.getPropertiesMap().put(CARET_X_PROPERTY_NAME, Integer.toString(getCaretX()));
    selectionInfo.getPropertiesMap().put(SIDE_SELECT_DIRECTION_PROPERTY_NAME, mySideSelectDirection.name());
    return selectionInfo;
  }

  protected boolean isEditable() {
    return myEditorCell.getEditor().isEditable();
  }

  @Override
  public boolean isSame(Selection another) {
    if (this == another) {
      return true;
    }
    if (another == null || getClass() != another.getClass()) {
      return false;
    }
    EditorCellSelection that = (EditorCellSelection) another;
    if (!myEditorCell.equals(that.myEditorCell)) {
      return false;
    }
    if (mySideSelectDirection != that.mySideSelectDirection) {
      return false;
    }
    if (getCaretX() != that.getCaretX()) {
      return false;
    }
    return true;
  }

  @Override
  public void executeAction(CellActionType type) {
    // TODO: add separate handler for Backspace action.
    if (type == CellActionType.BACKSPACE) {
      type = CellActionType.DELETE;
    }
    if (type == CellActionType.DELETE && suppressDelete()) {
      return;
    }
    myEditorCell.executeAction(type);
  }

  protected boolean suppressDelete() {
    return !myEditorCell.isBigCell() && myEditorCell.getAction(CellActionType.DELETE) == null;
  }

  @NotNull
  @Override
  public List<EditorCell> getSelectedCells() {
    return Collections.singletonList(getEditorCell());
  }

  @NotNull
  @Override
  public List<SNode> getSelectedNodes() {
    SNode sNode = getEditorCell().getSNode();
    return Collections.singletonList(sNode);
  }

  @Override
  public void ensureVisible() {
    myEditorCell.getEditor().scrollToCell(myEditorCell);
  }

  @Override
  public void paintSelection(Graphics2D g) {
    //To change body of implemented methods use File | Settings | File Templates.
  }
}
