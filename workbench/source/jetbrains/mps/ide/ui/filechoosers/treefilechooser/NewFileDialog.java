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
package jetbrains.mps.ide.ui.filechoosers.treefilechooser;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.HeadlessException;

public class NewFileDialog extends BaseDialog {
  private JPanel myPanel;
  private JTextField myTextArea;
  @Nullable
  private String myResult = null;

  public NewFileDialog(Frame mainFrame) throws HeadlessException {
    super(mainFrame, "New Folder");

    myPanel = new JPanel(new BorderLayout());

    myTextArea = new JTextField("New Folder", 20);
    JLabel label = new JLabel("Name:");

    myPanel.add(myTextArea, BorderLayout.CENTER);
    myPanel.add(label, BorderLayout.WEST);

    setPreferredSize(getDefaultDimensionSettings().getDimensions());
    setSize(getDefaultDimensionSettings().getDimensions());
    setModal(true);
  }


  @BaseDialog.Button(position = 0, name = "Create", mnemonic = 'r', defaultButton = true)
  public void createButton() {
    myResult = myTextArea.getText();
    dispose();
  }

  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void cancelButton() {
    dispose();
  }

  @Nullable
  public String getResult() {
    return myResult;
  }

  public DialogDimensions getDefaultDimensionSettings() {
    int w = 200;
    int h = 30;
    if (myTextArea != null) {
      w = (int) Math.round(myTextArea.getPreferredSize().getWidth());
      h = (int) Math.round(myTextArea.getPreferredSize().getHeight());
    }
    return new DialogDimensions(300, 300, w + 50, h + 90);
  }

  protected JComponent getMainComponent() {
    return myPanel;
  }
}
