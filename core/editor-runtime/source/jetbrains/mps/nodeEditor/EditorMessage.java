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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.errors.MessageStatus;
import jetbrains.mps.errors.QuickFixProvider;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;

import java.awt.*;
import java.util.*;
import java.util.List;

public interface EditorMessage {
  int getStart(EditorComponent editorComponent);

  int getHeight(EditorComponent editorComponent);

  void doNavigate(EditorComponent editorComponent);

  boolean isValid(EditorComponent editorComponent);

  String getMessage();

  SNode getNode();

  MessageStatus getStatus();

  Color getColor();

  EditorMessageOwner getOwner();

  EditorCell getCell(EditorComponent editorComponent);

  EditorCell getCellForParentNodeInMainEditor(EditorComponent editor);

  boolean acceptCell(EditorCell cell, EditorComponent editor);

  void paint(Graphics g, EditorComponent editorComponent, EditorCell cell);

  boolean isBackground();

  boolean sameAs(EditorMessage message);

  QuickFixProvider getIntentionProvider();

  List<QuickFixProvider> getIntentionProviders();

  public void putUserObject(Object key, Object value);
  public Object getUserObject(Object key);

  LocationOnCell getLocationOnCell();

  boolean isLongInGutter();

  Color getColorInGutter();

  int getPriority();

  boolean showInGutter();
}
