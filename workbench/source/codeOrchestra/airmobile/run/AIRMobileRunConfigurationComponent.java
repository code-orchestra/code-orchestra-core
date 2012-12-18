package codeOrchestra.airmobile.run;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.air.run.configuration.AIRLauncherType;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.ProjectAndModuleHolder;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

public class AIRMobileRunConfigurationComponent extends JPanel {

  private JPanel contentPane;
  private JComboBox moduleChooser;
  private JRadioButton myDefaultModuleOutputGenerateRadioButton;
  private JRadioButton myCustomAIRDescriptorRadioButton;
  private JRadioButton myExistingAPKPackageRadioButton;
  private TextFieldWithBrowseButton myDescriptorPathField;
  private TextFieldWithBrowseButton myRootDirectoryField;
  private JTextField launcherOptionsField;
  private JTextField programParametersField;
  private TextFieldWithBrowseButton existingAPKField;
  private JLabel packagePathLabel;
  private JRadioButton emulatorRunTargetRB;
  private JRadioButton deviceRunTargetRB;
  private JComboBox emulatorComboBox;
  private JTextField screenWidthField;
  private JTextField screenHeightField;
  private JTextField fullScreenWidthField;
  private JTextField fullScreenHeightField;
  private JLabel errorLabel;

  private MPSProject mpsProject;

  // Listeners
  private ActionListener myDefaultModuleOutputGenerateRadioButtonListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      toggleDescriptorControls(false);
    }
  };
  private ActionListener myCustomAIRDescriptorRadioButtonListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      toggleDescriptorControls(true);
    }
  };
  private ActionListener moduleChooserListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
      final String solutionName = moduleChooser.getSelectedItem().toString();
      updateDescriptorPaths(solutionName);
    }
  };
  private ActionListener emulatorComboBoxListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      setSelectedEmulator((AIRMobileEmulator) emulatorComboBox.getSelectedItem(), null);
    }
  };
  ;

  public AIRMobileRunConfigurationComponent() {
    $$$setupUI$$$();
    this.mpsProject = ProjectAndModuleHolder.getInstance().getProject().getComponent(MPSProject.class);

    if (!FlexSDKSettings.getInstance().isAirPresent()) {
      displayErrorMessage("<html>ADL is not present in the Flex SDK configured<br>To change the SDK path, go to File -> Settings -> Flex SDK</html>");
    }
  }

  private void displayErrorMessage(String message) {
    this.errorLabel.setVisible(true);
    this.errorLabel.setText(message);
  }

  private void toggleDescriptorControls(boolean enable) {
    myDescriptorPathField.setEnabled(enable);
    myRootDirectoryField.setEnabled(enable);
  }

  public void apply(final AIRMobileRunConfiguration runConfiguration) {
    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      runConfiguration.setModuleName(selectedModuleName);
    }
    runConfiguration.setRootDirectory(myRootDirectoryField.getText());
    runConfiguration.setDescriptorPath(myDescriptorPathField.getText());
    runConfiguration.setLauncherType(myCustomAIRDescriptorRadioButton.isSelected() ? AIRLauncherType.CUSTOM_APPLICATION_DESCRIPTOR : AIRLauncherType.DEFAULT_MODULE_OUTPUT);
    runConfiguration.setLauncherOptions(launcherOptionsField.getText());
    runConfiguration.setProgramParameters(programParametersField.getText());

    // Mobile
    runConfiguration.setEmulator((AIRMobileEmulator) emulatorComboBox.getSelectedItem());
    runConfiguration.setRunTarget(emulatorRunTargetRB.isSelected() ? AIRMobileRunTarget.EMULATOR : AIRMobileRunTarget.DEVICE);
    runConfiguration.setFullScreenWidth(getDimensionSafe(fullScreenWidthField));
    runConfiguration.setFullScreenHeight(getDimensionSafe(fullScreenHeightField));
    runConfiguration.setScreenWidth(getDimensionSafe(screenWidthField));
    runConfiguration.setScreenHeight(getDimensionSafe(screenHeightField));
  }

  private int getDimensionSafe(JTextField textField) {
    try {
      return Integer.parseInt(textField.getText());
    } catch (NumberFormatException e) {
      return 0;
    }
  }

  public void dispose() {
    myDefaultModuleOutputGenerateRadioButton.removeActionListener(myDefaultModuleOutputGenerateRadioButtonListener);
    myCustomAIRDescriptorRadioButton.removeActionListener(myCustomAIRDescriptorRadioButtonListener);
    moduleChooser.removeActionListener(moduleChooserListener);
  }

  public void reset(final AIRMobileRunConfiguration runConfiguration) {
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

    switch (runConfiguration.getLauncherType()) {
      case DEFAULT_MODULE_OUTPUT:
        myDefaultModuleOutputGenerateRadioButton.setSelected(true);
        break;
      case CUSTOM_APPLICATION_DESCRIPTOR:
        myCustomAIRDescriptorRadioButton.setSelected(true);
        break;
      default:
        myDefaultModuleOutputGenerateRadioButton.setSelected(true);
    }
    toggleDescriptorControls(runConfiguration.getLauncherType() == AIRLauncherType.CUSTOM_APPLICATION_DESCRIPTOR);
    myDefaultModuleOutputGenerateRadioButton.addActionListener(myDefaultModuleOutputGenerateRadioButtonListener);
    myCustomAIRDescriptorRadioButton.addActionListener(myCustomAIRDescriptorRadioButtonListener);

    if (runConfiguration.getDescriptorPath() != null) {
      myDescriptorPathField.setText(runConfiguration.getDescriptorPath());
    }
    myDescriptorPathField.addBrowseFolderListener("AIR Descriptor", "Choose an AIR application descriptor file",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(true, false, false, false, false, false));

    if (runConfiguration.getRootDirectory() != null) {
      myRootDirectoryField.setText(runConfiguration.getRootDirectory());
    }
    myRootDirectoryField.addBrowseFolderListener("Application Root", "Select the application root path",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(false, true, false, false, false, false));

    if (runConfiguration.getLauncherOptions() != null) {
      launcherOptionsField.setText(runConfiguration.getLauncherOptions());
    }

    if (runConfiguration.getProgramParameters() != null) {
      programParametersField.setText(runConfiguration.getProgramParameters());
    }

    switch (runConfiguration.getRunTarget()) {
      case EMULATOR:
        emulatorRunTargetRB.setSelected(true);
        break;
      case DEVICE:
        deviceRunTargetRB.setSelected(true);
        break;
      default:
        emulatorRunTargetRB.setSelected(true);
    }
    // TODO: toggle emulator controls
    // TODO: add emulator/device RBs listeners

    // Fill emulator combo
    for (AIRMobileEmulator airMobileEmulator : AIRMobileEmulator.values()) {
      emulatorComboBox.addItem(airMobileEmulator);
    }
    setSelectedEmulator(runConfiguration.getEmulator(), runConfiguration);
    emulatorComboBox.addActionListener(emulatorComboBoxListener);

    updateDescriptorPaths(moduleChooser.getSelectedItem().toString());
    moduleChooser.addActionListener(moduleChooserListener);

    // TODO: enable after the external APK support is added
    myExistingAPKPackageRadioButton.setEnabled(false);
    existingAPKField.setEnabled(false);
    packagePathLabel.setEnabled(false);
    deviceRunTargetRB.setEnabled(false);

    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        // RE-1725
        // This hack is needed to fire an event to UserActivityWatcher, which will allow
        // to save the data even if it wasn't alternated by a user

        JRadioButton radioButton = myDefaultModuleOutputGenerateRadioButton.isSelected() ? myDefaultModuleOutputGenerateRadioButton : myCustomAIRDescriptorRadioButton;

        boolean wasSelected = radioButton.isSelected();
        radioButton.setSelected(!wasSelected);
        radioButton.setSelected(wasSelected);
      }
    });
  }

  private void setSelectedEmulator(AIRMobileEmulator emulator, @Nullable AIRMobileRunConfiguration mobileRunConfiguration) {
    emulatorComboBox.setSelectedItem(emulator);
    if (emulator.hasCustomResolution()) {
      int width = mobileRunConfiguration == null ? 800 : mobileRunConfiguration.getScreenWidth();
      int height = mobileRunConfiguration == null ? 600 : mobileRunConfiguration.getScreenHeight();
      int fullWidth = mobileRunConfiguration == null ? 800 : mobileRunConfiguration.getFullScreenWidth();
      int fullHeight = mobileRunConfiguration == null ? 600 : mobileRunConfiguration.getFullScreenHeight();

      screenWidthField.setEditable(true);
      screenWidthField.setText(String.valueOf(width));
      screenHeightField.setEditable(true);
      screenHeightField.setText(String.valueOf(height));

      fullScreenWidthField.setEditable(true);
      fullScreenWidthField.setText(String.valueOf(fullWidth));
      fullScreenHeightField.setEditable(true);
      fullScreenHeightField.setText(String.valueOf(fullHeight));
    } else {
      screenWidthField.setEditable(false);
      screenWidthField.setText(String.valueOf(emulator.getScreenWidth()));
      screenHeightField.setEditable(false);
      screenHeightField.setText(String.valueOf(emulator.getScreenHeight()));

      fullScreenWidthField.setEditable(false);
      fullScreenWidthField.setText(String.valueOf(emulator.getFullScreenWidth()));
      fullScreenHeightField.setEditable(false);
      fullScreenHeightField.setText(String.valueOf(emulator.getFullScreenHeight()));
    }
  }

  public void updateDescriptorPaths(final String solutionName) {
    if (StringUtils.isEmpty(solutionName)) {
      return;
    }

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        if (StringUtils.isEmpty(myDescriptorPathField.getText()) && StringUtils.isEmpty(myRootDirectoryField.getText())) {
          Solution solution = MPSModuleRepository.getInstance().getSolution(solutionName);
          if (solution != null) {
            SolutionDescriptor descriptor = solution.getModuleDescriptor();
            CompilerSettings compilerSettings = descriptor.getCompilerSettings();
            compilerSettings.update(descriptor);

            String rootPath = null;
            if (compilerSettings.inheritProjectOutputPath) {
              rootPath = solution.getDescriptorFile().getParent().getPath() + File.separator + CompilerSettings.DEFAULT_OUTPUT_PROJECT_DIR;
            } else {
              rootPath = compilerSettings.outputPath;
            }

            String descriptorPath = new File(rootPath, solution + "-air-app.xml").getPath();

            AIRMobileRunConfigurationComponent.this.myDescriptorPathField.setText(descriptorPath);
            AIRMobileRunConfigurationComponent.this.myRootDirectoryField.setText(rootPath);
          }
        }
      }
    });
  }

  public JPanel getContentPane() {
    return contentPane;
  }

  private void createUIComponents() {
    contentPane = new JPanel();
    add(contentPane);
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
    contentPane.setLayout(new GridLayoutManager(7, 1, new Insets(0, 0, 0, 0), -1, -1));
    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(417, 24), null, 0, false));
    final JLabel label1 = new JLabel();
    label1.setFont(new Font(label1.getFont().getName(), Font.BOLD, label1.getFont().getSize()));
    label1.setText("Run configuration for module:");
    panel1.add(label1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    moduleChooser = new JComboBox();
    panel1.add(moduleChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(200, -1), new Dimension(200, -1), 0, false));
    final Spacer spacer1 = new Spacer();
    contentPane.add(spacer1, new GridConstraints(5, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(5, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel2.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Launcher"));
    myDefaultModuleOutputGenerateRadioButton = new JRadioButton();
    myDefaultModuleOutputGenerateRadioButton.setText("Default Module Output (generate AIR descriptor)");
    panel2.add(myDefaultModuleOutputGenerateRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myCustomAIRDescriptorRadioButton = new JRadioButton();
    myCustomAIRDescriptorRadioButton.setText("Custom AIR Descriptor:");
    panel2.add(myCustomAIRDescriptorRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(2, 2, new Insets(0, 50, 0, 0), -1, -1));
    panel2.add(panel3, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label2 = new JLabel();
    label2.setHorizontalAlignment(4);
    label2.setText("Descriptor Path:");
    panel3.add(label2, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label3 = new JLabel();
    label3.setHorizontalAlignment(4);
    label3.setText("Root Directory:");
    panel3.add(label3, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myDescriptorPathField = new TextFieldWithBrowseButton();
    panel3.add(myDescriptorPathField, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, new Dimension(350, -1), new Dimension(350, -1), new Dimension(350, -1), 0, false));
    myRootDirectoryField = new TextFieldWithBrowseButton();
    panel3.add(myRootDirectoryField, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, new Dimension(350, -1), new Dimension(350, -1), new Dimension(350, -1), 0, false));
    myExistingAPKPackageRadioButton = new JRadioButton();
    myExistingAPKPackageRadioButton.setText("Existing APK package:");
    panel2.add(myExistingAPKPackageRadioButton, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel4 = new JPanel();
    panel4.setLayout(new GridLayoutManager(1, 2, new Insets(0, 65, 0, 0), -1, -1));
    panel2.add(panel4, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    existingAPKField = new TextFieldWithBrowseButton();
    panel4.add(existingAPKField, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, new Dimension(350, -1), new Dimension(350, -1), new Dimension(350, -1), 0, false));
    packagePathLabel = new JLabel();
    packagePathLabel.setHorizontalAlignment(4);
    packagePathLabel.setText("Package Path:");
    panel4.add(packagePathLabel, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel5 = new JPanel();
    panel5.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel5, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel5.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Options"));
    final JPanel panel6 = new JPanel();
    panel6.setLayout(new GridLayoutManager(2, 2, new Insets(0, 10, 0, 0), -1, -1));
    panel5.add(panel6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label4 = new JLabel();
    label4.setText("AIR Debug Launcher options:");
    panel6.add(label4, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label5 = new JLabel();
    label5.setText("Program parameters:");
    panel6.add(label5, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, 1, 1, null, null, null, 0, false));
    launcherOptionsField = new JTextField();
    panel6.add(launcherOptionsField, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    programParametersField = new JTextField();
    panel6.add(programParametersField, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    final JPanel panel7 = new JPanel();
    panel7.setLayout(new GridLayoutManager(3, 1, new Insets(0, 0, 3, 0), -1, -1));
    contentPane.add(panel7, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel7.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Run Target"));
    emulatorRunTargetRB = new JRadioButton();
    emulatorRunTargetRB.setText("Emulator:");
    panel7.add(emulatorRunTargetRB, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    deviceRunTargetRB = new JRadioButton();
    deviceRunTargetRB.setText("Android Device");
    panel7.add(deviceRunTargetRB, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel8 = new JPanel();
    panel8.setLayout(new GridLayoutManager(3, 2, new Insets(0, 50, 0, 0), -1, -1));
    panel7.add(panel8, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label6 = new JLabel();
    label6.setText("Device Kind:");
    panel8.add(label6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    emulatorComboBox = new JComboBox();
    final DefaultComboBoxModel defaultComboBoxModel1 = new DefaultComboBoxModel();
    emulatorComboBox.setModel(defaultComboBoxModel1);
    panel8.add(emulatorComboBox, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, new Dimension(250, -1), new Dimension(250, -1), new Dimension(250, -1), 0, false));
    final JLabel label7 = new JLabel();
    label7.setText("Screen Size:");
    panel8.add(label7, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label8 = new JLabel();
    label8.setText("Full Screen Size:");
    panel8.add(label8, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel9 = new JPanel();
    panel9.setLayout(new GridLayoutManager(1, 3, new Insets(0, 0, 0, 0), -1, -1));
    panel8.add(panel9, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    screenWidthField = new JTextField();
    panel9.add(screenWidthField, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, new Dimension(50, -1), new Dimension(50, -1), new Dimension(50, -1), 0, false));
    final JLabel label9 = new JLabel();
    label9.setText("x");
    panel9.add(label9, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    screenHeightField = new JTextField();
    panel9.add(screenHeightField, new GridConstraints(0, 2, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, new Dimension(50, -1), new Dimension(50, -1), new Dimension(50, -1), 0, false));
    final JPanel panel10 = new JPanel();
    panel10.setLayout(new GridLayoutManager(1, 3, new Insets(0, 0, 0, 0), -1, -1));
    panel8.add(panel10, new GridConstraints(2, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    fullScreenWidthField = new JTextField();
    panel10.add(fullScreenWidthField, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, new Dimension(50, -1), new Dimension(50, -1), new Dimension(50, -1), 0, false));
    final JLabel label10 = new JLabel();
    label10.setText("x");
    panel10.add(label10, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    fullScreenHeightField = new JTextField();
    panel10.add(fullScreenHeightField, new GridConstraints(0, 2, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, new Dimension(50, -1), new Dimension(50, -1), new Dimension(50, -1), 0, false));
    final Spacer spacer2 = new Spacer();
    contentPane.add(spacer2, new GridConstraints(6, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, new Dimension(500, -1), new Dimension(500, -1), new Dimension(500, -1), 0, false));
    errorLabel = new JLabel();
    errorLabel.setFont(new Font(errorLabel.getFont().getName(), Font.BOLD, errorLabel.getFont().getSize()));
    errorLabel.setForeground(new Color(-65536));
    errorLabel.setText("");
    errorLabel.setVisible(false);
    contentPane.add(errorLabel, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myDefaultModuleOutputGenerateRadioButton);
    buttonGroup.add(myCustomAIRDescriptorRadioButton);
    buttonGroup.add(myExistingAPKPackageRadioButton);
    buttonGroup = new ButtonGroup();
    buttonGroup.add(emulatorRunTargetRB);
    buttonGroup.add(deviceRunTargetRB);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return contentPane;
  }
}
