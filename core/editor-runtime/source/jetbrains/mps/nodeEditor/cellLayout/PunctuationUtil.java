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
package jetbrains.mps.nodeEditor.cellLayout;

import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.Padding;
import jetbrains.mps.nodeEditor.style.Measure;
import jetbrains.mps.nodeEditor.EditorSettings;

import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Toolkit;

public class PunctuationUtil {

  
  static void addGaps(EditorCell_Collection editorCells, EditorCell currentCell) {
    int gap = getHorizontalGap(editorCells);

    if (currentCell instanceof EditorCell_Collection &&
          (hasPunctuableLayout((EditorCell_Collection)currentCell) || currentCell.getStyle().get(StyleAttributes.DRAW_BORDER))) {
      return;
    }

    if (hasLeftGap(currentCell)) {
      currentCell.setLeftGap(gap / 2);
    } else {
      currentCell.setLeftGap(0);
    }

    if ((!rightCellHasPunctuationLeft(currentCell) || currentCell.getStyle().get(StyleAttributes.DRAW_BORDER))
          && !hasPunctuationRight(currentCell)) {
      currentCell.setRightGap(gap / 2);
    } else {
      currentCell.setRightGap(0);
    }

  }

  public static boolean hasLeftGap(EditorCell currentCell) {
    return (!leftCellHasPunctuationRight(currentCell) || currentCell.getStyle().get(StyleAttributes.DRAW_BORDER))
          && !hasPunctuationLeft(currentCell);
  }

  static boolean leftCellHasPunctuationRight(EditorCell currentCell) {
    EditorCell_Collection parent = currentCell.getParent();
    if (parent != null && hasPunctuableLayout(parent)) {
      if (parent.getCellLayout() instanceof CellLayout_Indent && CellLayout_Indent.isOnNewLine(parent, currentCell)) {        
        return true;
      }
      int index = parent.getCellNumber(currentCell);
      if (index > 0) {
        EditorCell leftCell = parent.getChildAt(index - 1).getLastLeaf();
        if (parent.getCellLayout() instanceof CellLayout_Indent && CellLayout_Indent.isNewLineAfter(parent, leftCell)) {
          return true;
        }
        if (leftCell.getLastLeaf() instanceof EditorCell_Collection) {
          return leftCellHasPunctuationRight(leftCell);
        } else {
          return hasPunctuationRight(leftCell);
        }
      } else {
        return leftCellHasPunctuationRight(parent);
      }
    }
    return true;
  }

  private static boolean rightCellHasPunctuationLeft(EditorCell currentCell) {
    EditorCell_Collection parent = currentCell.getParent();
    if (parent != null && hasPunctuableLayout(parent)) {
      int index = parent.getCellNumber(currentCell);
      if (index < parent.getChildCount() - 1) {
        EditorCell leftCell = parent.getChildAt(index + 1);
        if (leftCell.getLastLeaf() instanceof EditorCell_Collection) {
          return rightCellHasPunctuationLeft(leftCell);
        } else {
          return hasPunctuationLeft(leftCell);
        }
      } else {
        return rightCellHasPunctuationLeft(parent);
      }
    }
    return true;
  }

  private static Boolean hasPunctuationRight(EditorCell cell) {
    if (cell == null) {
      return true;
    }
    return cell.getLastLeaf().getStyle().get(StyleAttributes.PUNCTUATION_RIGHT);
  }

  static Boolean hasPunctuationLeft(EditorCell cell) {
    if (cell == null) {
      return true;
    }
    return cell.getFirstLeaf().getStyle().get(StyleAttributes.PUNCTUATION_LEFT);
  }

  private static int getHorizontalGap(EditorCell_Collection editorCells) {
    Padding padding = editorCells.getStyle().get(StyleAttributes.HORIZONTAL_GAP);
    if (padding.getType() == Measure.PIXELS) {
      return (int)padding.getValue();
    } else {
      Font f = EditorSettings.getInstance().getDefaultEditorFont();
      FontMetrics m = Toolkit.getDefaultToolkit().getFontMetrics(f);
      return (int)(padding.getValue() * m.charWidth(' '));
    }
  }

  private static boolean hasPunctuableLayout(EditorCell_Collection collection) {
    return collection.getCellLayout() instanceof CellLayout_Horizontal || collection.getCellLayout() instanceof CellLayout_Indent;
  }
}
