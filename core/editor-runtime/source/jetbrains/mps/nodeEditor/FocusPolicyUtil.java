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
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.CellFinders;
import jetbrains.mps.nodeEditor.FocusPolicy;

public class FocusPolicyUtil {
  public static EditorCell findCellToSelectDueToFocusPolicy(EditorCell cell) {
    EditorCell selectedCell = findFocusedCell(cell);
    if (selectedCell == null || selectedCell == cell) return cell;
    if (!selectedCell.hasFocusPolicy()) {
      EditorCell firstEditableCell = selectedCell.findChild(CellFinders.FIRST_SELECTABLE_LEAF);
      if (firstEditableCell != null) selectedCell = firstEditableCell;
    }
    return selectedCell;
  }

  private static EditorCell findFocusedCell(EditorCell selectedCell) {
    EditorCell focusedCell = findCellWhichAttractsFocus(selectedCell, true, true);
    if (focusedCell == null) {
      focusedCell = selectedCell;
    }

    if (focusedCell.getFocusPolicy() == FocusPolicy.FIRST_EDITABLE_CELL ||
      focusedCell.getFocusPolicy() == FocusPolicy.ATTRACTS_RECURSIVELY) {
      EditorCell result = focusedCell.findChild(CellFinders.or(CellFinders.FIRST_ERROR, CellFinders.FIRST_EDITABLE));
      if (result != null) {
        return result;
      }
    }
    while (focusedCell instanceof EditorCell_Collection && ((EditorCell_Collection)focusedCell).isTransparentCollection()) {
      focusedCell = ((EditorCell_Collection)focusedCell).getChildAt(0);
    }
    return focusedCell;
  }


  private static EditorCell findCellWhichAttractsFocus(EditorCell cell, boolean includingMe, boolean descend) {
    if (cell == null) return null;

    if (includingMe &&
      cell.getFocusPolicy() != FocusPolicy.NONE &&
      cell.getFocusPolicy() != FocusPolicy.ATTRACTS_RECURSIVELY) return cell;

    if (descend && cell instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) cell;
      for (EditorCell childCell : collection) {
        EditorCell focusedCell = findCellWhichAttractsFocus(childCell, true, !childCell.isBigCell() || childCell.getFocusPolicy() == FocusPolicy.ATTRACTS_RECURSIVELY);
        if (focusedCell != null) return focusedCell;
      }
    }

    if (cell.getFocusPolicy() == FocusPolicy.ATTRACTS_RECURSIVELY) {
      return cell;
    }

    return null;
  }
}
