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

import jetbrains.mps.nodeEditor.cells.CellInfo;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.leftHighlighter.HighlighterBracket.BracketEdge;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.util.*;
import java.util.Map.Entry;

/**
 * User: Alexander Shatalin
 * Date: 02.03.2010
 */
public class BracketsPainter extends AbstractFoldingAreaPainter {
  private int myAreaWidth = -1;
  private HashMap<CellInfo, HighlighterBracket> myBrackets = new HashMap<CellInfo, HighlighterBracket>();
  private boolean myRightToLeft;

  public BracketsPainter(LeftEditorHighlighter leftEditorHighlighter, boolean rightToLeft) {
    super(leftEditorHighlighter);
    myRightToLeft = rightToLeft;
  }

  @Override
  public int getLeftAreaWidth() {
    return myRightToLeft ? super.getLeftAreaWidth() : getAreaWidth();
  }

  @Override
  public int getRightAreaWidth() {
    return myRightToLeft ? getAreaWidth() : super.getRightAreaWidth();
  }

  private int getAreaWidth() {
    if (myAreaWidth < 0) {
      myAreaWidth = relayoutBrackets();
    }
    return myAreaWidth;
  }

  @Override
  public void relayout() {
    myAreaWidth = -1;
  }

  private int relayoutBrackets() {
    for (Iterator<Entry<CellInfo, HighlighterBracket>> it = myBrackets.entrySet().iterator(); it.hasNext();) {
      Entry<CellInfo, HighlighterBracket> nextEntry = it.next();
      if (!nextEntry.getValue().relayout()) {
        // TODO: check if this code is useful 
        it.remove();
      }
    }

    List<BracketEdge> bracketEdges = new ArrayList<BracketEdge>();
    for (HighlighterBracket bracket : myBrackets.values()) {
      bracket.setLevel(1);
      bracketEdges.add(bracket.getBeginningEdge());
      bracketEdges.add(bracket.getEndingEdge());
    }
    Collections.sort(bracketEdges);

    int maxLevel = 0;
    Stack<HighlighterBracket> myBracketsLayoutStack = new Stack<HighlighterBracket>();
    for (int i = 0; i < bracketEdges.size(); i++) {
      BracketEdge edge = bracketEdges.get(i);
      HighlighterBracket bracket = edge.getBracket();
      if (edge.isBeggining()) {
        myBracketsLayoutStack.push(bracket);
      } else {
        HighlighterBracket bracketFromStack = null;
        while (bracketFromStack != bracket) {
          if (bracketFromStack != null) {
            // layout error: last popped bracket corresponds to another ending edge. Skipping this bracket.
            bracketEdges.remove(bracketFromStack.getEndingEdge());
            myBrackets.remove(bracketFromStack.getCell());
          }
          if (!myBracketsLayoutStack.isEmpty()) {
            HighlighterBracket newBracketFromStack = myBracketsLayoutStack.pop();
            if (bracketFromStack != null) {
              // last popped bracket was incorrect - see "layout error" comment above, so copying level informatin from there
              newBracketFromStack.setLevel(Math.max(newBracketFromStack.getLevel(), bracketFromStack.getLevel()));
            }
            bracketFromStack = newBracketFromStack;
          } else {
            break;
          }
        }

        if (bracketFromStack != bracket) {
          // layout error - no bracket corresponding to this endig edge was found in stack. Skipping this bracket.
          myBrackets.remove(bracket.getCell());
        } else {
          if (!myBracketsLayoutStack.isEmpty()) {
            // setting level for next bracket on stack
            HighlighterBracket onTopOfStack = myBracketsLayoutStack.peek();
            onTopOfStack.setLevel(Math.max(onTopOfStack.getLevel(), bracket.getLevel() + 1));
          }
          maxLevel = Math.max(bracket.getLevel(), maxLevel);
        }
      }
    }
    return maxLevel == 0 ? 0 : HighlighterBracket.getBracketWidth(maxLevel);
  }

  @Override
  public void paintInLocalCoordinates(Graphics g) {
    Rectangle clipBounds = g.getClipBounds();
    for (HighlighterBracket bracket : myBrackets.values()) {
      bracket.paint(g, clipBounds);
    }
  }

  @Override
  public int getWeight() {
    return 1;
  }

  public void removeBracket(EditorCell cell) {
    myBrackets.remove(cell.getCellInfo());
    myAreaWidth = -1;
  }

  public void addBracket(EditorCell cell, EditorCell secondCell, Color c) {
    CellInfo info1 = cell.getCellInfo();
    CellInfo info2 = secondCell.getCellInfo();
    myBrackets.put(info1, new HighlighterBracket(info1, info2, c, getEditorComponent(), myRightToLeft));
    myAreaWidth = -1;
  }
}
