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
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.actions.goTo.matcher.DefaultMatcherFactory;
import jetbrains.mps.workbench.choose.modules.BaseModuleItem;
import jetbrains.mps.workbench.choose.modules.BaseModuleModel;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import java.awt.Dialog;
import java.awt.Frame;
import java.awt.HeadlessException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class ModuleChooserDialog extends BaseDialog {
  private List<ModuleReference> myModules = new ArrayList<ModuleReference>();
  private List<ModuleReference> myNonProjectModules = new ArrayList<ModuleReference>();
  private SmartChooseByNamePanel myChooser;
  private boolean myIsCancelled = true;
  private boolean myOkDone = false;
  private boolean myIsMultipleSelection = false;

  ModuleChooserDialog(Frame owner, List<ModuleReference> modules, @Nullable List<ModuleReference> nonProjectModules, String entityString, boolean multiSelection) throws HeadlessException {
    super(owner, "Choose " + entityString);
    myIsMultipleSelection = multiSelection;
    doInit(modules, nonProjectModules, NameUtil.capitalize(entityString));
  }

  ModuleChooserDialog(Dialog owner, List<ModuleReference> modules, @Nullable List<ModuleReference> nonProjectModules, String entityString, boolean multiSelection) throws HeadlessException {
    super(owner, "Choose " + entityString);
    myIsMultipleSelection = multiSelection;
    doInit(modules, nonProjectModules, NameUtil.capitalize(entityString));
  }

  private void doInit(final List<ModuleReference> options, List<ModuleReference> nonProjectLanguages, final String entityString) {
    setModal(true);
    myModules.addAll(options);
    if (nonProjectLanguages != null) {
      myNonProjectModules.addAll(nonProjectLanguages);
    }

    DataContext dataContext = DataManager.getInstance().getDataContext();
    final Project project = MPSDataKeys.PROJECT.getData(dataContext);

    BaseModuleModel goToModuleModel = new BaseModuleModel(project, entityString) {
      public NavigationItem doGetNavigationItem(final ModuleReference module) {
        return new BaseModuleItem(module) {
          public void navigate(boolean requestFocus) {
          }
        };
      }

      public ModuleReference[] find(boolean checkboxState) {
        if (checkboxState) {
          return myNonProjectModules.toArray(new ModuleReference[myNonProjectModules.size()]);
        } else {
          return myModules.toArray(new ModuleReference[myModules.size()]);
        }
      }

      public ModuleReference[] find(IScope scope) {
        throw new UnsupportedOperationException("must not be used");
      }

      @Override
      public boolean loadInitialCheckBoxState() {
        return false;
      }
    };

    myChooser = new SmartChooseByNamePanel(goToModuleModel, !myNonProjectModules.isEmpty(), DefaultMatcherFactory.createAllMatcher(goToModuleModel));
    myChooser.invoke(new Callback() {
      public void elementChosen(Object element) {
        if (!myOkDone) {
          myOkDone = true;
          onOk();
        }
      }
    }, ModalityState.current(), myIsMultipleSelection);
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

  public List<ModuleReference> getResult() {
    List<ModuleReference> result = new ArrayList<ModuleReference>();
    if (myIsCancelled) return result;
    List<Object> choosen = Collections.unmodifiableList(myChooser.getChosenElements());
    for (Object item : choosen) {
      if (item instanceof BaseModuleItem) {
        BaseModuleItem moduleItem = (BaseModuleItem) item;
        result.add(moduleItem.getModuleReference());
      }
    }
    return result;
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    myIsCancelled = false;
    dispose();
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C', defaultButton = false)
  public void onCancel() {
    dispose();
  }
}
