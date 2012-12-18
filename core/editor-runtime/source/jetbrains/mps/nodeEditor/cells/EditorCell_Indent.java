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

import org.jetbrains.annotations.NotNull;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.Padding;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.EditorSettings;

public class EditorCell_Indent extends EditorCell_Label {
  public EditorCell_Indent(@NotNull EditorContext editorContext, SNode node) {
    super(editorContext, node, getIndentText());
    setSelectable(false);
    setEditable(false);

    getStyle().set(StyleAttributes.PADDING_LEFT, new Padding(0.0));
    getStyle().set(StyleAttributes.PADDING_RIGHT, new Padding(0.0));
    getStyle().set(StyleAttributes.PUNCTUATION_RIGHT, true);
    getStyle().set(StyleAttributes.PUNCTUATION_LEFT, true);
  }

  public static String getIndentText() {
    String result = "";
    for (int i = 0; i < EditorSettings.getInstance().getIndentSize(); i++) {
      result += " ";
    }
    return result;
  }
}
