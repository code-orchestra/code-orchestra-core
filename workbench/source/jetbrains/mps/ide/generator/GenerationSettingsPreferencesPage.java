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
package jetbrains.mps.ide.generator;

import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.ide.generator.GenerationSettings.GenerateRequirementsPolicy;
import jetbrains.mps.ide.projectPane.Icons;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.text.DefaultFormatter;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.text.ParseException;

class GenerationSettingsPreferencesPage {
  private JPanel myPage;
  private JCheckBox mySaveTransientModelsCheckBox = new JCheckBox("Save transient models on generation");
  private JComboBox myGenerateRequirementsComboBox = new JComboBox(GenerationSettings.GenerateRequirementsPolicy.values());
  private JCheckBox myCheckModelsBeforeGenerationCheckBox = new JCheckBox("Check models for errors before generation");
  private JCheckBox myStrictMode = new JCheckBox("Strict mode");
  private JCheckBox myUseNewGenerator = new JCheckBox("Generate in parallel.");
  private JFormattedTextField myNumberOfParallelThreads = new JFormattedTextField(new RangeDecimalFormatter(2, 32));
  private JCheckBox myIncremental = new JCheckBox("Incremental generation");
  private JCheckBox myIncrementalCache = new JCheckBox("Cache intermediate models");

  private JRadioButton myTraceNone = new JRadioButton("None");
  private JRadioButton myTraceSteps = new JRadioButton("Generation steps only");
  private JRadioButton myTraceLanguages = new JRadioButton("Time spent in language generators");
  private JRadioButton myTraceTypes = new JRadioButton("Time spent in types calculation");

  private JCheckBox myShowInfo = new JCheckBox("Show informational messages");
  private JCheckBox myShowWarnings = new JCheckBox("Show warnings");
  private JCheckBox myKeepModelsWithWarnings = new JCheckBox("Keep transient models with warnings");
  private JCheckBox myShowBadChildWarnings = new JCheckBox("Warn when child cannot be placed into role");
  private JCheckBox myLimitNumberOfModels = new JCheckBox("Maximum number of transient models to keep:");
  private JFormattedTextField myNumberOfModelsToKeep = new JFormattedTextField(new RangeDecimalFormatter(0, 1000));

  private JCheckBox myFailOnMissingTextgen = new JCheckBox("Fail if textgen not found");
  private JCheckBox myGenerateDebugInfo = new JCheckBox("Generate debug information");

  private GenerationSettings myGenerationSettings;

  public GenerationSettingsPreferencesPage(GenerationSettings settings) {
    myGenerationSettings = settings;
    update();
    myPage = createComponent();
  }

  public String getName() {
    return "Generation";
  }

  public Icon getIcon() {
    return Icons.GENERATORS_ICON;
  }

  public JComponent getComponent() {
    return myPage;
  }

  public JPanel createComponent() {
    JPanel myMainPanel = new JPanel(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.gridx = 0;
    c.weightx = 1;
    c.fill = GridBagConstraints.BOTH;

    c.gridy = 0;
    myMainPanel.add(createOptionsPanel(), c);

    c.gridy = 1;
    myMainPanel.add(createReportingPanel(), c);

    c.gridy = 2;
    myMainPanel.add(createTracingPanel(), c);

    c.gridy = 3;
    myMainPanel.add(createTextGenPanel(), c);

    c.gridy = 4;
    c.weighty = 1;
    myMainPanel.add(new JPanel(), c);
    return myMainPanel;
  }

  private JPanel createOptionsPanel() {
    JPanel optionsPanel = new JPanel(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.weightx = 1;
    c.gridx = 0;
    c.ipady = 2;
    c.fill = GridBagConstraints.BOTH;
    optionsPanel.add(mySaveTransientModelsCheckBox, c);
    optionsPanel.add(myCheckModelsBeforeGenerationCheckBox, c);
    optionsPanel.add(myStrictMode, c);
    c.ipady = 0;
    optionsPanel.add(createParallelGenerationGroup(), c);
    c.ipady = 2;
    optionsPanel.add(myIncremental, c);
    c.insets.left = 16;
    optionsPanel.add(myIncrementalCache, c);
    final ChangeListener listener = new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        myIncremental.setEnabled(myStrictMode.isSelected());
        myIncrementalCache.setEnabled(myStrictMode.isSelected() && myIncremental.isSelected());
      }
    };
    myStrictMode.addChangeListener(listener);
    myIncremental.addChangeListener(listener);
    optionsPanel.setBorder(BorderFactory.createTitledBorder("General"));
    return optionsPanel;
  }

  private JPanel createGenerateRequirementsPolicyGroup() {
    JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
    panel.add(new JLabel("Regenerate models required for generation:"));
    panel.add(myGenerateRequirementsComboBox);
    return panel;
  }

  private JPanel createParallelGenerationGroup() {
    JPanel parallelGen = new JPanel(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.gridy = 0;
    parallelGen.add(myUseNewGenerator, c);
    final ChangeListener listener = new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        myUseNewGenerator.setEnabled(myStrictMode.isSelected());
        myNumberOfParallelThreads.setEditable(myUseNewGenerator.isSelected() && myStrictMode.isSelected());
      }
    };
    myStrictMode.addChangeListener(listener);
    myUseNewGenerator.addChangeListener(listener);
    c.insets.left = 7;
    parallelGen.add(new JLabel("Use"), c);
    c.insets.left = 3;
    myNumberOfParallelThreads.setColumns(2);
    parallelGen.add(myNumberOfParallelThreads, c);
    c.insets.left = 2;
    parallelGen.add(new JLabel("cores"), c);
    c.weightx = 1;
    parallelGen.add(new JPanel(), c);
    return parallelGen;
  }

  private JPanel createReportingPanel() {
    JPanel panel = new JPanel(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.weightx = 1;
    c.gridx = 0;
    c.ipady = 2;
    c.fill = GridBagConstraints.BOTH;
    panel.add(myShowInfo, c);
    panel.add(myShowWarnings, c);
    c.insets.left = 16;
    panel.add(myKeepModelsWithWarnings, c);
    panel.add(myShowBadChildWarnings, c);
    c.insets.left = 0;
    final ChangeListener listener = new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        myKeepModelsWithWarnings.setEnabled(myShowWarnings.isSelected());
        myShowBadChildWarnings.setEnabled(myShowWarnings.isSelected());
      }
    };
    myShowWarnings.addChangeListener(listener);
    c.ipady = 0;
    panel.add(createLinkErrorsGroup(), c);
    panel.setBorder(BorderFactory.createTitledBorder("Error reporting"));
    return panel;
  }

  private JPanel createLinkErrorsGroup() {
    JPanel group = new JPanel(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.gridy = 0;
    group.add(myLimitNumberOfModels, c);
    final ChangeListener listener = new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        myNumberOfModelsToKeep.setEditable(myLimitNumberOfModels.isSelected());
      }
    };
    myLimitNumberOfModels.addChangeListener(listener);
    group.add(myLimitNumberOfModels, c);
    myNumberOfModelsToKeep.setColumns(3);
    c.insets.left = 5;
    group.add(myNumberOfModelsToKeep, c);
    c.weightx = 1;
    group.add(new JPanel(), c);
    return group;
  }

  private JPanel createTracingPanel() {
    final ButtonGroup group = new ButtonGroup();
    group.add(myTraceNone);
    group.add(myTraceSteps);
    group.add(myTraceLanguages);
    group.add(myTraceTypes);

    JPanel gotoPanel = new JPanel();
    gotoPanel.setLayout(new BoxLayout(gotoPanel, BoxLayout.Y_AXIS));
    gotoPanel.add(myTraceNone);
    gotoPanel.add(myTraceSteps);
    gotoPanel.add(myTraceLanguages);
    gotoPanel.add(myTraceTypes);
    gotoPanel.setBorder(BorderFactory.createTitledBorder("Model generation performance report"));
    return gotoPanel;
  }

  private JPanel createTextGenPanel() {
    JPanel textgenPanel = new JPanel();
    textgenPanel.setLayout(new BoxLayout(textgenPanel, BoxLayout.Y_AXIS));
    textgenPanel.add(myFailOnMissingTextgen);
    textgenPanel.add(myGenerateDebugInfo);
    textgenPanel.setBorder(BorderFactory.createTitledBorder("TextGen options"));
    return textgenPanel;
  }

  public boolean validate() {
    return true;
  }

  public void commit() {
    myGenerationSettings.setSaveTransientModels(mySaveTransientModelsCheckBox.isSelected());
    myGenerationSettings.setGenerateRequirementsPolicy(((GenerateRequirementsPolicy) myGenerateRequirementsComboBox.getSelectedItem()));
    myGenerationSettings.setCheckModelsBeforeGeneration(myCheckModelsBeforeGenerationCheckBox.isSelected());
    myGenerationSettings.setParallelGenerator(myUseNewGenerator.isSelected());
    myGenerationSettings.setStrictMode(myStrictMode.isSelected());
    myGenerationSettings.setNumberOfParallelThreads((Integer) myNumberOfParallelThreads.getValue());
    myGenerationSettings.setPerformanceTracingLevel(getTracingLevel());
    myGenerationSettings.setShowInfo(myShowInfo.isSelected());
    myGenerationSettings.setShowWarnings(myShowWarnings.isSelected());
    myGenerationSettings.setKeepModelsWithWarnings(myKeepModelsWithWarnings.isSelected());
    myGenerationSettings.setShowBadChildWarning(myShowBadChildWarnings.isSelected());
    myGenerationSettings.setNumberOfModelsToKeep(getNumberOfModelsToKeep());
    myGenerationSettings.setIncremental(myIncremental.isSelected());
    myGenerationSettings.setIncrementalUseCache(myIncrementalCache.isSelected());
    myGenerationSettings.setFailOnMissingTextGen(myFailOnMissingTextgen.isSelected());
    myGenerationSettings.setGenerateDebugInfo(myGenerateDebugInfo.isSelected());
  }

  private int getTracingLevel() {
    return
      myTraceTypes.isSelected() ? GenerationOptions.TRACE_TYPES :
        myTraceLanguages.isSelected() ? GenerationOptions.TRACE_LANGS :
          myTraceSteps.isSelected() ? GenerationOptions.TRACE_STEPS
            : GenerationOptions.TRACE_OFF;
  }

  private int getNumberOfModelsToKeep() {
    return myLimitNumberOfModels.isSelected() ? (Integer) myNumberOfModelsToKeep.getValue() : -1;
  }

  public boolean isModified() {
    return !(myGenerationSettings.isSaveTransientModels() == mySaveTransientModelsCheckBox.isSelected() &&
      myGenerationSettings.getGenerateRequirementsPolicy() == myGenerateRequirementsComboBox.getSelectedItem() &&
      myGenerationSettings.isCheckModelsBeforeGeneration() == myCheckModelsBeforeGenerationCheckBox.isSelected() &&
      myGenerationSettings.isParallelGenerator() == myUseNewGenerator.isSelected() &&
      myGenerationSettings.isShowInfo() == myShowInfo.isSelected() &&
      myGenerationSettings.isShowWarnings() == myShowWarnings.isSelected() &&
      myGenerationSettings.isKeepModelsWithWarnings() == myKeepModelsWithWarnings.isSelected() &&
      myGenerationSettings.isShowBadChildWarning() == myShowBadChildWarnings.isSelected() &&
      myGenerationSettings.getNumberOfModelsToKeep() == getNumberOfModelsToKeep() &&
      myGenerationSettings.getNumberOfParallelThreads() == ((Integer) myNumberOfParallelThreads.getValue()).intValue() &&
      myGenerationSettings.getPerformanceTracingLevel() == getTracingLevel() &&
      myGenerationSettings.isStrictMode() == myStrictMode.isSelected() &&
      myGenerationSettings.isIncremental() == myIncremental.isSelected() &&
      myGenerationSettings.isIncrementalUseCache() == myIncrementalCache.isSelected() &&
      myGenerationSettings.isFailOnMissingTextGen() == myFailOnMissingTextgen.isSelected() &&
      myGenerationSettings.isGenerateDebugInfo() == myGenerateDebugInfo.isSelected());
  }

  public void update() {
    mySaveTransientModelsCheckBox.setSelected(myGenerationSettings.isSaveTransientModels());
    myGenerateRequirementsComboBox.setSelectedItem(myGenerationSettings.getGenerateRequirementsPolicy());
    myCheckModelsBeforeGenerationCheckBox.setSelected(myGenerationSettings.isCheckModelsBeforeGeneration());
    myUseNewGenerator.setSelected(myGenerationSettings.isParallelGenerator());
    myIncremental.setSelected(myGenerationSettings.isIncremental());
    myIncrementalCache.setSelected(myGenerationSettings.isIncrementalUseCache());

    myStrictMode.setSelected(myGenerationSettings.isStrictMode());
    myUseNewGenerator.setEnabled(myGenerationSettings.isStrictMode());
    myIncremental.setEnabled(myGenerationSettings.isStrictMode());
    myIncrementalCache.setEnabled(myGenerationSettings.isStrictMode() && myGenerationSettings.isIncremental());
    myNumberOfParallelThreads.setEditable(myGenerationSettings.isParallelGenerator() && myGenerationSettings.isStrictMode());
    myNumberOfParallelThreads.setValue(myGenerationSettings.getNumberOfParallelThreads());

    myShowInfo.setSelected(myGenerationSettings.isShowInfo());
    myShowWarnings.setSelected(myGenerationSettings.isShowWarnings());
    myKeepModelsWithWarnings.setEnabled(myGenerationSettings.isShowWarnings());
    myKeepModelsWithWarnings.setSelected(myGenerationSettings.isKeepModelsWithWarnings());
    myShowBadChildWarnings.setEnabled(myGenerationSettings.isShowWarnings());
    myShowBadChildWarnings.setSelected(myGenerationSettings.isShowBadChildWarning());
    myNumberOfModelsToKeep.setEditable(myGenerationSettings.getNumberOfModelsToKeep() != -1);
    myNumberOfModelsToKeep.setValue(myGenerationSettings.getNumberOfModelsToKeep() == -1 ? 16 : myGenerationSettings.getNumberOfModelsToKeep());
    myLimitNumberOfModels.setSelected(myGenerationSettings.getNumberOfModelsToKeep() != -1);

    myFailOnMissingTextgen.setSelected(myGenerationSettings.isFailOnMissingTextGen());
    myGenerateDebugInfo.setSelected(myGenerationSettings.isGenerateDebugInfo());

    final JRadioButton[] allbuttons = {myTraceNone, myTraceSteps, myTraceLanguages, myTraceTypes};
    allbuttons[myGenerationSettings.getPerformanceTracingLevel()].setSelected(true);
  }

  private class RangeDecimalFormatter extends DefaultFormatter {
    private final int myLo;
    private final int myHi;

    private RangeDecimalFormatter(int lo, int hi) {
      super();
      setAllowsInvalid(true);
      setCommitsOnValidEdit(true);
      myLo = lo;
      myHi = hi;
    }

    @Override
    public Object stringToValue(String text) throws ParseException {
      try {
        int i = Integer.parseInt(text);
        if (i < myLo || i > myHi) {
          throw new ParseException(text, text.length() - 1);
        }
        return i;
      } catch (NumberFormatException e) {
        throw new ParseException(text, 0);
      }
    }

    @Override
    public String valueToString(@Nullable Object value) throws ParseException {
      if (value == null) return null;
      return Integer.toString((Integer) value);
    }
  }
}
