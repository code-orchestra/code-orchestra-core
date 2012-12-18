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
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;

import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.event.MouseEvent;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * User: Alexander Shatalin
 * Date: 02.03.2010
 */
public class FoldingButtonsPainter extends AbstractFoldingAreaPainter {
  private Map<CellInfo, FoldingButton> myFoldingButtons = new HashMap<CellInfo, FoldingButton>();
  private FoldingButton myButtonUnderMouse;
  private boolean myNeedsRelayout = false;

  public FoldingButtonsPainter(LeftEditorHighlighter leftHighlighter) {
    super(leftHighlighter);
  }

  @Override
  public void editorRebuilt() {
    myFoldingButtons.clear();
    EditorComponent editorComponent = getEditorComponent();
    for (EditorCell_Collection foldable : editorComponent.getCellTracker().getFoldableCells()) {
      assert foldable.getEditor() == editorComponent : "cell must be from my editor";
      myFoldingButtons.put(foldable.getCellInfo(), new FoldingButton(foldable, getLeftHighlighter().getBackground()));
    }
    myNeedsRelayout = true;
  }

  @Override
  public void relayout() {
    myNeedsRelayout = true;
  }

  private void doRelayout() {
    for (Iterator<Entry<CellInfo, FoldingButton>> it = myFoldingButtons.entrySet().iterator(); it.hasNext();) {
      Entry<CellInfo, FoldingButton> nextEntry = it.next();
      if (!nextEntry.getValue().relayout()) {
        it.remove();
      }
    }
  }

  @Override
  public int getLeftAreaWidth() {
    return myFoldingButtons.isEmpty() ? 0 : FoldingButton.HALF_WIDTH;
  }

  @Override
  public int getRightAreaWidth() {
    // same as leftAreaWidth
    return getLeftAreaWidth();
  }

  @Override
  public void paintInLocalCoordinates(Graphics g) {
    if (myNeedsRelayout) {
      myNeedsRelayout = false;
      doRelayout();
    }
    Rectangle clipBounds = g.getClipBounds();
    // Painting mouse over feedback "below" all other folding buttons
    for (FoldingButton button : myFoldingButtons.values()) {
      if (isVisible(button, clipBounds)) {
        button.paintFeedback(g);
      }
    }
    for (FoldingButton button : myFoldingButtons.values()) {
      if (isVisible(button, clipBounds)) {
        button.paint(g);
      }
    }
  }

  private boolean isVisible(FoldingButton button, Rectangle clipBounds) {
    return !(clipBounds.y + clipBounds.height < button.getY() ||
      clipBounds.y > button.getY() + button.getHeight() ||
      clipBounds.x + clipBounds.width < -FoldingButton.HALF_WIDTH ||
      clipBounds.x > FoldingButton.HALF_WIDTH);
  }

  @Override
  public void mouseMoved(MouseEvent e) {
    FoldingButton newButtonUnderMouse = getFoldingButtonUnderMouse(e);
    if (newButtonUnderMouse != null) {
      e.consume();
    }
    if (newButtonUnderMouse == myButtonUnderMouse) {
      return;
    }
    if (myButtonUnderMouse != null) {
      myButtonUnderMouse.mouseExited(getLeftHighlighter());
      repaint(myButtonUnderMouse);
    }
    if (newButtonUnderMouse != null) {
      newButtonUnderMouse.mouseEntered(getLeftHighlighter());
      repaint(newButtonUnderMouse);
    }
    myButtonUnderMouse = newButtonUnderMouse;
  }

  @Override
  public void mouseExited(MouseEvent e) {
    if (myButtonUnderMouse != null) {
      myButtonUnderMouse.mouseExited(getLeftHighlighter());
      repaint(myButtonUnderMouse);
      myButtonUnderMouse = null;
    }
  }

  @Override
  public void mousePressed(MouseEvent e) {
    if (e.getButton() != MouseEvent.BUTTON1) {
      return;
    }
    FoldingButton buttonUnderMouse = getFoldingButtonUnderMouse(e);
    if (buttonUnderMouse != null) {
      if (e.getID() == MouseEvent.MOUSE_CLICKED) {
        buttonUnderMouse.activate(getLocalXCoordinate(e), e.getY());
      }
      e.consume();
    }
  }

  @Override
  public int getWeight() {
    return 2;
  }

  private FoldingButton getFoldingButtonUnderMouse(MouseEvent e) {
    int x = getLocalXCoordinate(e);
    int y = e.getY();
    for (FoldingButton button : myFoldingButtons.values()) {
      if (button.isInside(x, y)) {
        return button;
      }
    }
    return null;
  }

  private void repaint(FoldingButton buttonUnderMouse) {
    repaint(buttonUnderMouse.getY(), buttonUnderMouse.getHeight());
  }
}
