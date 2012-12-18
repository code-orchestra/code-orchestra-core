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
package jetbrains.mps.workbench.dialogs.project.utildialogs.addmodelimport;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.ide.properties.StandardComponents;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.dialogs.project.BaseStretchingBindedDialog;

import javax.swing.BorderFactory;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.util.Set;

public class AddRequiredModelImportsDialog extends BaseStretchingBindedDialog {
  private boolean myCancelled = true;

  private SModel myTargetModel;
  private ImportProperties myProps;
  private IModule myTargetModule;

  public AddRequiredModelImportsDialog(IOperationContext context,
                                       IModule sourceModule, SModel targetModel,
                                       Set<SModelReference> necessaryModels,
                                       Set<ModuleReference> necessaryLanguages) {
    super("Import Models and Languages", context);
    myTargetModel = targetModel;
    myTargetModule = targetModel.getModelDescriptor().getModule();//todo make more precise

    collectProperties(necessaryModels, necessaryLanguages, sourceModule);
    initUI();
  }

  private void initUI() {
    addComponent(createMessage(), ConstraintsType.FIELD);
    addComponent(StandardComponents.createModelsImportsPanel(this, "Models", myProps), ConstraintsType.LIST);
    addComponent(StandardComponents.createLanguagesImportsPanel(this, "Languages", myProps), ConstraintsType.LIST);
  }

  private JComponent createMessage() {
    JPanel result = new JPanel(new BorderLayout());

    JLabel messageLabel = new JLabel("Do you want to add imported models or languages to the model " + myTargetModel.getSModelFqName() + " ?", JLabel.LEFT);
    result.add(messageLabel, BorderLayout.CENTER);

    result.setBorder(BorderFactory.createEmptyBorder(10, 10, 20, 10));
    return result;
  }

  private void collectProperties(Set<SModelReference> necessaryModels, Set<ModuleReference> necessaryLanguages, IModule sourceModule) {
    myProps = new ImportProperties();
    myProps.loadFrom(necessaryModels, necessaryLanguages, sourceModule, myTargetModule);
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 600, 300);
  }

  public boolean isCancelled() {
    return myCancelled;
  }

  protected String getButtonsPosition() {
    return BorderLayout.CENTER;
  }

  @BaseDialog.Button(position = 0, name = "Import All", mnemonic = 'A', defaultButton = true)
  public void buttonAddAll() {
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        myProps.saveTo(myTargetModule, myTargetModel, true);
        myCancelled = false;
      }
    });
    dispose();
  }

  @BaseDialog.Button(position = 1, name = "Import Selected", mnemonic = 'S')
  public void buttonAddSelected() {
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        myProps.saveTo(myTargetModule, myTargetModel, false);
        myCancelled = false;
      }
    });
    dispose();
  }

  @BaseDialog.Button(position = 2, name = "Import None", mnemonic = 'N')
  public void buttonAddNone() {
    myCancelled = false;
    dispose();
  }

  @BaseDialog.Button(position = 3, name = "Cancel", mnemonic = 'C')
  public void buttonCancel() {
    myCancelled = true;
    dispose();
  }
}
