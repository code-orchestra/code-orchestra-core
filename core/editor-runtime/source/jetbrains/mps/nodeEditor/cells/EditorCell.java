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

import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstitutePatternEditor;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Condition;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public interface EditorCell extends Cloneable {
  static final EditorCell[] EMPTY_ARRAY = new EditorCell[0];

  int getX();
  void setX(int x);

  int getY();
  void setY(int y);

  int getWidth();
  void setWidth(int width);

  int getHeight();
  void setHeight(int height);

  int getBaseline();
  void setBaseline(int y);

  int getAscent();
  int getDescent();

  int getEffectiveWidth();
  int getLeftInset();
  int getRightInset();
  int getTopInset();
  int getBottomInset();

  Rectangle getBounds();

  void moveTo(int x, int y);
  
  void paint(Graphics g);
  void paint(Graphics g, ParentSettings parentSettings);
  void paintSelection(Graphics g, Color c, boolean drawBorder);
  void paintSelection(Graphics g, Color c, boolean drawBorder, ParentSettings parentSettings);

  void setSelected(boolean isSelected);
  boolean isSelected();

  void setSelectable(boolean isSelected);
  boolean isSelectable();

  void setCellId(String cellId);
  String getCellId();

  void setRole(String role);
  String getRole();

  SNode getRefNode();
  void setRefNode(SNode refNode);

  // FIXME
  void setLinkDeclaration(SNode link);
  SNode getLinkDeclaration();

  boolean isReferenceCell();

  boolean isErrorState();
  void setErrorState(boolean isError);
  boolean validate(boolean strict, boolean canActivatePopup);

  void relayout();

  TextBuilder renderText();

  boolean processMousePressed(MouseEvent e);

  boolean processKeyPressed(KeyEvent e, boolean allowErrors);
  boolean processKeyTyped(KeyEvent e, boolean allowErrors);

  EditorContext getEditorContext();

  void setCaretX(int x);
  int getCaretX();

  void home();
  void end();

  EditorCell findLeaf(int x, int y);
  EditorCell findLeaf(int x, int y, Condition<EditorCell> condition);
  
  EditorCell findCellWeak(int x, int y);
  EditorCell findCellWeak(int y, Condition<EditorCell> condition);
  EditorCell findCellWeak(int x, int y, Condition<EditorCell> condition);

  EditorCell_Collection getParent();
  boolean isSingleNodeCell();

  void synchronizeViewWithModel();

  SNode getSNode(); 

  SNode getSNodeWRTReference();
  String getCellRole();

  NodeSubstitutePatternEditor createSubstitutePatternEditor();
  void setSubstituteInfo(NodeSubstituteInfo substitueInfo);
  NodeSubstituteInfo getSubstituteInfo();

  EditorCellAction getAction(CellActionType type);
  void setAction(CellActionType type, EditorCellAction action);
  boolean canExecuteAction(CellActionType type);
  boolean executeAction(CellActionType type);
  EditorCellAction getApplicableCellAction(CellActionType type);
  Set<CellActionType> getAvailableActions();

  void addKeyMap(EditorCellKeyMap keyMap);

  EditorCellKeyMap getKeyMap();

  void putUserObject(Object key, Object value);
  Object getUserObject(Object key);

  EditorComponent getEditor();

  void switchCaretVisible();

  boolean isPunctuationLayout();

  Color getCellBackgroundColor();
  void setCellBackgroundColor(Color color);

  CellInfo getCellInfo();

  void setRightTransformAnchorTag(String tag);
  String getRightTransformAnchorTag();
  boolean hasRightTransformAnchorTag(String tag);

  Iterator<EditorCell_Collection> parents();

  boolean isUnderFolded();
  EditorCell_Collection getFoldedAbove();
  EditorCell_Collection findParent(Condition<EditorCell_Collection> condition);

  <C extends EditorCell> C findChild(CellFinder<C> finder, boolean includeThis);
  <C extends EditorCell> C findChild(CellFinder<C> finder);

  boolean isFolded();
  boolean isUnfoldedCollection();
  boolean canBePossiblyFolded();

  EditorCell getRootParent();
  boolean isBigCell();
  boolean isFirstPositionInBigCell();
  boolean isLastPositionInBigCell();

  boolean isLastChild();
  boolean isFirstChild();

  boolean isFirstCaretPosition();
  boolean isLastCaretPosition();

  boolean isOnLeftBoundary();
  boolean isOnRightBoundary();

  EditorCell getContainingBigCell();
  boolean isAncestorOf(EditorCell cell);

  boolean hasFocusPolicy();
  FocusPolicy getFocusPolicy();
  void setFocusPolicy(FocusPolicy fp);

  List<EditorMessage> getMessages();
  <T extends EditorMessage> List<T> getMessages(Class<T> clazz);
  List<EditorMessage> getMessagesForOwner(EditorMessageOwner owner);
  boolean hasErrorMessages();

  EditorCell_Label getSTHintCell();

  Style getStyle();

  boolean isLeaf();

  EditorCell getNextSibling();
  EditorCell getNextSibling(Condition<EditorCell> condition);

  EditorCell getPrevSibling();
  EditorCell getPrevSibling(Condition<EditorCell> condition);

  EditorCell getNextLeaf();
  EditorCell getNextLeaf(Condition<EditorCell> condition);

  EditorCell getPrevLeaf();
  EditorCell getPrevLeaf(Condition<EditorCell> condition);

  EditorCell getFirstLeaf();
  EditorCell getFirstLeaf(Condition<EditorCell> condition);

  EditorCell getLastLeaf();
  EditorCell getLastLeaf(Condition<EditorCell> condition);

  EditorCell getFirstDescendant(Condition<EditorCell> condition);
  EditorCell getLastDescendant(Condition<EditorCell> condition);

  EditorCell getLastChild();
  EditorCell getFirstChild();

  EditorCell getEndCell(Condition<EditorCell> condition);
  EditorCell getHomeCell(Condition<EditorCell> condition);

  EditorCell getLeafToLeft(Condition<EditorCell> condition);
  EditorCell getLeafToRight(Condition<EditorCell> condition);

  boolean isAbove(EditorCell cell);
  boolean isBelow(EditorCell cell);
  boolean isToLeft(EditorCell cell);
  boolean isToRight(EditorCell cell);

  EditorCell getUpper(Condition<EditorCell> condition, int baseX);
  EditorCell getLower(Condition<EditorCell> condition, int baseX);

  void setLeftGap(int gap);
  void setRightGap(int gap);
}
