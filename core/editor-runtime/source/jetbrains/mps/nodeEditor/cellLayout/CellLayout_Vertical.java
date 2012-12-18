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

import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.nodeEditor.cellLayout.AbstractCellLayout;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.EditorSettings;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.CellAlign;
import jetbrains.mps.nodeEditor.style.DefaultBaseLine;
import jetbrains.mps.nodeEditor.cells.EditorCell;

import java.awt.Font;
import java.awt.FontMetrics;

/**
 * User: Sergey Dmitriev
 * Date: Jan 19, 2005
 */
public class CellLayout_Vertical extends AbstractCellLayout {
  private boolean myGridLayout = false;

  public void setGridLayout(boolean gridLayout) {
    myGridLayout = gridLayout;
  }

  public boolean canBeFolded() {
    return true;
  }

  public void doLayout(EditorCell_Collection editorCells) {
    if(CellLayout_Indent_Old.DO_INDENT_EVERYWHERE) {
      CellLayout_Indent_Old._doLayout(editorCells);
      return;
    }

    EditorCell[] cells = editorCells.getContentCells();
    EditorCell closingBrace = editorCells.getClosingBrace();
    EditorCell openingBrace = editorCells.getOpeningBrace();
    boolean usesBraces = editorCells.usesBraces();
    if (usesBraces) {
      closingBrace.relayout();
      openingBrace.relayout();
      openingBrace.moveTo(editorCells.getX(), editorCells.getY());      
    }

    final int x = usesBraces ? editorCells.getX() + openingBrace.getWidth() : editorCells.getX();
    final int y = editorCells.getY();
    int lastCellWidth;
    int braceIndent = 0;
    int width = 0;
    int height = 0;
    for (EditorCell editorCell : cells) {
      editorCell.moveTo(x, y + height);      
      editorCell.relayout();
      int cellHeight = editorCell.getHeight();
      int indent = getBracesIndent(editorCell);
      braceIndent = Math.max(indent, braceIndent);
      height += cellHeight /*+ editorCell.getTopInset() + editorCell.getBottomInset()*/;
    }
    for (EditorCell editorCell : cells) {
      lastCellWidth = editorCell.getWidth();
      int indent = getBracesIndent(editorCell);
      int delta = braceIndent - indent;
      width = Math.max(width, lastCellWidth + delta);
    }
    
    for (EditorCell editorCell : cells) {
      int cellX = editorCell.getX();
      int cellY = editorCell.getY();
      int newCellX = cellX;
      CellAlign cellAlign = editorCells.getStyle().get(StyleAttributes.HORIZONTAL_ALIGN);
      if (cellAlign == CellAlign.CENTER && !myGridLayout) {
        newCellX = cellX + (width - editorCell.getWidth()) / 2;
      } else if (cellAlign == CellAlign.RIGHT && !myGridLayout) {
        newCellX = cellX + width - editorCell.getWidth();
      }
      if (newCellX != cellX) editorCell.moveTo(newCellX, cellY);
    }

    editorCells.setArtificialBracesIndent(braceIndent);
    for (EditorCell editorCell : cells) {
      int cellX = editorCell.getX();
      int cellY = editorCell.getY();
      int indent = getBracesIndent(editorCell);
      int newCellX = cellX - indent + braceIndent;
      if (newCellX != cellX) editorCell.moveTo(newCellX, cellY);
    }

    if (myGridLayout) {
      int x0 = x;
      int size = editorCells.getContentCellsCount();
      int[] maxHeights = new int[size];
      for (int j = 0; j < maxHeights.length; j++) {
        maxHeights[j] = 0;
      }
      for (int i = 0; ; i++) {
        int maxWidth = -1;
        int j = 0;
        for (EditorCell editorCell : cells) {
          if (editorCell instanceof EditorCell_Collection) {
            EditorCell_Collection editorCellCollection = (EditorCell_Collection) editorCell;
            CellLayout cellLayout = editorCellCollection.getCellLayout();
            if (cellLayout instanceof CellLayout_Horizontal) {
              if (i < editorCellCollection.getChildCount()) {
                EditorCell cell = editorCellCollection.getChildAt(i);
                cell.setX(x0);
                cell.relayout();
                maxWidth = Math.max(maxWidth, cell.getWidth());
                maxHeights[j] = Math.max(maxHeights[j], cell.getHeight());
              }
            } else {              
              maxHeights[j] = Math.max(maxHeights[j], editorCell.getHeight());
            }
          } else {
            maxHeights[j] = Math.max(maxHeights[j], editorCell.getHeight());
          }
          j++;
        }
        for (EditorCell editorCell : cells) {
          if (editorCell instanceof EditorCell_Collection) {
            EditorCell_Collection editorCellCollection = (EditorCell_Collection) editorCell;
            CellLayout cellLayout = editorCellCollection.getCellLayout();
            if (cellLayout instanceof CellLayout_Horizontal && i < editorCellCollection.getChildCount()) {
              EditorCell cell = editorCellCollection.getChildAt(i);
              cell.setWidth(maxWidth);
            }
          }
        }
        if (maxWidth == -1) {
          break;
        }
        x0 += maxWidth;
      }
      int j = 0;
      height = 0;
      for (EditorCell editorCell : cells) {
        editorCell.moveTo(editorCell.getX(), y + height);
        int deltaHeight = maxHeights[j];
        editorCell.setHeight(deltaHeight);
        height += deltaHeight;
        j++;
      }
      for (EditorCell editorCell : cells) {
        if (editorCell instanceof EditorCell_Collection) {
          EditorCell_Collection editorCellCollection = (EditorCell_Collection) editorCell;
          CellLayout cellLayout = editorCellCollection.getCellLayout();
          if (cellLayout instanceof CellLayout_Horizontal) {
            int width0 = 0;
            for (EditorCell cell : editorCellCollection) {
              width0 += cell.getWidth();
            }
            editorCellCollection.setWidth(width0);
            width = Math.max(width, width0);
          }
        }
      }
    }
    if (usesBraces) {
      closingBrace.setY(y + height - closingBrace.getHeight());
      if (myGridLayout) {
        closingBrace.setX(x + width);
        width += closingBrace.getWidth();
      } else {
        EditorCell lastCell = editorCells.lastContentCell();
        while (lastCell.isUnfoldedCollection()) {
          lastCell = ((EditorCell_Collection)lastCell).lastCell();
        }
        closingBrace.setX(lastCell.getX() + lastCell.getWidth()/*x + lastCellWidth*/);
        width = Math.max(width, (closingBrace.getX() - x) + closingBrace.getWidth());
      }
      width += openingBrace.getWidth();
    }
    editorCells.setWidth(width);
    editorCells.setHeight(height);
  }

  private int getBracesIndent(EditorCell cell) {
    if (cell instanceof EditorCell_Collection) return ((EditorCell_Collection) cell).getBracesIndent();
    return 0;
  }

  public int getRightInternalInset(EditorCell_Collection editorCell_collection) {
    EditorCell editorCell = editorCell_collection.firstCell();
    if (editorCell == null) return 0;
    return editorCell.getRightInset();
  }

  public TextBuilder doLayoutText(Iterable<EditorCell> editorCells) {
    TextBuilder result = TextBuilder.getEmptyTextBuilder();
    for (EditorCell editorCell : editorCells) {
      result = result.appendToTheBottom(editorCell.renderText());
    }
    return result;
  }

  public int getAscent(EditorCell_Collection editorCells) {
    for (EditorCell cell : editorCells.getCells()) {
      if (cell.getStyle().get(StyleAttributes.BASE_LINE_CELL)) {
        return cell.getY() - editorCells.getY() + cell.getAscent();
      }
    }

    DefaultBaseLine bL = editorCells.getStyle().get(StyleAttributes.DEFAULT_BASE_LINE);

    int result = 0;
    for (EditorCell cell : editorCells.getCells()) {
      result = cell.getAscent();
      if (result > 0) {
        break;
      }
    }    

    switch (bL) {
      case FIRST: // default behavior
        return result;
      case CENTER:
        return Math.max(result,editorCells.getHeight() / 2);
      case LAST:
        EditorCell lastCell = editorCells.getCellAt(editorCells.getCellsCount()-1);
        if (lastCell != null) {
          return lastCell.getY() - editorCells.getY() + lastCell.getAscent();
        }
    }

    return 0;
  }

  public String toString() {
    return "Vertical";
  }
}
