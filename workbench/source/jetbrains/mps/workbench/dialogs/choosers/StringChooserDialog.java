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
package jetbrains.mps.workbench.dialogs.choosers;

import com.intellij.ide.DataManager;
import com.intellij.ide.util.gotoByName.ChooseByNamePopupComponent.Callback;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.choose.string.BaseStringItem;
import jetbrains.mps.workbench.choose.string.BaseStringModel;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import java.awt.Dialog;
import java.awt.Frame;
import java.awt.HeadlessException;
import java.util.ArrayList;
import java.util.List;

class StringChooserDialog extends BaseDialog {
  private List<String> myValues = new ArrayList<String>();
  private SmartChooseByNamePanel myChooser;
  private boolean myIsCancelled = true;
  private boolean myOkDone = false;

  StringChooserDialog(Frame owner, List<String> values, String entity) throws HeadlessException {
    super(owner, "Choose " + entity);
    doInit(values);
  }

  StringChooserDialog(Dialog owner, List<String> values, String entity) throws HeadlessException {
    super(owner, "Choose " + entity);
    doInit(values);
  }

  private void doInit(final List<String> options) {
    setModal(true);
    myValues.addAll(options);
    DataContext dataContext = DataManager.getInstance().getDataContext();
    final Project project = MPSDataKeys.PROJECT.getData(dataContext);

    BaseStringModel goToStringModel = new BaseStringModel(project) {
      public NavigationItem doGetNavigationItem(final String string) {
        return new BaseStringItem(string) {
          public void navigate(boolean requestFocus) {
          }
        };
      }

      @Override
      public String[] find(boolean checkboxState) {
        return myValues.toArray(new String[myValues.size()]);
      }

      public String[] find(IScope scope) {
        throw new UnsupportedOperationException("must not be used");
      }

      @Nullable
      public String getPromptText() {
        return "Select:";
      }

      @Override
      public boolean loadInitialCheckBoxState() {
        return false;
      }
    };

    myChooser = new SmartChooseByNamePanel(goToStringModel, false);
    myChooser.invoke(new Callback() {
      public void elementChosen(Object element) {
        if (!myOkDone) {
          myOkDone = true;
          onOk();
        }
      }
    }, ModalityState.current(), false);
  }

  public boolean stretchMainComponent() {
    return true;
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(100, 100, 500, 600);
  }

  protected JComponent getMainComponent() {
    return myChooser.getPanel();
  }

  public String getResult() {
    if (myIsCancelled) return null;
    BaseStringItem item = (BaseStringItem) myChooser.getChosenElement();
    if (item == null) return null;
    return item.getString();
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    dispose();
    myIsCancelled = false;
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C', defaultButton = false)
  public void onCancel() {
    dispose();
  }
}
