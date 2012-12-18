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
package jetbrains.mps.util;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.DocumentFilter;

/**
 * @author Kostik
 */
public class IntegerValueDocumentFilter extends DocumentFilter {
  public void remove(FilterBypass fb, int offset, int length) throws BadLocationException {
    StringBuilder text = getDocumentText(fb);
    text.delete(offset, offset + length);
    boolean empty = text.toString().equals("");
    if (empty) {
      text.append("0");
    }
    if (isValidText(text.toString())) {
      super.remove(fb, offset, length);
      if (empty) {
        super.insertString(fb, 0, "0", null);
      }
      textChanged();
    }
  }

  public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) throws BadLocationException {
    StringBuilder text = getDocumentText(fb);
    text.insert(offset, string);
    if (isValidText(text.toString())) {
      super.insertString(fb, offset, string, attr);
      textChanged();
    }
  }

  public void replace(FilterBypass fb, int offset, int length, String text, AttributeSet attrs) throws BadLocationException {
    StringBuilder documentText = getDocumentText(fb);
    documentText.replace(offset, offset + length, text);
    if (documentText.toString().equals("")) {
      documentText.append("0");
      text = "0";
    }
    if (isValidText(documentText.toString())) {
      super.replace(fb, offset, length, text, attrs);
      textChanged();
    }
  }

  private StringBuilder getDocumentText(FilterBypass fb) throws BadLocationException {
    return new StringBuilder(fb.getDocument().getText(0, fb.getDocument().getLength()));
  }

  protected boolean isValidText(String text) {
    try {
      Integer.parseInt(text);
      return true;
    } catch (NumberFormatException e) {
      return false;
    }
  }

  protected void textChanged() {

  }
}
