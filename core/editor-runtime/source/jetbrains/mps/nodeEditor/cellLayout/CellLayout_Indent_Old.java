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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cellLayout.AbstractCellLayout;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell;

/**
 * Author: Sergey Dmitriev
 * Date: Jan 19, 2005
 */
public class CellLayout_Indent_Old extends AbstractCellLayout {

  private static final int INDENT = 20;
  private static Logger LOG = Logger.getLogger(CellLayout_Indent_Old.class);

  public static final boolean DO_INDENT_EVERYWHERE = false;
  public static final String INDENTED = "indented";
  public static final String NEXT_LINE = "next-line";

  public void doLayout(EditorCell_Collection editorCells) {
    _doLayout(editorCells);

  }

  public TextBuilder doLayoutText(Iterable<EditorCell> editorCells) {
    return null;
  }

  public String toString() {
    return "Indent";
  }


  public static void _doLayout(EditorCell_Collection editorCells) {
    EditorCell[] cells = editorCells.getCells();
    final int x = editorCells.getX();
    final int y = editorCells.getY();
    int currentLineWidth = 0;
    int totalWidth = 0;
    int totalHeight = 0;
    int currentLineHeight = 0;
    String nextLineForChildren = editorCells.getStyle().get(StyleAttributes.POSITION_CHILDREN);

    for (EditorCell editorCell : cells) {
      String nextLine = editorCell.getStyle().get(StyleAttributes.POSITION);
      if(nextLine != null) {
        System.out.println("nextLine = "+nextLine);
      }
      if (INDENTED.equals(nextLine) || (nextLine == null && INDENTED.equals(nextLineForChildren))) {
        currentLineWidth = INDENT;
        totalHeight += currentLineHeight;
        currentLineHeight=0;
      }
      else if(NEXT_LINE.equals(nextLine) || (nextLine == null && NEXT_LINE.equals(nextLineForChildren))) {
        currentLineWidth = 0;
        totalHeight += currentLineHeight;
        currentLineHeight=0;
      }
      editorCell.setX(x + currentLineWidth);
      editorCell.setY(y + totalHeight);
      editorCell.relayout();
//      System.out.println("EditorCell [" + editorCell.getX()+","+editorCell.getY()+","+editorCell.getWidth()+","+editorCell.getHeight()+"] node:"+editorCell.getSNode().getConceptShortName()+" cell:"+ editorCell.toString());
      currentLineHeight = Math.max(currentLineHeight, editorCell.getHeight());
      currentLineWidth += editorCell.getWidth();
      totalWidth = Math.max(totalWidth, currentLineWidth);
    }
    editorCells.setWidth(totalWidth);
    editorCells.setHeight(totalHeight+currentLineHeight);
  }
}
