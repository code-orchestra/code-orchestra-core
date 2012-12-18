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
package jetbrains.mps.ide.refactoring;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task.Modal;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.generator.GenParameters;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.make.MakeSession;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.structure.project.testconfigurations.IllegalGeneratorConfigurationException;
import jetbrains.mps.project.structure.project.testconfigurations.ModuleTestConfiguration;
import jetbrains.mps.refactoring.renameLanguage.LanguageRenamer;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.resources.ModelsToResources;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import java.awt.*;
import java.util.LinkedHashSet;
import java.util.Set;

public class RenameLanguageDialog extends BaseDialog {
  private JPanel myMainPanel;
  private JTextField myLanguageNameField;
  private JCheckBox myRegenerateLanguage;

  private Language myLanguage;
  private Project myProject;

  public RenameLanguageDialog(Frame frame, Project project, Language language) throws HeadlessException {
    super(frame);
    myLanguage = language;
    myProject = project;

    setTitle("Rename Language");
    myMainPanel = new JPanel(new GridBagLayout());

    GridBagConstraints cLabel = new GridBagConstraints(0, 0, 1, 1, 0, 0, GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
    myMainPanel.add(new JLabel("Language name"), cLabel);

    GridBagConstraints cNameField = new GridBagConstraints(1, 0, 1, 1, 1, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
    myLanguageNameField = new JTextField(myLanguage.getModuleFqName(), 30);
    myMainPanel.add(myLanguageNameField, cNameField);

    GridBagConstraints cCheckbox = new GridBagConstraints(0, 1, 2, 1, 1, 1, GridBagConstraints.NORTHWEST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
    myRegenerateLanguage = new JCheckBox("Rebuild Language");
    myRegenerateLanguage.getModel().setSelected(ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        return !myLanguage.isBootstrap();
      }
    }));
    myMainPanel.add(myRegenerateLanguage, cCheckbox);
  }

  protected JComponent getMainComponent() {
    return myMainPanel;
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(300, 300, 400, 200);
  }

  @BaseDialog.Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void buttonOk() {
    final boolean needToRegenerate = myRegenerateLanguage.getModel().isSelected();


    final String fqName = myLanguageNameField.getText();
    if (MPSModuleRepository.getInstance().getModuleByUID(fqName) != null) {
      setErrorText("Duplicate language name");
      return;
    }

    final LanguageRenamer renamer = new LanguageRenamer(myProject, myLanguage, fqName);
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        renamer.rename(needToRegenerate);
      }
    });

    ProgressManager.getInstance().run(new Modal(myProject, "Updating language references...", false) {
      @Override
      public void run(@NotNull ProgressIndicator indicator) {
        indicator.pushState();
        try {
          indicator.setIndeterminate(true);
          ModelAccess.instance().runWriteInEDT(new Runnable() {
            public void run() {
              renamer.update();
            }
          });
        } finally {
          indicator.popState();
        }
      }
    });

    if (needToRegenerate) {
      final Set<Language> langs = new LinkedHashSet<Language>();
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          langs.add(myLanguage);
          langs.addAll(MPSModuleRepository.getInstance().getAllExtendingLanguages(myLanguage));
        }
      });

      for (final Language l : langs) {
        GenParameters params = ModelAccess.instance().runReadAction(new Computable<GenParameters>() {
          public GenParameters compute() {
            ModuleTestConfiguration languageConfig = new ModuleTestConfiguration();

            languageConfig.setModuleRef(l.getModuleReference());
            languageConfig.setName("tmp");

            try {
              return languageConfig.getGenParams(myProject, true);
            } catch (IllegalGeneratorConfigurationException e) {
              return null;
            }
          }
        });

        if (params == null) {
          setErrorText("Rebuild configuration is invalid");
          return;
        }

        ModuleContext context = new ModuleContext(myLanguage, myProject);
        MakeSession sess = new MakeSession(context);
        if (IMakeService.INSTANCE.get().openNewSession(sess)) {
          IMakeService.INSTANCE.get().make(sess, new ModelsToResources(context, params.getModelDescriptors()).resources(false));
        }
//        GeneratorUIFacade.getInstance().generateModels(new ModuleContext(myLanguage, myProject), params.getModelDescriptors(), GeneratorUIFacade.getInstance().getDefaultGenerationHandler(), true, false);
      }
    }

    dispose();
  }


  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void buttonCancel() {
    dispose();
  }
}
