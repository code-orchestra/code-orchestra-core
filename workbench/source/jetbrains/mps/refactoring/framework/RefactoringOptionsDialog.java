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
package jetbrains.mps.refactoring.framework;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;

import javax.swing.JCheckBox;
import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.HeadlessException;

public class RefactoringOptionsDialog extends BaseDialog {
  private RefactoringContext myRefactoringContext;
  private IRefactoring myRefactoring;

  private JCheckBox myIsLocalCheckBox;
  private JCheckBox myGenerateModelsCheckBox;
  private JPanel myInnerPanel;
  private boolean myNeedToBeShown = false;

  private boolean myIsCancelled = true;

  public RefactoringOptionsDialog(Frame mainFrame, RefactoringContext refactoringContext, IRefactoring refactoring, boolean hasModelsToGenerate) throws HeadlessException {
    super(mainFrame, "Refactoring Options");
    myRefactoringContext = refactoringContext;
    myRefactoring = refactoring;
    myInnerPanel = new JPanel(new GridBagLayout());

    GridBagConstraints c = new GridBagConstraints();
    c.gridx = 0;
    c.gridy = GridBagConstraints.RELATIVE;
    c.weightx = 1;
    c.weighty = 0;
    c.anchor = GridBagConstraints.NORTHWEST;

    if (myRefactoring instanceof ILoggableRefactoring) {
      myIsLocalCheckBox = new JCheckBox("is local");
      myIsLocalCheckBox.setSelected(false);
      myInnerPanel.add(myIsLocalCheckBox, c);
      myNeedToBeShown = true;
    }

    if (hasModelsToGenerate) {
      myGenerateModelsCheckBox = new JCheckBox("rebuild models");
      myInnerPanel.add(myGenerateModelsCheckBox, c);
      myGenerateModelsCheckBox.setSelected(true);
      myNeedToBeShown = true;
    }

    c.weighty = 1;
    myInnerPanel.add(new JPanel(), c);
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 300, 250);
  }

  protected JComponent getMainComponent() {
    return myInnerPanel;
  }

  public boolean isCancelled() {
    return myIsCancelled;
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    myIsCancelled = false;
    if (myRefactoring instanceof ILoggableRefactoring) {
      myRefactoringContext.setLocal(myIsLocalCheckBox.isSelected());
    }

    if (myGenerateModelsCheckBox!=null){
      myRefactoringContext.setDoesGenerateModels(myGenerateModelsCheckBox.isSelected());
    } else{
      myRefactoringContext.setDoesGenerateModels(false);
    }

    dispose();
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    dispose();
  }

  public boolean needToBeShown() {
    return myNeedToBeShown;
  }
}
