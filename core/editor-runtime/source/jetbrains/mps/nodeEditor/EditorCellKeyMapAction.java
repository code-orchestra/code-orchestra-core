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

import jetbrains.mps.util.NameUtil;
import jetbrains.mps.smodel.SNode;

import javax.swing.KeyStroke;
import java.awt.event.KeyEvent;
import java.util.List;

/**
 * Author: Sergey Dmitriev
 * Created Nov 4, 2003
 */
public abstract class EditorCellKeyMapAction {
  public static final int CARET_AT_ANY_POSITION = 0;
  public static final int CARET_AT_FIRST_POSITION = 1;
  public static final int CARET_AT_LAST_POSITION = 2;
  public static final int CARET_AT_INTERMEDIATE_POSITION = 3;

  private int myCaretPolicy;
  private boolean myShownInPopupMenu = false;

  public boolean canExecute(KeyEvent keyEvent, EditorContext context) {
    return true;
  }

  public abstract void execute(KeyEvent keyEvent, EditorContext context);

  public String getDescriptionText() {
    return null;
  }

  public int getCaretPolicy() {
    return myCaretPolicy;
  }

  public void setCaretPolicy(int policy) {
    myCaretPolicy = policy;
  }

  public boolean isMenuAlwaysShown() {
    return false;
  }

  public boolean isShownInPopupMenu() {
    return myShownInPopupMenu;
  }

  public void setShownInPopupMenu(boolean toShow) {
    myShownInPopupMenu = toShow;
  }

  public String getKeyStroke() {
    return "";
  }

  protected List<SNode> getSelectedNodes(EditorContext context) {
    return context.getNodeEditorComponent().getSelectedNodes();
  }
}
