/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
import com.intellij.navigation.ItemPresentation;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.ASPackageTreeNode;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.actions.goTo.matcher.DefaultMatcherFactory;
import jetbrains.mps.workbench.choose.models.*;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.awt.Dialog;
import java.awt.Frame;
import java.awt.HeadlessException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class ModelByModuleChooserDialog extends BaseDialog {
  private List<SModelReferenceByModule> myModels = new ArrayList<SModelReferenceByModule>();
  private List<SModelReferenceByModule> myNonProjectModels = new ArrayList<SModelReferenceByModule>();
  private SmartChooseByNamePanel myChooser;
  private boolean myIsCancelled = true;
  private boolean myOkDone = false;
  private boolean myIsMultipleSelection = false;

  ModelByModuleChooserDialog(Frame owner, List<SModelReferenceByModule> models, @Nullable List<SModelReferenceByModule> nonProjectModels, boolean multiSelection, String title) throws HeadlessException {
    super(owner, title == null ? "Choose Package" : title);
    myIsMultipleSelection = multiSelection;
    doInit(models, nonProjectModels);
  }

  ModelByModuleChooserDialog(Frame owner, List<SModelReferenceByModule> models, @Nullable List<SModelReferenceByModule> nonProjectModels, boolean multiSelection) throws HeadlessException {
    this(owner, models, nonProjectModels, multiSelection, null);
  }

  ModelByModuleChooserDialog(Dialog owner, List<SModelReferenceByModule> models, @Nullable List<SModelReferenceByModule> nonProjectModels, boolean multiSelection, String title) throws HeadlessException {
    super(owner, title == null ? "Choose Package" : title);
    myIsMultipleSelection = multiSelection;
    doInit(models, nonProjectModels);
  }

  ModelByModuleChooserDialog(Dialog owner, List<SModelReferenceByModule> models, @Nullable List<SModelReferenceByModule> nonProjectModels, boolean multiSelection) throws HeadlessException {
    this(owner, models, nonProjectModels, multiSelection, null);
  }

  private void doInit(final List<SModelReferenceByModule> options, @Nullable List<SModelReferenceByModule> nonProjectModels) {
    setModal(true);
    myModels.addAll(options);
    if (nonProjectModels != null) {
      myNonProjectModels.addAll(nonProjectModels);
    }

    DataContext dataContext = DataManager.getInstance().getDataContext();
    final Project project = MPSDataKeys.PROJECT.getData(dataContext);

    BaseModelByModuleModel goToModelModel = new BaseModelByModuleModel(project) {
      public NavigationItem doGetNavigationItem(final SModelReferenceByModule modelReferenceByModule) {
        return new BaseModelByModuleItem(modelReferenceByModule) {
          public void navigate(boolean requestFocus) {
          }
        };
      }

      @Override
      public SModelReferenceByModule[] find(boolean checkboxState) {
        if (checkboxState) {
          return myNonProjectModels.toArray(new SModelReferenceByModule[myNonProjectModels.size()]);
        } else {
          return myModels.toArray(new SModelReferenceByModule[myModels.size()]);
        }
      }

      @Override
      public boolean loadInitialCheckBoxState() {
        return false;
      }
    };

    myChooser = new SmartChooseByNamePanel(goToModelModel, !myNonProjectModels.isEmpty(), DefaultMatcherFactory.createAllMatcher(goToModelModel));
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

  public List<SModelReferenceByModule> getResult() {
    List<SModelReferenceByModule> result = new ArrayList<SModelReferenceByModule>();
    if (myIsCancelled) return result;
    List<Object> choosen = Collections.unmodifiableList(myChooser.getChosenElements());
    for (Object item : choosen) {
      if (item instanceof BaseModelByModuleItem) {
        BaseModelByModuleItem modelByModuleItem = (BaseModelByModuleItem) item;
        result.add(modelByModuleItem.getModelByModuleReference());
      }
    }
    return result;
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
