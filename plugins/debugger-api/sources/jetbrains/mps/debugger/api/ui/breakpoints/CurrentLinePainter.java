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
package jetbrains.mps.debugger.api.ui.breakpoints;

import jetbrains.mps.nodeEditor.AdditionalPainter;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

class CurrentLinePainter extends EditorCellPainter<SNode> {
  private static final Color STRIPE_COLOR = new Color(0, 0, 255);

  @NotNull
  private final SNode myNode;
  private boolean myInvisible = false;
  private Rectangle myCachedCoverageArea = null;

  public CurrentLinePainter(SNode pointer) {
    myNode = pointer;
  }

  @Override
  @NotNull
  public SNode getItem() {
    return myNode;
  }

  @Override
  protected Color getCellBackgroundColor() {
    return null;
  }

  @Override
  protected Color getStripeBackgroundColor() {
    return STRIPE_COLOR;
  }

  @Override
  protected Color getFrameColor() {
    return Color.black;
  }

  @Override
  protected SNode getSNode() {
    return getItem();
  }

  @Override
  public Rectangle getCoverageArea(EditorComponent editorComponent) {
    if (myInvisible) return null;
    if (myCachedCoverageArea != null) {
      return myCachedCoverageArea;
    }
    EditorCell_Label cell = findCell(editorComponent);
    if (cell == null) return null;
    myCachedCoverageArea = getBounds(editorComponent, cell);
    return myCachedCoverageArea;//new Rectangle(bounds.x + 1, bounds.y + 1, bounds.width - 1, bounds.height - 1);
  }

  @Override
  public Color getCellsFontColor(EditorCell_Label cell) {
    if (myInvisible) return null;
    return Color.WHITE;
  }

  @Override
  public boolean isAbove(AdditionalPainter additionalPainter, EditorComponent editorComponent) {
    if (additionalPainter instanceof BreakpointPainter) {
      return true;
    }
    return false;
  }

  @Override
  public void paint(Graphics g, EditorComponent editorComponent) {
    if (myInvisible) return;
    super.paint(g, editorComponent);
  }

  public void setVisible(boolean visible) {
    myInvisible = !visible;
    myCachedCoverageArea = null;
  }

  @Override
  public boolean paintsBackground() {
    return !myInvisible;
  }

  @Override
  public void beforeRemoval(EditorComponent editorComponent) {
    super.beforeRemoval(editorComponent);
    myCachedCoverageArea = null;
  }
}