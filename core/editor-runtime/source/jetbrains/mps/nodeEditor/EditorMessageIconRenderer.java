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

import com.intellij.openapi.actionSystem.AnAction;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;
import javax.swing.JPopupMenu;
import java.awt.Cursor;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 *
 * @see com.intellij.openapi.editor.markup.GutterIconRenderer was used as prototype
 */
public interface EditorMessageIconRenderer {

  Icon getIcon();

  String getTooltipText();

  SNode getNode();

  IconRendererType getType();

  EditorCell getAnchorCell(EditorCell bigCell);

   Cursor getMouseOverCursor();

  AnAction getClickAction();

  JPopupMenu getPopupMenu();

  public class IconRendererType {

    private final int myWeight;

    public IconRendererType(int weight) {
      myWeight = weight;
    }

    public int getWeight() {
      return myWeight;
    }
  }
}