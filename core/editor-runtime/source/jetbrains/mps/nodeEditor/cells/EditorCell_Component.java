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
package jetbrains.mps.nodeEditor.cells;

import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.EditorComponent;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class EditorCell_Component extends EditorCell_Basic {
  private JComponent myComponent;

  public EditorCell_Component(EditorContext editorContext, SNode node, JComponent component) {
    super(editorContext, node);
    final EditorComponent nodeEditorComponent = editorContext.getNodeEditorComponent();
    myComponent = component;

    myComponent.addKeyListener(new KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        nodeEditorComponent.sendKeyEvent(e);
      }

      public void keyReleased(KeyEvent e) {
        nodeEditorComponent.sendKeyEvent(e);
      }
    });
  }

  public void setX(int x) {
    myComponent.setLocation(x, myComponent.getY());
    super.setX(x);
  }

  public void setY(int y) {
    myComponent.setLocation(myComponent.getX(), y);
    super.setY(y);
  }

  public void moveTo(int x, int y) {
    super.moveTo(x, y);
    myComponent.setLocation(myX, myY);
  }

  public void relayoutImpl() {
    Dimension preferredSize = myComponent.getPreferredSize();
    myComponent.setSize(preferredSize);
    setWidth(myComponent.getWidth() + myGapLeft + myGapRight);
    setHeight(myComponent.getHeight());
  }

  public boolean isDrawBorder() {
    return false;
  }

  public JComponent getComponent() {
    return myComponent;
  }

  public void paintContent(Graphics g, ParentSettings parentSettings) {
  }

  public int getAscent() {
    if (myComponent == null) {
      LOG.errorWithTrace("my component is null");
      return myHeight;
    }
    FontMetrics metrics = myComponent.getFontMetrics(myComponent.getFont());
    int ascent = metrics.getAscent();
    Border border = myComponent.getBorder();
    if (border != null) {
      ascent += border.getBorderInsets(myComponent).top;
    }
    return ascent;
  }

  public static EditorCell createComponentCell(EditorContext context, SNode node, JComponent component, String cellId) {
    EditorCell_Component editorCell_component = new EditorCell_Component(context, node, component);
    return editorCell_component;
  }

  public TextBuilder renderText() {
    return TextBuilder.fromString("[JComponent " + myComponent.toString() +  " ]");
  }

  protected boolean isSelectionPainted() {
    return false;
  }

  /**
   * looks like not used
   */
  public void paintSelection(Graphics g) {
    paintSelection(g, getSelectionColor(), true);
  }

  @Override
  public void onAdd() {
    super.onAdd();
    getEditor().getCellTracker().addComponentCell(this);
  }

  @Override
  public void onRemove() {
    getEditor().getCellTracker().removeComponentCell(this);
    super.onRemove();
  }

  public String toString() {
    return "ComponentCell";
  }

  @Override
  public boolean canExecuteAction(CellActionType type) {
    switch (type) {
      case COPY: case CUT: case PASTE: case PASTE_AFTER: case PASTE_BEFORE:
        return false;
    }
    return super.canExecuteAction(type);
  }
}
