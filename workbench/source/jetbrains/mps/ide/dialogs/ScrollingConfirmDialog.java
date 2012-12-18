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
package jetbrains.mps.ide.dialogs;

import java.awt.Frame;
import java.awt.HeadlessException;

/**
 * @deprecated Use {@link com.intellij.openapi.ui.Messages#showYesNoCancelDialog} instead
 */
public class ScrollingConfirmDialog extends BaseScrollingTextDialog {
  private Result myResult = Result.CANCEL;

  public ScrollingConfirmDialog(Frame mainFrame, String caption, String text) throws HeadlessException {
    super(mainFrame, caption, text);
  }

  public Result getResult() {
    return myResult;
  }

  @Button(position = 0, name = "Yes", mnemonic = 'Y')
  public void yesButton() {
    myResult = Result.YES;
    dispose();
  }

  @Button(position = 1, name = "No", mnemonic = 'N')
  public void noButton() {
    myResult = Result.NO;
    dispose();
  }

  @Button(position = 2, name = "Cancel", mnemonic = 'C', defaultButton = true)
  public void cancelButton() {
    myResult = Result.CANCEL;
    dispose();
  }

  public static enum Result {
    YES, NO, CANCEL
  }
}
