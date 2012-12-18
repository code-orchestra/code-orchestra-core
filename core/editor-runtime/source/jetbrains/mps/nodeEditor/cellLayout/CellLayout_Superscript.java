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
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.ScriptKind;

import java.awt.Font;
import java.awt.FontMetrics;

/**
 * Created by IntelliJ IDEA.
 * User: Sergey.Sinchuk
 * Date: Oct 29, 2009
 * Time: 4:44:35 PM
 * To change this template use File | Settings | File Templates.
 */
public class CellLayout_Superscript extends AbstractCellLayout {

  private int myBaseScale = 0;
  private static final double scaleCoo = 0.8;

  public boolean canBeFolded() {
    return true;
  }

  private void applyScalingInt(EditorCell cell, int scale) {
    if (cell instanceof EditorCell_Collection) {
      EditorCell_Collection collection = (EditorCell_Collection) cell;
      CellLayout layout = collection.getCellLayout();
      if (layout instanceof CellLayout_Superscript) ((CellLayout_Superscript) layout).myBaseScale = scale;
      else for (EditorCell c : collection) applyScalingInt(c, scale);
    }
    if (cell instanceof EditorCell_Label) {
      EditorCell_Label label = (EditorCell_Label) cell;
      Integer oldFontSize = label.getStyle().get(StyleAttributes.ORIGINAL_FONT_SIZE);
      Integer fontSize = label.getStyle().get(StyleAttributes.FONT_SIZE);
      if (fontSize == null) fontSize = EditorSettings.getInstance().getFontSize();
      if (oldFontSize == null) {
        oldFontSize = fontSize;
        label.getStyle().set(StyleAttributes.ORIGINAL_FONT_SIZE, oldFontSize);
      }
      fontSize = (int) Math.round(oldFontSize * Math.pow(scaleCoo, scale));
      if (!fontSize.equals(oldFontSize)) label.getStyle().set(StyleAttributes.FONT_SIZE, fontSize);
    }
  }

  public void applyScaling(EditorCell_Collection editorCells) {
    for (EditorCell cell : editorCells) {
      int i = cell.getStyle().get(StyleAttributes.SCRIPT_KIND) != ScriptKind.NORMAL ? 1 : 0;
      applyScalingInt(cell, myBaseScale + i);
    }
  }

  public void doLayout(EditorCell_Collection editorCells) {
    if (CellLayout_Indent_Old.DO_INDENT_EVERYWHERE) {
      CellLayout_Indent_Old._doLayout(editorCells);
      return;
    }
    EditorCell[] cells = editorCells.getContentCells();

    final int x = editorCells.getX();
    final int y = editorCells.getY();
    int width;
    int height;

    int floor1 = 0;
    int floor2 = 0;
    int floor3 = 0;

    int floor1x = x;
    int floor2x = x;
    int floor3x = x;

    applyScaling(editorCells);

    for (EditorCell cell : cells) {
      cell.relayout();
      ScriptKind skind = cell.getStyle().get(StyleAttributes.SCRIPT_KIND);
      int cellHeight = cell.getHeight();
      switch (skind) {
        case NORMAL:
          floor2 = Math.max(floor2, cellHeight);
          break;
        case SUBSCRIPT:
          floor1 = Math.max(floor1, cellHeight);
          break;
        case SUPERSCRIPT:
          floor3 = Math.max(floor3, cellHeight);
          break;
      }
    }

    for (EditorCell cell : cells) {
      ScriptKind skind = cell.getStyle().get(StyleAttributes.SCRIPT_KIND);
      switch (skind) {
        case NORMAL:
          floor2x = Math.max(floor2x, Math.max(floor1x, floor3x));
          cell.setY(y + floor3);
          cell.setX(floor2x);
          floor2x += cell.getWidth();
          floor3x = floor2x;
          floor1x = floor2x;
          break;
        case SUBSCRIPT:
          cell.setX(floor1x);
          cell.setY(y + floor2 + floor3);
          floor1x += cell.getWidth();
          break;
        case SUPERSCRIPT:
          cell.setX(floor3x);
          cell.setY(y);
          floor3x += cell.getWidth();
          break;
      }
    }

    width = Math.max(floor2x, Math.max(floor1x, floor3x)) - x;
    height = floor1 + floor2 + floor3;

    editorCells.setWidth(width);
    editorCells.setHeight(height);
  }

  public TextBuilder doLayoutText(Iterable<EditorCell> editorCells) {
    TextBuilder result = TextBuilder.getEmptyTextBuilder();
    for (EditorCell editorCell : editorCells) {
      result = result.appendToTheBottom(editorCell.renderText());
    }
    return result;
  }

  public int getAscent(EditorCell_Collection editorCells) {
    EditorCell[] cells = editorCells.getContentCells();

    int floor2 = 0;
    int floor3 = 0;

    for (EditorCell cell : cells) {
      cell.relayout();
      ScriptKind skind = cell.getStyle().get(StyleAttributes.SCRIPT_KIND);
      switch (skind) {
        case NORMAL:
          floor2 = Math.max(floor2, cell.getAscent());
          break;
        case SUPERSCRIPT:
          floor3 = Math.max(floor3, cell.getHeight());
          break;
      }
    }
    return floor3 + floor2;
  }

  public int getRightInternalInset(EditorCell_Collection editorCell_collection) {
    EditorCell editorCell = editorCell_collection.firstCell();
    if (editorCell != null) return editorCell.getRightInset();
    else return 0;
  }

  public String toString() {
    return "Vertical";
  }


}
