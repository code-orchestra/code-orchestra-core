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

import jetbrains.mps.nodeEditor.AbstractAdditionalPainter;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.CellFinders;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

abstract class EditorCellPainter<E> extends AbstractAdditionalPainter<E> {
  @Nullable
  protected abstract Color getCellBackgroundColor();

  @Nullable
  protected abstract Color getStripeBackgroundColor();

  @Nullable
  protected abstract Color getFrameColor();

  @Nullable
  protected abstract SNode getSNode();

  @Nullable
  protected EditorCell_Label findCell(@NotNull EditorComponent editorComponent) {
    SNode node = getSNode();
    EditorCell_Label innerCell = null;
    if (node != null) {
      EditorCell bigCell = editorComponent.getBigValidCellForNode(node);
      if (bigCell == null) return null;
      if (bigCell instanceof EditorCell_Label) {
        innerCell = (EditorCell_Label) bigCell;
      } else if (bigCell instanceof EditorCell_Collection) {
        EditorCell_Collection collection = (EditorCell_Collection) bigCell;
        innerCell = collection.findChild(CellFinders.byClass(EditorCell_Label.class, true));
      }
    }
    return innerCell;
  }

  @Override
  public boolean paintsAbove() {
    return true;
  }

  @Override
  public boolean paintsBackground() {
    return true;
  }

  @Override
  public void paintBackground(Graphics g, EditorComponent editorComponent) {
    EditorCell_Label innerCell = findCell(editorComponent);
    if (innerCell != null) {
      paintStripe(g, editorComponent, innerCell);
      paintCellBackground(g, editorComponent);
    }
  }

  @Override
  public void paint(Graphics g, EditorComponent editorComponent) {
    EditorCell_Label innerCell = findCell(editorComponent);
    if (innerCell != null) {
      paintCellFrame(g, editorComponent);
    }
  }

  private void paintCellBackground(@NotNull Graphics g, @NotNull EditorComponent editorComponent) {
    EditorCell bigCell = editorComponent.getBigValidCellForNode(getSNode());
    if (bigCell != null && getCellBackgroundColor() != null) {
      g.setColor(getCellBackgroundColor());
      g.fillRect(bigCell.getX(), bigCell.getY(), bigCell.getWidth(), bigCell.getHeight());
    }
  }

  private void paintCellFrame(@NotNull Graphics g, @NotNull EditorComponent editorComponent) {
    EditorCell bigCell = editorComponent.getBigValidCellForNode(getSNode());
    if (bigCell != null && getFrameColor() != null) {
      g.setColor(getFrameColor());
      g.drawRect(bigCell.getX(), bigCell.getY(), bigCell.getWidth() - 1, bigCell.getHeight() - 1);
    }
  }

  @NotNull
  protected Rectangle getBounds(@NotNull EditorComponent editorComponent, @NotNull EditorCell_Label innerCell) {
    int leftMargin = 4;
    return new Rectangle(leftMargin, innerCell.getY(), editorComponent.getWidth() - leftMargin,
      innerCell.getHeight() - innerCell.getTopInset() - innerCell.getBottomInset());
  }

  protected void paintStripe(@NotNull Graphics g, @NotNull EditorComponent editorComponent, @NotNull EditorCell_Label innerCell) {
    g.setColor(getStripeBackgroundColor());
    Rectangle bounds = getBounds(editorComponent, innerCell);
    g.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);
  }
}
