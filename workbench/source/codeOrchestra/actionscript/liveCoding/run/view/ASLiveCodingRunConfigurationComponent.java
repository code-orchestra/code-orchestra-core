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
package codeOrchestra.actionscript.liveCoding.run.view;

import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionscript.liveCoding.run.config.ASLiveCodingRunConfiguration;
import codeOrchestra.actionscript.liveCoding.run.config.LiveCodingMode;
import codeOrchestra.actionscript.run.configuration.LauncherType;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.ProjectAndModuleHolder;

import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Alexander Eliseyev
 */
public class ASLiveCodingRunConfigurationComponent extends JPanel {

  private static final int MINIMUM_TABLE_COLUMN_WIDTH = 50;

  private JComboBox moduleChooser;
  private JRadioButton myModuleOutputFileRadioButton;
  private JRadioButton myHTMLWrapperOrSWFRadioButton;
  private JPanel contentPane;
  private TextFieldWithBrowseButton fileChooser;
  private JRadioButton mySystemDefaultApplicationRadioButton;
  private JRadioButton myFlashPlayerRadioButton;
  private TextFieldWithBrowseButton flashPlayerChooser;
  private JRadioButton myAllTheMethodsRadioButton;
  private JRadioButton myAnnotatedWithLiveCodingInRadioButton;
  private JCheckBox makeGettersSettersLiveCB;
  private JTextField maxLoopIterationsTF;
  private JCheckBox startPausedCB;
  private JTextField webAddressField;
  private JRadioButton myWebAddressButton;
  private String swfFile;
  private MPSProject mpsProject;

  public ASLiveCodingRunConfigurationComponent() {
    this.mpsProject = ProjectAndModuleHolder.getInstance().getProject().getComponent(MPSProject.class);

    $$$setupUI$$$();

  }

  // Listeners
  private ActionListener moduleChooserListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      final String solutionName = moduleChooser.getSelectedItem().toString();
      updateSwfFile(solutionName);
    }
  };
  private ActionListener myModuleOutputFileRadioButtonListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      fileChooser.setEnabled(false);
    }
  };
  private ActionListener myHTMLWrapperOrSWFRadioButtonListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      fileChooser.setEnabled(true);
    }
  };

  private ActionListener myLauncherButtonsListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      updateLauncherFields();
    }
  };

  private void updateLauncherFields() {
    flashPlayerChooser.setEnabled(myFlashPlayerRadioButton.isSelected());
    webAddressField.setEnabled(myWebAddressButton.isSelected());
  }

  public void updateSwfFile(final String solutionName) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        Solution solution = MPSModuleRepository.getInstance().getSolution(solutionName);
        if (solution != null) {
          ASLiveCodingRunConfigurationComponent.this.swfFile = SolutionUtils.getSWFOutputPath(solution);
        }
      }
    });
  }

  public void reset(final ASLiveCodingRunConfiguration runConfiguration) {
    // Init moduleChooser

    // RE-1647
    ModuleReference moduleReference = ProjectAndModuleHolder.getInstance().getModuleReference();
    final String moduleName = moduleReference == null ? null : moduleReference.getModuleFqName();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        int i = 0;

        boolean selectionSet = false;

        for (Solution solution : mpsProject.getProjectSolutions()) {
          if (SolutionUtils.isActionScriptDependent(solution) && !SolutionUtils.isStubSolution(solution) && !SolutionUtils.isLiveCodingSolution(solution, ProjectHolder.getProject())) {
            String solutionName = solution.getModuleDescriptor().getNamespace();
            moduleChooser.addItem(solutionName);

            // Pre-select the module
            if (!selectionSet) {
              if (runConfiguration.getModuleName() == null) {
                if (solutionName.equals(moduleName)) {
                  moduleChooser.setSelectedIndex(i);
                  selectionSet = true;
                }
              } else if (runConfiguration.getModuleName().equals(solutionName)) {
                moduleChooser.setSelectedIndex(i);
                selectionSet = true;
              }
            }

            i++;
          }
        }
      }
    });

    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      updateSwfFile(selectedModuleName);
    }

    moduleChooser.addActionListener(moduleChooserListener);

    // Target

    myModuleOutputFileRadioButton.setSelected(!runConfiguration.isUseCustomFile());
    myHTMLWrapperOrSWFRadioButton.setSelected(runConfiguration.isUseCustomFile());
    fileChooser.setEnabled(runConfiguration.isUseCustomFile());
    fileChooser.setText(runConfiguration.getCustomFile());

    myModuleOutputFileRadioButton.addActionListener(myModuleOutputFileRadioButtonListener);
    myHTMLWrapperOrSWFRadioButton.addActionListener(myHTMLWrapperOrSWFRadioButtonListener);

    fileChooser.getTextField().setEditable(false);
    fileChooser.addBrowseFolderListener("SWF or HTML launch file", "Choose an SWF or HTML wrapper launch file",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(true, false, false, false, false, false));

    // Launcher

    LauncherType launcherType = runConfiguration.getLauncherType();
    mySystemDefaultApplicationRadioButton.setSelected(launcherType == LauncherType.DEFAULT);
    myFlashPlayerRadioButton.setSelected(launcherType == LauncherType.FLASH_PLAYER);
    myWebAddressButton.setSelected(launcherType == LauncherType.WEB_ADDRESS);
    mySystemDefaultApplicationRadioButton.addActionListener(myLauncherButtonsListener);
    myFlashPlayerRadioButton.addActionListener(myLauncherButtonsListener);
    myWebAddressButton.addActionListener(myLauncherButtonsListener);
    flashPlayerChooser.setEnabled(myFlashPlayerRadioButton.isSelected());
    flashPlayerChooser.setText(runConfiguration.getFlashPlayerPath());
    flashPlayerChooser.getTextField().setEditable(false);
    flashPlayerChooser.addBrowseFolderListener("Flash Player", "Select Flash Player path",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(true, true, false, false, false, false));
    webAddressField.setText(runConfiguration.getWebAddress());
    updateLauncherFields();

    // Live coding settings
    switch (runConfiguration.getMode()) {
      case ALL_METHODS:
        myAllTheMethodsRadioButton.setSelected(true);
        break;
      case ANNOTATED_IN_OPEN_TABS:
        myAnnotatedWithLiveCodingInRadioButton.setSelected(true);
        break;
      default:
        throw new IllegalStateException();
    }
    makeGettersSettersLiveCB.setSelected(runConfiguration.isGettersAndSettersLive());
    startPausedCB.setSelected(runConfiguration.startPaused());
    maxLoopIterationsTF.setText(String.valueOf(runConfiguration.getMaxLoopIterations()));
  }

  public void apply(final ASLiveCodingRunConfiguration runConfiguration) {
    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      runConfiguration.setModuleName(selectedModuleName);
    }

    runConfiguration.setCustomFile(fileChooser.getText());
    runConfiguration.setSwfFile(swfFile);
    runConfiguration.setUseCustomFile(myHTMLWrapperOrSWFRadioButton.isSelected());

    if (mySystemDefaultApplicationRadioButton.isSelected()) {
      runConfiguration.setLauncherType(LauncherType.DEFAULT);
    } else if (myFlashPlayerRadioButton.isSelected()) {
      runConfiguration.setLauncherType(LauncherType.FLASH_PLAYER);
    } else if (myWebAddressButton.isSelected()) {
      runConfiguration.setLauncherType(LauncherType.WEB_ADDRESS);
    }
    runConfiguration.setFlashPlayerPath(flashPlayerChooser.getText());
    runConfiguration.setWebAddress(webAddressField.getText());

    // Live coding settings
    runConfiguration.setMode(myAllTheMethodsRadioButton.isSelected() ? LiveCodingMode.ALL_METHODS : LiveCodingMode.ANNOTATED_IN_OPEN_TABS);
    runConfiguration.setGettersAndSettersLive(makeGettersSettersLiveCB.isSelected());
    runConfiguration.setStartPaused(startPausedCB.isSelected());
    runConfiguration.setMaxLoopIterations(Integer.valueOf(maxLoopIterationsTF.getText()));
  }

  public void dispose() {
    myModuleOutputFileRadioButton.removeActionListener(myModuleOutputFileRadioButtonListener);
    myHTMLWrapperOrSWFRadioButton.removeActionListener(myHTMLWrapperOrSWFRadioButtonListener);
    moduleChooser.removeActionListener(moduleChooserListener);
  }

  public JPanel getContentPane() {
    return contentPane;
  }

  private void createUIComponents() {
    contentPane = new JPanel();
    add(contentPane);
  }

  private void fitTableColumns(JTable table) {
    for (int i = 0; i < table.getColumnModel().getColumnCount(); i++) {
      TableColumn column = table.getColumnModel().getColumn(i);
      int max = MINIMUM_TABLE_COLUMN_WIDTH;

      for (int j = 0; j < table.getRowCount(); j++) {
        TableCellRenderer r = table.getCellRenderer(j, i);
        Component c = r.getTableCellRendererComponent(table, table.getValueAt(j, i), false, false, j, i);
        int width = c.getPreferredSize().width;
        if (width > max) {
          max = width;
        }
      }
      column.setPreferredWidth(max);
    }
  }

  /**
   * Method generated by IntelliJ IDEA GUI Designer
   * >>> IMPORTANT!! <<<
   * DO NOT edit this method OR call it in your code!
   *
   * @noinspection ALL
   */
  private void $$$setupUI$$$() {
    createUIComponents();
    contentPane.setLayout(new GridLayoutManager(5, 1, new Insets(0, 0, 0, 0), -1, -1));
    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(417, 24), null, 0, false));
    final JLabel label1 = new JLabel();
    label1.setFont(new Font(label1.getFont().getName(), Font.BOLD, label1.getFont().getSize()));
    label1.setText("Run configuration for module:");
    panel1.add(label1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    moduleChooser = new JComboBox();
    panel1.add(moduleChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(200, -1), new Dimension(200, -1), 0, false));
    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    panel2.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Target"));
    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel2.add(panel3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myModuleOutputFileRadioButton = new JRadioButton();
    myModuleOutputFileRadioButton.setSelected(false);
    myModuleOutputFileRadioButton.setText("Module output file");
    panel3.add(myModuleOutputFileRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel4 = new JPanel();
    panel4.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel2.add(panel4, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myHTMLWrapperOrSWFRadioButton = new JRadioButton();
    myHTMLWrapperOrSWFRadioButton.setText("HTML wrapper or SWF file:");
    panel4.add(myHTMLWrapperOrSWFRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    fileChooser = new TextFieldWithBrowseButton();
    panel4.add(fileChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, new Dimension(300, -1), new Dimension(300, -1), 0, false));
    final Spacer spacer1 = new Spacer();
    contentPane.add(spacer1, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    final JPanel panel5 = new JPanel();
    panel5.setLayout(new GridLayoutManager(3, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel5, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    panel5.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Launcher"));
    final JPanel panel6 = new JPanel();
    panel6.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel5.add(panel6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    mySystemDefaultApplicationRadioButton = new JRadioButton();
    mySystemDefaultApplicationRadioButton.setText("System default application");
    panel6.add(mySystemDefaultApplicationRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer2 = new Spacer();
    panel6.add(spacer2, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    final JPanel panel7 = new JPanel();
    panel7.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel5.add(panel7, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myFlashPlayerRadioButton = new JRadioButton();
    myFlashPlayerRadioButton.setText("Flash Player:");
    panel7.add(myFlashPlayerRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    flashPlayerChooser = new TextFieldWithBrowseButton();
    panel7.add(flashPlayerChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, new Dimension(300, -1), new Dimension(300, -1), 0, false));
    final JPanel panel8 = new JPanel();
    panel8.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel5.add(panel8, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myWebAddressButton = new JRadioButton();
    myWebAddressButton.setText("Web browser at URL:");
    panel8.add(myWebAddressButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    webAddressField = new JTextField();
    panel8.add(webAddressField, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_WANT_GROW, null, new Dimension(300, -1), new Dimension(300, -1), 0, false));
    final JPanel panel9 = new JPanel();
    panel9.setLayout(new GridLayoutManager(4, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel9, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel9.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Settings"));
    final JLabel label2 = new JLabel();
    label2.setText("Live Methods:");
    panel9.add(label2, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    final JPanel panel10 = new JPanel();
    panel10.setLayout(new GridLayoutManager(2, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel9.add(panel10, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final Spacer spacer3 = new Spacer();
    panel10.add(spacer3, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    myAnnotatedWithLiveCodingInRadioButton = new JRadioButton();
    myAnnotatedWithLiveCodingInRadioButton.setText("Annotated with [Live]");
    panel10.add(myAnnotatedWithLiveCodingInRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myAllTheMethodsRadioButton = new JRadioButton();
    myAllTheMethodsRadioButton.setText("All the methods");
    panel10.add(myAllTheMethodsRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label3 = new JLabel();
    label3.setText("Make Getters/Setters Live:");
    panel9.add(label3, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    makeGettersSettersLiveCB = new JCheckBox();
    makeGettersSettersLiveCB.setText(" ");
    panel9.add(makeGettersSettersLiveCB, new GridConstraints(2, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label4 = new JLabel();
    label4.setText("Max Loop Iterations:");
    panel9.add(label4, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    maxLoopIterationsTF = new JTextField();
    panel9.add(maxLoopIterationsTF, new GridConstraints(3, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, new Dimension(65, -1), new Dimension(65, -1), new Dimension(65, -1), 0, false));
    final JLabel label5 = new JLabel();
    label5.setText("Start Session Paused");
    panel9.add(label5, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    startPausedCB = new JCheckBox();
    startPausedCB.setText("");
    panel9.add(startPausedCB, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myModuleOutputFileRadioButton);
    buttonGroup.add(myHTMLWrapperOrSWFRadioButton);
    buttonGroup = new ButtonGroup();
    buttonGroup.add(mySystemDefaultApplicationRadioButton);
    buttonGroup.add(myFlashPlayerRadioButton);
    buttonGroup.add(myWebAddressButton);
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myAllTheMethodsRadioButton);
    buttonGroup.add(myAnnotatedWithLiveCodingInRadioButton);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return contentPane;
  }
}
