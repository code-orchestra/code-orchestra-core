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
package jetbrains.mps.workbench.dialogs.project;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.IOperationContext;

import java.awt.HeadlessException;
import java.util.List;

public abstract class BasePropertiesDialog extends BaseTabbedBindedDialog {
  protected BasePropertiesDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(text, operationContext);
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(100, 100, 500, 600);
  }

  @BaseDialog.Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void buttonOK() {
    if (!saveChanges()) return;
    dispose();
  }

  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void buttonCancel() {
    dispose();
  }

  @BaseDialog.Button(position = 2, name = "Apply", mnemonic = 'A')
  public void buttonApply() {
    saveChanges();
  }

  protected String getErrorString() {
    return null;
  }

  protected final boolean checkValidity() {
    String errorString = getErrorString();
    if (errorString != null) {
      setErrorText(errorString);
      return false;
    }
    return true;
  }

  protected String checkStubModels(List<ModelRoot> models) {
    for (ModelRoot me : models) {
      if (me.getManager() == null) {
        return "Manager is not specified for root " + me.getPath();
      }
    }
    return null;
  }
}
