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
package jetbrains.mps.nodeEditor.leftHighlighter;

import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.CellInfo;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import org.jetbrains.annotations.NotNull;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

/**
 * User: Alexander Shatalin
 * Date: 02.03.2010
 */
public class HighlighterBracket {
  private static final int BRACKET_LINE_THICKNESS = 2;
  private static final int ADDITIONAL_HORIZONTAL_SHIFT = 3;

  private BracketEdge myBegginingEdge = new BracketEdge(0, true);
  private BracketEdge myEndingEdge = new BracketEdge(0, false);
  private Color myColor;
  private CellInfo myCellInfo;
  private EditorComponent myEditor;
  private CellInfo mySecondCellInfo;
  // level should be at least 1 
  private int myLevel = 1;
  private boolean myRightToLeft;

  public static int getBracketWidth(int level) {
    return 2 * BRACKET_LINE_THICKNESS + (level - 1) * BRACKET_LINE_THICKNESS * 3 / 2 + ADDITIONAL_HORIZONTAL_SHIFT;
  }

  public HighlighterBracket(CellInfo cellInfo, CellInfo secondCellInfo, Color c, EditorComponent editorComponent, boolean rightToLeft) {
    myColor = c;
    myEditor = editorComponent;
    myCellInfo = cellInfo;
    mySecondCellInfo = secondCellInfo;
    myRightToLeft = rightToLeft;
    relayout();
  }

  public boolean relayout() {
    EditorCell cell1 = myCellInfo.findCell(myEditor);
    EditorCell cell2 = mySecondCellInfo.findCell(myEditor);
    if (cell1 != null && cell2 != null) {
      if (cell1.getY() <= cell2.getY()) {
        setY1(cell1.getY());
        setY2(cell2.getY() + cell2.getHeight());
      } else {
        setY1(cell2.getY());
        setY2(cell1.getY() + cell1.getHeight());
      }
      return true;
    } else {
      return false;
    }
  }

  public BracketEdge getBeginningEdge() {
    return myBegginingEdge;
  }

  public BracketEdge getEndingEdge() {
    return myEndingEdge;
  }

  public void paint(Graphics g, Rectangle clipBounds) {
    if (clipBounds.y + clipBounds.height < getY1() || clipBounds.y > getY2()) {
      return;
    }
    int bracketWidth = getBracketWidth(getLevel());
    if (clipBounds.x + clipBounds.width < (myRightToLeft ? 0 : -bracketWidth) || clipBounds.x > (myRightToLeft ? bracketWidth : 0)) {
      return;
    }
    g.setColor(myColor);
    int horizontalSegmentLength = bracketWidth - BRACKET_LINE_THICKNESS - ADDITIONAL_HORIZONTAL_SHIFT;
    g.fillRect(getHorizontalSegmentStartX(horizontalSegmentLength), getY1(), horizontalSegmentLength, BRACKET_LINE_THICKNESS);
    g.fillRect(getVerticalSegmentStartX(bracketWidth), getY1(), BRACKET_LINE_THICKNESS, getY2() - getY1());
    g.fillRect(getHorizontalSegmentStartX(horizontalSegmentLength), getY2() - BRACKET_LINE_THICKNESS, horizontalSegmentLength, BRACKET_LINE_THICKNESS);
  }

  private int getHorizontalSegmentStartX(int horizontalSegmentLength) {
    // +1 is added here because of Graphics.fillRect() specific see javadoc for details
    return myRightToLeft ? ADDITIONAL_HORIZONTAL_SHIFT + 1 : -horizontalSegmentLength - ADDITIONAL_HORIZONTAL_SHIFT;
  }

  private int getVerticalSegmentStartX(int bracketWidth) {
    // +1 is added here because of Graphics.fillRect() specific see javadoc for details
    return myRightToLeft ? bracketWidth - BRACKET_LINE_THICKNESS + 1 : -bracketWidth;
  }

  public CellInfo getCell() {
    return myCellInfo;
  }

  private int getY1() {
    return myBegginingEdge.myY;
  }

  private void setY1(int y1) {
    myBegginingEdge.myY = y1;
  }

  private int getY2() {
    return myEndingEdge.myY;
  }

  private void setY2(int y2) {
    myEndingEdge.myY = y2;
  }

  public void setLevel(int level) {
    myLevel = level;
  }

  public int getLevel() {
    return myLevel;
  }

  public class BracketEdge implements Comparable<BracketEdge> {
    public int myY;
    private boolean myBeginning;

    public BracketEdge(int y, boolean beginning) {
      myY = y;
      myBeginning = beginning;
    }

    @NotNull
    public HighlighterBracket getBracket() {
      return HighlighterBracket.this;
    }

    public boolean isBeggining() {
      return myBeginning;
    }

    public int compareTo(BracketEdge o) {
      if (myY == o.myY) {
        if (isBeggining() && !o.isBeggining()) {
          return 1;
        } else if (isBeggining() && o.isBeggining()) {
          return o.getBracket().getY2() - getBracket().getY2();
        } else if (!isBeggining() && o.isBeggining()) {
          return -1;
        } else if (!isBeggining() && !o.isBeggining()) {
          return o.getBracket().getY1() - getBracket().getY1();
        }
      }
      return myY - o.myY;
    }
  }
}
