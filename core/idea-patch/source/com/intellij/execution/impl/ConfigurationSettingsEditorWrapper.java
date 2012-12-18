/*
 * Copyright 2000-2009 JetBrains s.r.o.
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

package com.intellij.execution.impl;

import com.intellij.execution.BeforeRunTask;
import com.intellij.execution.BeforeRunTaskProvider;
import com.intellij.execution.ExecutionBundle;
import com.intellij.execution.RunnerAndConfigurationSettings;
import com.intellij.execution.configurations.RunConfiguration;
import com.intellij.execution.configurations.UnknownRunConfiguration;
import com.intellij.ide.DataManager;
import com.intellij.ide.impl.TypeSafeDataProviderAdapter;
import com.intellij.openapi.actionSystem.DataKey;
import com.intellij.openapi.actionSystem.DataSink;
import com.intellij.openapi.actionSystem.TypeSafeDataProvider;
import com.intellij.openapi.extensions.Extensions;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SettingsEditor;
import com.intellij.openapi.ui.FixedSizeButton;
import com.intellij.openapi.util.Disposer;
import com.intellij.openapi.util.Key;
import com.intellij.ui.components.JBScrollPane;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import gnu.trove.THashMap;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.*;
import java.util.List;

/**
 * User: anna
 * Date: 27-Mar-2006
 */
public class ConfigurationSettingsEditorWrapper extends SettingsEditor<RunnerAndConfigurationSettings> {
  public static DataKey<ConfigurationSettingsEditorWrapper> CONFIGURATION_EDITOR_KEY = DataKey.create("ConfigurationSettingsEditor");
  private JPanel myComponentPlace;
  private JCheckBox myCbStoreProjectConfiguration;
  private JPanel myWholePanel;

  private JPanel myStepsPanel;
  private JCheckBox myShowSettingsBeforeRunCheckBox;
  private Map<Key<? extends BeforeRunTask>, BeforeRunTask> myStepsBeforeLaunch;
  private final Map<Key<? extends BeforeRunTask>, StepBeforeLaunchRow> myStepBeforeLaunchRows = new THashMap<Key<? extends BeforeRunTask>, StepBeforeLaunchRow>();

  private boolean myStoreProjectConfiguration;
  private boolean myEditBeforeRun;

  private final ConfigurationSettingsEditor myEditor;

  public ConfigurationSettingsEditorWrapper(final RunnerAndConfigurationSettings settings) {
    myEditor = new ConfigurationSettingsEditor(settings);
    Disposer.register(this, myEditor);
    doReset(settings);
  }

  private void doReset(RunnerAndConfigurationSettings settings) {
    final RunConfiguration runConfiguration = settings.getConfiguration();
    final RunManagerImpl runManager = RunManagerImpl.getInstanceImpl(runConfiguration.getProject());

    myStepsBeforeLaunch = runManager.getBeforeRunTasks(runConfiguration);
    myStepBeforeLaunchRows.clear();

    final BeforeRunTaskProvider<BeforeRunTask>[] providers = Extensions.getExtensions(BeforeRunTaskProvider.EXTENSION_POINT_NAME,
      runConfiguration.getProject());
    myStepsPanel.removeAll();

    // RE-1947
    myStepsPanel.setVisible(false);

    if (runConfiguration instanceof UnknownRunConfiguration) {
      myStepsPanel.setVisible(false);
    } else {
      List<StepBeforeLaunchRow> stepsRows = new ArrayList<StepBeforeLaunchRow>();
      for (BeforeRunTaskProvider<BeforeRunTask> provider : providers) {
        final BeforeRunTask task = myStepsBeforeLaunch.get(provider.getId());
        if (task != null) {
          final StepBeforeLaunchRow stepRow = new StepBeforeLaunchRow(runConfiguration, provider, task);
          myStepBeforeLaunchRows.put(provider.getId(), stepRow);
          stepsRows.add(stepRow);
        }
      }

      myStepsPanel.setLayout(new GridLayout(stepsRows.size(), 1));
      for (StepBeforeLaunchRow stepRow : stepsRows) {
        myStepsPanel.add(stepRow);
      }
    }

    myEditBeforeRun = settings.isEditBeforeRun();
    myShowSettingsBeforeRunCheckBox = new JCheckBox(ExecutionBundle.message("configuration.edit.before.run"));
    myShowSettingsBeforeRunCheckBox.setEnabled(!(runConfiguration instanceof UnknownRunConfiguration));
    myShowSettingsBeforeRunCheckBox.setSelected(myEditBeforeRun);
    myShowSettingsBeforeRunCheckBox.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        myEditBeforeRun = myShowSettingsBeforeRunCheckBox.isSelected();
      }
    });
    myShowSettingsBeforeRunCheckBox.setVisible(!settings.isTemplate());
    myStepsPanel.add(myShowSettingsBeforeRunCheckBox);

    myStoreProjectConfiguration = runManager.isConfigurationShared(settings);
    myCbStoreProjectConfiguration.setEnabled(!(runConfiguration instanceof UnknownRunConfiguration));
    myCbStoreProjectConfiguration.setSelected(myStoreProjectConfiguration);
    myCbStoreProjectConfiguration.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        myStoreProjectConfiguration = myCbStoreProjectConfiguration.isSelected();
      }
    });

    myCbStoreProjectConfiguration.setVisible(!settings.isTemplate());
  }

  @NotNull
  protected JComponent createEditor() {
    myComponentPlace.setLayout(new GridBagLayout());
    myComponentPlace.add(myEditor.getComponent(), new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0, GridBagConstraints.NORTHWEST, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));
    myComponentPlace.doLayout();
    myWholePanel.putClientProperty(DataManager.CLIENT_PROPERTY_DATA_PROVIDER, new TypeSafeDataProviderAdapter(new MyDataProvider()));
    final JBScrollPane scrollPane = new JBScrollPane(myWholePanel);
    scrollPane.setBorder(null);
    return scrollPane;
  }

  public void updateBeforeRunTaskPanel(@NotNull Key<? extends BeforeRunTask> key) {
    myStepBeforeLaunchRows.get(key).update(myStepsBeforeLaunch.get(key));
  }

  protected void disposeEditor() {
  }

  public void resetEditorFrom(final RunnerAndConfigurationSettings settings) {
    myEditor.resetEditorFrom(settings);
    doReset(settings);
  }

  public void applyEditorTo(final RunnerAndConfigurationSettings settings) throws ConfigurationException {
    myEditor.applyEditorTo(settings);
    doApply(settings);
  }

  public RunnerAndConfigurationSettings getSnapshot() throws ConfigurationException {
    RunnerAndConfigurationSettings result = myEditor.getSnapshot();
    doApply(result);
    return result;
  }

  private void doApply(final RunnerAndConfigurationSettings settings) {
    final RunConfiguration runConfiguration = settings.getConfiguration();
    final RunManagerImpl runManager = RunManagerImpl.getInstanceImpl(runConfiguration.getProject());
    runManager.setBeforeRunTasks(runConfiguration, myStepsBeforeLaunch);
    runManager.shareConfiguration(runConfiguration, myStoreProjectConfiguration);
    runManager.setEditBeforeRun(runConfiguration, myEditBeforeRun);
  }

  public Map<Key<? extends BeforeRunTask>, BeforeRunTask> getStepsBeforeLaunch() {
    return Collections.unmodifiableMap(myStepsBeforeLaunch);
  }

  public boolean isStoreProjectConfiguration() {
    return myStoreProjectConfiguration;
  }

  {
// GUI initializer generated by IntelliJ IDEA GUI Designer
// >>> IMPORTANT!! <<<
// DO NOT EDIT OR ADD ANY CODE HERE!
    $$$setupUI$$$();
  }

  /**
   * Method generated by IntelliJ IDEA GUI Designer
   * >>> IMPORTANT!! <<<
   * DO NOT edit this method OR call it in your code!
   *
   * @noinspection ALL
   */
  private void $$$setupUI$$$() {
    myWholePanel = new JPanel();
    myWholePanel.setLayout(new GridLayoutManager(4, 1, new Insets(0, 0, 0, 0), -1, -1));
    myComponentPlace = new JPanel();
    myComponentPlace.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    myWholePanel.add(myComponentPlace, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final Spacer spacer1 = new Spacer();
    myWholePanel.add(spacer1, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    myStepsPanel = new JPanel();
    myStepsPanel.setLayout(new BorderLayout(0, 0));
    myWholePanel.add(myStepsPanel, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myStepsPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), ResourceBundle.getBundle("messages/ExecutionBundle").getString("before.launch.panel.title")));
    myCbStoreProjectConfiguration = new JCheckBox();
    this.$$$loadButtonText$$$(myCbStoreProjectConfiguration, ResourceBundle.getBundle("messages/ExecutionBundle").getString("run.configuration.store.place.option"));
    myWholePanel.add(myCbStoreProjectConfiguration, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
  }

  /**
   * @noinspection ALL
   */
  private void $$$loadButtonText$$$(AbstractButton component, String text) {
    StringBuffer result = new StringBuffer();
    boolean haveMnemonic = false;
    char mnemonic = '\0';
    int mnemonicIndex = -1;
    for (int i = 0; i < text.length(); i++) {
      if (text.charAt(i) == '&') {
        i++;
        if (i == text.length()) break;
        if (!haveMnemonic && text.charAt(i) != '&') {
          haveMnemonic = true;
          mnemonic = text.charAt(i);
          mnemonicIndex = result.length();
        }
      }
      result.append(text.charAt(i));
    }
    component.setText(result.toString());
    if (haveMnemonic) {
      component.setMnemonic(mnemonic);
      component.setDisplayedMnemonicIndex(mnemonicIndex);
    }
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return myWholePanel;
  }

  private class StepBeforeLaunchRow extends JPanel {
    private final JCheckBox myCheckBox;
    private FixedSizeButton myButton;
    private final RunConfiguration myRunConfiguration;
    private final BeforeRunTaskProvider<BeforeRunTask> myProvider;

    public StepBeforeLaunchRow(final RunConfiguration runConfiguration, final BeforeRunTaskProvider<BeforeRunTask> provider,
                               final BeforeRunTask beforeRunTask) {
      super(new GridBagLayout());
      myRunConfiguration = runConfiguration;
      myProvider = provider;
      final boolean isChecked = beforeRunTask.isEnabled();
      myCheckBox = new JCheckBox(provider.getDescription(runConfiguration, beforeRunTask), isChecked);
      GridBagConstraints gc = new GridBagConstraints(GridBagConstraints.RELATIVE, 0, 1, 1, 0, 1, GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
      add(myCheckBox, gc);
      gc.weightx = 1;
      if (provider.hasConfigurationButton()) {
        myButton = new FixedSizeButton(20);
        add(myButton, gc);

        myButton.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent e) {
            if (provider.configureTask(runConfiguration, beforeRunTask)) {
              myCheckBox.setText(provider.getDescription(runConfiguration, beforeRunTask));
              fireEditorStateChanged();
            }
          }
        });
      } else {
        add(Box.createHorizontalBox(), gc);
      }
      enableSettings(beforeRunTask);
      myCheckBox.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
          beforeRunTask.setEnabled(myCheckBox.isSelected());
          enableSettings(beforeRunTask);
        }
      });
    }

    private void enableSettings(final BeforeRunTask task) {
      if (myButton != null) {
        myButton.setEnabled(myCheckBox.isSelected());
      }
      myCheckBox.setText(myProvider.getDescription(myRunConfiguration, task));
    }

    public void update(BeforeRunTask task) {
      myCheckBox.setSelected(task.isEnabled());
      enableSettings(task);
    }
  }

  private class MyDataProvider implements TypeSafeDataProvider {
    public void calcData(DataKey key, DataSink sink) {
      if (key.equals(CONFIGURATION_EDITOR_KEY)) {
        sink.put(CONFIGURATION_EDITOR_KEY, ConfigurationSettingsEditorWrapper.this);
      }
    }
  }
}
