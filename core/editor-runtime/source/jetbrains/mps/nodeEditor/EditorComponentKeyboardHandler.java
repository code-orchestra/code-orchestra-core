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
package jetbrains.mps.nodeEditor;


import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.util.Pair;

import java.awt.event.KeyEvent;
import java.util.List;

public class EditorComponentKeyboardHandler implements KeyboardHandler {
  public boolean processKeyPressed(final EditorContext editorContext, final KeyEvent keyEvent) {
    EditorComponent nodeEditor = editorContext.getNodeEditorComponent();
    nodeEditor.hideMessageToolTip();

    if (processKeyMaps(editorContext, keyEvent)) {
      return true;
    }

    CellActionType actionType = editorContext.getNodeEditorComponent().getActionType(keyEvent, editorContext);
    EditorCell selectedCell = editorContext.getSelectedCell();

    // process action
    if (selectedCell != null && actionType != null && selectedCell.executeAction(actionType)) {
      return true;
    }

    // special case - don't allow kbd focus to leave editor area
    if (keyEvent.getKeyCode() == KeyEvent.VK_UP && keyEvent.isControlDown() && !keyEvent.isAltDown() && !keyEvent.isShiftDown()) {
      keyEvent.consume();
    }

    return false;
  }

  public boolean processKeyTyped(EditorContext editorContext, final KeyEvent keyEvent) {
    EditorComponent nodeEditor = editorContext.getNodeEditorComponent();
    nodeEditor.hideMessageToolTip();

    final EditorCell selectedCell = editorContext.getSelectedCell();

    if (selectedCell != null && selectedCell.processKeyTyped(keyEvent, false)) {
      keyEvent.consume();
      return true;
    }

    if (processKeyMaps(editorContext, keyEvent)) {
      return true;
    }

    CellActionType actionType = editorContext.getNodeEditorComponent().getActionType(keyEvent, editorContext);

    if (selectedCell != null) {
      boolean strictMatching = CellActionType.RIGHT_TRANSFORM.equals(actionType) || CellActionType.LEFT_TRANSFORM.equals(actionType);

      if (selectedCell.isErrorState() && strictMatching) {
        if (selectedCell.validate(strictMatching, false)) {
          return true;
        }
      }

      if (actionType != null) {
        if (selectedCell.executeAction(actionType)) {
          return true;
        }
      }
    }

    if (selectedCell != null && selectedCell.processKeyTyped(keyEvent, true)) {
      keyEvent.consume();
      return true;
    }

    return false;
  }

  public boolean processKeyReleased(EditorContext editorContext, KeyEvent keyEvent) {
    return false;
  }

  private boolean processKeyMaps(EditorContext editorContext, KeyEvent keyEvent) {
    EditorCell selectedCell = editorContext.getSelectedCell();
    if (selectedCell != null) {
      List<Pair<EditorCellKeyMapAction, EditorCell>> actionsInfo = KeyMapUtil.getKeyMapActionsForEvent(selectedCell, keyEvent, editorContext);
      if (actionsInfo.size() == 1 && !(actionsInfo.get(0).o1.isMenuAlwaysShown())) {
        EditorCellKeyMapAction action = actionsInfo.get(0).o1;
        EditorCell contextCell = actionsInfo.get(0).o2;
        KeyMapUtil.executeKeyMapAction(action, keyEvent, contextCell, editorContext);
        return true;
      } else if (actionsInfo.size() > 1 ||
        (actionsInfo.size() == 1 && actionsInfo.get(0).o1.isMenuAlwaysShown())) {
        // show menu
        KeyMapUtil.showActionsMenu(actionsInfo, keyEvent, editorContext, selectedCell);
        return true;
      }
    }
    return false;
  }
}
