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
package jetbrains.mps.ide.findusages.view.optionseditor.components;

import jetbrains.mps.InternalFlag;
import jetbrains.mps.ide.findusages.view.optionseditor.options.ScopeOptions;
import jetbrains.mps.ide.ui.DefaultCompletionTextField;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SModelStereotype;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.List;

public class ScopeEditor extends BaseEditor<ScopeOptions> {
  private static final String GLOBAL_SCOPE = "Global";
  private static final String PROJECT_SCOPE = "Project";
  private static final String MODULE_SCOPE = "Module";
  private static final String MODEL_SCOPE = "Model";
  private static final String BOOTSTRAP_SCOPE = "Bootstrap";

  private JRadioButton myGlobalScopeButton;
  private JRadioButton myProjectScopeButton;
  private JRadioButton myModuleScopeButton;
  private JRadioButton myModelScopeButton;
  private JRadioButton myBootstrapScopeButton = null;
  private ButtonGroup myButtonGroup;

  private DefaultCompletionTextField myModuleField;
  private DefaultCompletionTextField myModelField;
  private List<String> myModuleNameList;
  private List<String> myModelNameList;

  public ScopeEditor(ScopeOptions defaultOptions) {
    super(defaultOptions);

    myPanel = new JPanel();
    myPanel.setLayout(new BoxLayout(myPanel, BoxLayout.Y_AXIS));
    myPanel.setBorder(
      BorderFactory.createCompoundBorder(
        BorderFactory.createTitledBorder("Scope"),
        BorderFactory.createEmptyBorder(7, 3, 3, 3)));

    myGlobalScopeButton = new JRadioButton(new AbstractAction(GLOBAL_SCOPE) {
      public void actionPerformed(ActionEvent e) {
        setCompletionFieldsState(false, false);
      }
    });

    myProjectScopeButton = new JRadioButton(new AbstractAction(PROJECT_SCOPE) {
      public void actionPerformed(ActionEvent e) {
        setCompletionFieldsState(false, false);
      }
    });

    myModuleScopeButton = new JRadioButton(new AbstractAction(MODULE_SCOPE) {
      public void actionPerformed(ActionEvent e) {
        setCompletionFieldsState(true, false);
      }
    });

    myModelScopeButton = new JRadioButton(new AbstractAction(MODEL_SCOPE) {
      public void actionPerformed(ActionEvent e) {
        setCompletionFieldsState(false, true);
      }
    });

    if (InternalFlag.isInternalMode()) {
      myBootstrapScopeButton = new JRadioButton(new AbstractAction(BOOTSTRAP_SCOPE) {
        public void actionPerformed(ActionEvent e) {
          setCompletionFieldsState(false, false);
        }
      });
    }

    myButtonGroup = new ButtonGroup();
    myButtonGroup.add(myGlobalScopeButton);
    myButtonGroup.add(myProjectScopeButton);
    myButtonGroup.add(myModuleScopeButton);
    myButtonGroup.add(myModelScopeButton);
    if (myBootstrapScopeButton != null) {
      myButtonGroup.add(myBootstrapScopeButton);
    }

    List<IModule> moduleList = MPSModuleRepository.getInstance().getAllModules();
    List<String> moduleNameList = new ArrayList<String>();

    for (IModule iModule : moduleList) {
      String namespace = iModule.getModuleFqName();
      if (namespace != null) {
        moduleNameList.add(namespace);
      }
    }

    myModuleNameList = moduleNameList;
    myModuleNameList.add(0, ScopeOptions.DEFAULT_VALUE);
    myModuleField = new DefaultCompletionTextField(moduleNameList);
    myModuleField.setText(ScopeOptions.DEFAULT_VALUE);

    List<SModelDescriptor> modelList = SModelRepository.getInstance().getModelDescriptors();
    myModelNameList = new ArrayList<String>();

    for (SModelDescriptor md : modelList) {
      if (SModelStereotype.isStubModelStereotype(md.getStereotype())) continue;
      myModelNameList.add(md.getLongName());
    }

    myModelNameList.add(0, ScopeOptions.DEFAULT_VALUE);
    myModelField = new DefaultCompletionTextField(myModelNameList);
    myModelField.setText(ScopeOptions.DEFAULT_VALUE);

    JPanel row;

    row = new JPanel();
    row.setLayout(new BorderLayout());
    row.add(myModelScopeButton, BorderLayout.WEST);
    row.add(myModelField, BorderLayout.CENTER);
    myPanel.add(row);

    row = new JPanel();
    row.setLayout(new BorderLayout());
    row.add(myModuleScopeButton, BorderLayout.WEST);
    row.add(myModuleField, BorderLayout.CENTER);
    myPanel.add(row);

    row = new JPanel();
    row.setLayout(new BorderLayout());
    row.add(myProjectScopeButton, BorderLayout.WEST);
    myPanel.add(row);

    row = new JPanel();
    row.setLayout(new BorderLayout());
    row.add(myGlobalScopeButton, BorderLayout.WEST);
    myPanel.add(row);

    if (InternalFlag.isInternalMode()) {
      row = new JPanel();
      row.setLayout(new BorderLayout());
      row.add(myBootstrapScopeButton, BorderLayout.WEST);
      myPanel.add(row);
    }

    setDefaults(defaultOptions);
  }

  public void setCompletionFieldsState(boolean moduleState, boolean modelState) {
    myModuleField.setEnabled(moduleState);
    myModelField.setEnabled(modelState);
  }

  private void setDefaults(ScopeOptions defaultOptions) {
    myModuleField.setText(defaultOptions.getModule());
    myModelField.setText(defaultOptions.getModel());

    String scopeType = defaultOptions.getScopeType();
    if (scopeType.equals(ScopeOptions.GLOBAL_SCOPE)) {
      setCurrentRadioButton(myGlobalScopeButton);
    } else if (scopeType.equals(ScopeOptions.PROJECT_SCOPE)) {
      setCurrentRadioButton(myProjectScopeButton);
    } else if (scopeType.equals(ScopeOptions.MODULE_SCOPE)) {
      setCurrentRadioButton(myModuleScopeButton);
    } else if (scopeType.equals(ScopeOptions.MODEL_SCOPE)) {
      setCurrentRadioButton(myModelScopeButton);
    } else if (scopeType.equals(ScopeOptions.BOOTSTRAP_SCOPE)) {
      if (myBootstrapScopeButton != null) {
        setCurrentRadioButton(myBootstrapScopeButton);
      } else {
        setCurrentRadioButton(myGlobalScopeButton);
      }
    }
  }

  public ScopeOptions getOptions() {
    if (myModuleNameList.contains(myModuleField.getText())) {
      myOptions.setModule(myModuleField.getText());
    } else {
      myOptions.setModule(ScopeOptions.DEFAULT_VALUE);
    }

    if (myModelNameList.contains(myModelField.getText())) {
      myOptions.setModel(myModelField.getText());
    } else {
      myOptions.setModel(ScopeOptions.DEFAULT_VALUE);
    }

    ButtonModel selectedModel = myButtonGroup.getSelection();
    String scopeType;
    if (selectedModel == myGlobalScopeButton.getModel()) {
      scopeType = ScopeOptions.GLOBAL_SCOPE;
    } else if (selectedModel == myProjectScopeButton.getModel()) {
      scopeType = ScopeOptions.PROJECT_SCOPE;
    } else if (selectedModel == myModuleScopeButton.getModel()) {
      scopeType = ScopeOptions.MODULE_SCOPE;
    } else if (selectedModel == myModelScopeButton.getModel()) {
      scopeType = ScopeOptions.MODEL_SCOPE;
    } else if (selectedModel == myBootstrapScopeButton.getModel()) {
      scopeType = ScopeOptions.BOOTSTRAP_SCOPE;
    } else {
      throw new IllegalArgumentException();
    }
    myOptions.setScopeType(scopeType);

    return myOptions;
  }

  private void setCurrentRadioButton(JRadioButton btn) {
    if (!btn.getModel().isSelected()) {
      btn.doClick();
    }
  }
}
