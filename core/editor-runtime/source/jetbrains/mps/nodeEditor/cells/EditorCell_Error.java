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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.Padding;

/**
 * Author: Sergey Dmitriev
 * Created Oct 2, 2003
 */
public class EditorCell_Error extends EditorCell_Label {
  private String myDefaultText;
  private boolean myEditable;

  public EditorCell_Error(EditorContext editorContext, SNode node, String errorText) {
    this(editorContext, node, errorText, false);
  }

  /**
   * @param editable - there are two different kinds of CEll_Error in MPS:
   * - one (!editable) intended to show error text and then substitute it completely then user type
   *   something e.g. list<|<no type>>
   * - another (editable) allows editing error text directly without replacing it with first types character
   *   e.g. myVariable.|field - in case "field" is not resolved, it should be highlighted as error, but should
   *   be still completely editable
   */
  public EditorCell_Error(EditorContext editorContext, SNode node, String errorText, boolean editable) {
    super(editorContext, node, editable ? errorText : null);
    myDefaultText = errorText;
    setDefaultText(errorText);
    setErrorState(true);
    myEditable = editable;

    getStyle().set(StyleAttributes.PADDING_LEFT, new Padding(0.0));
    getStyle().set(StyleAttributes.PADDING_RIGHT, new Padding(0.0));
  }

  public boolean canPasteText() {
    return isEditable();
  }

  public boolean isValidText(String text) {
    return text.equals(myDefaultText);
  }

  public void synchronizeViewWithModel() {
    setText(myEditable ? myDefaultText : "");
    setDefaultText(myDefaultText);
  }
}
