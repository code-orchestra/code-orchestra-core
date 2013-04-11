package codeOrchestra.actionscript.run.compiler;

import codeOrchestra.actionscript.run.compiler.PlayerComboBox.PlayerComboBox;
import com.intellij.openapi.util.Computable;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionScript.optimization.OptimizeImportsHelper;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.fileTypes.StdFileTypes;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.run.compiler.utils.CheckMainClassUtil;
import codeOrchestra.actionscript.view.utils.ModelUtils;
import codeOrchestra.javaScript.generator.JSOptimizationKind;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.dialogs.choosers.CommonChoosers;
import org.apache.commons.lang.StringUtils;

import javax.swing.*;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.*;
import java.util.*;

public class CompilerSettingsDialog extends JDialog implements ISynchronizable {
  private JPanel contentPane;
  private JButton buttonOK;
  private JButton buttonCancel;
  private JComboBox outputType;
  private JCheckBox myUseDefaultSDKCompilerCheckBox;
  private JCheckBox myUseCustomCompilerCofigurationCheckBox;
  private JTextField outputFileName;
  private JRadioButton myInheritProjectOutputPathRadioButton;
  private JRadioButton myUseModuleCompileOutputRadioButton;
  private JTextField moduleOutputPath;
  private JCheckBox myIncludeResourceFilesInCheckBox;
  private JCheckBox myUseFrameworkAsRuntimeCheckBox;
  private JCheckBox myNonDefaultLocaleSettingsCheckBox;
  private JTextField compilerOptions;
  private JTextField localeSettings;
  private TextFieldWithBrowseButton customCompilerConfigurationPath;
  private TextFieldWithBrowseButton mainClass;
  private JPanel compilerOutputPanel;
  private JPanel useDefaultSDKCompilerPanel;
  private JPanel useCustomCompilerConfigPanel;
  private JPanel targetPlayerPanel;
  private JPanel additionalCompilerPanel;
  private JPanel compilationSettingsPanel;
  private JPanel mainClassPanel;
  private JPanel advancedJSCheckboxesPanel;
  private JPanel regularJSCheckBoxes;
  private JCheckBox myIncludeAllClassesCheckBox;
  private JPanel additionalFlexPropertiesPanel;
  private JButton myExcludedPackagesButton;
  private PlayerComboBox myTargetPlayerVersionComboBox;

  private Map<JSOptimizationKind, JCheckBox> jsAdvancedOptimizationCheckboxes = new HashMap<JSOptimizationKind, JCheckBox>();
  private Map<JSOptimizationKind, JCheckBox> jsRegularOptimizationCheckboxes = new HashMap<JSOptimizationKind, JCheckBox>();

  private List<String> excludedPackages;

  private String mainClassNodeId;
  private String mainClassModelUID;

  private CompilerSettings compilerSettings;

  private String solutionName;
  private BaseDialog parent;

  private List<JComponent> customCompilerOptionComponents = new ArrayList<JComponent>();
  private List<JComponent> flexSettingsComponents = new ArrayList<JComponent>();
  private List<JComponent> html5SettingsComponents = new ArrayList<JComponent>();


  public JPanel getContentPane() {
    return contentPane;
  }

  public CompilerSettingsDialog(CompilerSettings compilerSettings, final Project project, final String solutionName, final BaseDialog parent) {
    this.compilerSettings = compilerSettings;
    $$$setupUI$$$();
    setContentPane(contentPane);
    setModal(true);
    getRootPane().setDefaultButton(buttonOK);
    this.solutionName = solutionName;
    this.parent = parent;

    initJSCheckboxes();

    initData();

    customCompilerConfigurationPath.addBrowseFolderListener("Compiler configuration", "Choose custom compiler configuration XML file", project,
      new FileChooserDescriptor(true, false, false, false, false, false) {
        public boolean isFileSelectable(VirtualFile file) {
          return super.isFileSelectable(file) && file.getFileType() == StdFileTypes.XML;
        }
      });

    mainClass.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        // Collect main classes
        final ArrayList<SNode> classes = new ArrayList<SNode>();
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            Solution module = MPSModuleRepository.getInstance().getSolution(solutionName);
            if (module == null) {
              return;
            }
            for (SModelDescriptor sModelDescriptor : module.getEditableUserModels()) {
              for (SNode sNode : sModelDescriptor.getSModel().roots()) {
                // RE-2788
                boolean mainClassMustBeSprite = outputType.getSelectedIndex() == OutputType.FLEX_APPLICATION.ordinal();
                if (!mainClassMustBeSprite || CheckMainClassUtil.isMainClass(sNode, classes)) {
                  classes.add(sNode);
                }
              }
            }
          }
        });

        // Pick one
        final SNode selectedNode = CommonChoosers.showDialogNodeChooser(getContentPane(), classes, "Choose a Main Class", "class");
        if (selectedNode == null) {
          return;
        }

        // Set the result into UI
        String packageName = ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return selectedNode.getModel().getLongName();
          }
        });
        String className = ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return selectedNode.getName();
          }
        });
        String fqName;
        if (packageName == null || packageName.isEmpty()) {
          fqName = className;
        } else {
          fqName = packageName + "." + className;
        }
        mainClass.setText(fqName);

        // Save
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            SModelReference mainClassModelRef = selectedNode.getModel().getSModelReference();
            mainClassNodeId = selectedNode.getId();
            mainClassModelUID = mainClassModelRef.toString();
          }
        });
      }
    });
    mainClass.getTextField().setEditable(false);

    myExcludedPackagesButton.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent actionEvent) {
        ExcludePackagesDialog excludePackagesDialog = new ExcludePackagesDialog(parent, MPSModuleRepository.getInstance().getSolution(solutionName), excludedPackages);
        excludePackagesDialog.setModal(true);
        excludePackagesDialog.showDialog();
      }
    });
  }

  private void initJSCheckboxes() {
    int regularRow = 0;
    int advancedRow = 0;

    advancedJSCheckboxesPanel.setLayout(new GridLayoutManager(JSOptimizationKind.values().length, 1, new Insets(0, 0, 0, 0), -1, -1));
    regularJSCheckBoxes.setLayout(new GridLayoutManager(JSOptimizationKind.values().length, 1, new Insets(0, 0, 0, 0), -1, -1));

    for (JSOptimizationKind jsOptimizationKind : JSOptimizationKind.values()) {
      JCheckBox jsCheckBox = new JCheckBox(jsOptimizationKind.getPresentation());

      Map<JSOptimizationKind, JCheckBox> checkboxesMap = null;
      JPanel checkboxesPanel = null;

      if (jsOptimizationKind.isAdvanced()) {
        checkboxesMap = jsAdvancedOptimizationCheckboxes;
        checkboxesPanel = advancedJSCheckboxesPanel;
      } else {
        checkboxesMap = jsRegularOptimizationCheckboxes;
        checkboxesPanel = regularJSCheckBoxes;
      }

      checkboxesMap.put(jsOptimizationKind, jsCheckBox);
      checkboxesPanel.add(jsCheckBox, new GridConstraints(jsOptimizationKind.isAdvanced() ? advancedRow++ : regularRow++, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    }
  }

  private void initData() {
    // Custom compile settings
    customCompilerOptionComponents.add(mainClass);
    customCompilerOptionComponents.add(myInheritProjectOutputPathRadioButton);
    customCompilerOptionComponents.add(myUseModuleCompileOutputRadioButton);
    customCompilerOptionComponents.add(outputFileName);
    customCompilerOptionComponents.add(moduleOutputPath);
    customCompilerOptionComponents.add(myIncludeResourceFilesInCheckBox);
    customCompilerOptionComponents.add(myUseFrameworkAsRuntimeCheckBox);
    customCompilerOptionComponents.add(myNonDefaultLocaleSettingsCheckBox);
    customCompilerOptionComponents.add(localeSettings);

    // Flex-specific
    flexSettingsComponents.add(compilerOutputPanel);
    flexSettingsComponents.add(useCustomCompilerConfigPanel);
    flexSettingsComponents.add(useDefaultSDKCompilerPanel);
    flexSettingsComponents.add(targetPlayerPanel);
    flexSettingsComponents.add(additionalCompilerPanel);
    flexSettingsComponents.add(additionalFlexPropertiesPanel);

    // HTML5-specific
    html5SettingsComponents.add(advancedJSCheckboxesPanel);

    myUseCustomCompilerCofigurationCheckBox.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        customCompilerConfigurationPath.setEnabled(myUseCustomCompilerCofigurationCheckBox.isSelected());
        enableCustomCompileSettings(!myUseCustomCompilerCofigurationCheckBox.isSelected());
        updateSWCEnabled();
      }
    });
    myInheritProjectOutputPathRadioButton.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        moduleOutputPath.setEnabled(false);
      }
    });
    myUseModuleCompileOutputRadioButton.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        moduleOutputPath.setEnabled(true);
      }
    });
    outputType.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        boolean isLibrary = outputType.getSelectedIndex() == 1;
        myIncludeResourceFilesInCheckBox.setVisible(isLibrary);
        myExcludedPackagesButton.setVisible(isLibrary);

        String fileName = outputFileName.getText();
        if (fileName != null) {
          if (isLibrary) {
            if (fileName.toLowerCase().endsWith(".swf")) {
              outputFileName.setText(fileName.replace(".swf", ".swc"));
            }
          } else {
            if (fileName.toLowerCase().endsWith(".swc")) {
              outputFileName.setText(fileName.replace(".swc", ".swf"));
            }
          }
        }

        boolean isFlexModule = outputType.getSelectedIndex() == OutputType.FLEX_APPLICATION.getIndex() || outputType.getSelectedIndex() == OutputType.FLEX_LIBRARY.getIndex();
        setFlexSettingsComponentsVisible(isFlexModule);
        setHTML5SettingsComponentsVisible(!isFlexModule);

        parent.setErrorText("");
      }
    });
    myNonDefaultLocaleSettingsCheckBox.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        localeSettings.setEnabled(myNonDefaultLocaleSettingsCheckBox.isSelected());
      }
    });

    outputType.setSelectedIndex(compilerSettings.getOutputType().getIndex());
    myUseDefaultSDKCompilerCheckBox.setSelected(compilerSettings.useDefaultSDKConfiguration);
    myUseCustomCompilerCofigurationCheckBox.setSelected(compilerSettings.useCustomSDKConfiguration);
    customCompilerConfigurationPath.setText(compilerSettings.configurationFile);

    String mainClassNodeId = compilerSettings.mainClassNodeId;
    String mainClassModelUID = compilerSettings.mainClassModelUID;

    if (mainClassNodeId != null && mainClassModelUID != null) {
      final SNodePointer mainClassPointer = new SNodePointer(mainClassModelUID, mainClassNodeId);
      final SNode mainClassNode = ModelAccess.instance().runReadAction(new Computable<SNode>() {
        public SNode compute() {
          return mainClassPointer.getNode();
        }
      });
      if (mainClassNode != null) {
        String fqMainClassName = ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return NameUtil.longNameFromNamespaceAndShortName(mainClassNode.getModel().getLongName(), mainClassNode.getName());
          }
        });
        mainClass.setText(fqMainClassName);
      }
    }

    if (compilerSettings.outputFileName == null) {
      String filename = solutionName + "." + (compilerSettings.getOutputType() == OutputType.FLEX_LIBRARY ? "swc" : "swf");
      outputFileName.setText(filename);
    } else {
      outputFileName.setText(compilerSettings.outputFileName);
    }

    myUseModuleCompileOutputRadioButton.setSelected(!compilerSettings.inheritProjectOutputPath);
    myInheritProjectOutputPathRadioButton.setSelected(compilerSettings.inheritProjectOutputPath);
    moduleOutputPath.setText(compilerSettings.outputPath);

    myTargetPlayerVersionComboBox.selectPlayer(compilerSettings.playerVersion);

    myUseFrameworkAsRuntimeCheckBox.setSelected(compilerSettings.useFrameworkAsRSL);
    myIncludeAllClassesCheckBox.setSelected(compilerSettings.includeAllRoots());
    myIncludeResourceFilesInCheckBox.setSelected(compilerSettings.includeResources);
    compilerOptions.setText(compilerSettings.compilerOptions);
    myNonDefaultLocaleSettingsCheckBox.setSelected(compilerSettings.nonDefaultLocale);
    localeSettings.setText(compilerSettings.localeOptions);

    // Enabled/disabled
    customCompilerConfigurationPath.setEnabled(myUseCustomCompilerCofigurationCheckBox.isSelected());
    moduleOutputPath.setEnabled(!compilerSettings.inheritProjectOutputPath);
    myIncludeResourceFilesInCheckBox.setEnabled(outputType.getSelectedIndex() == 1);
    localeSettings.setEnabled(myNonDefaultLocaleSettingsCheckBox.isSelected());
    if (myUseCustomCompilerCofigurationCheckBox.isSelected()) {
      enableCustomCompileSettings(false);
    }

    this.mainClassNodeId = compilerSettings.mainClassNodeId;
    this.mainClassModelUID = compilerSettings.mainClassModelUID;

    this.excludedPackages = compilerSettings.getExcludedPackages();

    updateSWCEnabled();
  }

  private void updateSWCEnabled() {
    if (compilerSettings.isSWC) {
      myInheritProjectOutputPathRadioButton.setEnabled(false);
      myUseModuleCompileOutputRadioButton.setEnabled(false);
      moduleOutputPath.setEnabled(false);
      outputFileName.setEnabled(false);
      outputType.setEnabled(false);
    }
  }

  private void setHTML5SettingsComponentsVisible(boolean visible) {
    // RE-4173
    updateJSCheckboxes(visible, jsAdvancedOptimizationCheckboxes);
    updateJSCheckboxes(visible, jsRegularOptimizationCheckboxes);

    for (JComponent jComponent : html5SettingsComponents) {
      jComponent.setVisible(visible);
    }
  }

  private void updateJSCheckboxes(boolean visible, Map<JSOptimizationKind, JCheckBox> jsOptimizationCheckboxes) {
    for (JSOptimizationKind jsOptimizationKind : jsOptimizationCheckboxes.keySet()) {
      // Toggle visibility
      JCheckBox optimizationCheckbox = jsOptimizationCheckboxes.get(jsOptimizationKind);
      optimizationCheckbox.setVisible(visible && jsOptimizationKind.isApplicable(OutputType.byIndex(outputType.getSelectedIndex())));

      // Toggle selection
      if (visible) {
        optimizationCheckbox.setSelected(compilerSettings.isJSOptimizationOn_noCheck(jsOptimizationKind));
      }
    }
  }

  private void setFlexSettingsComponentsVisible(boolean visible) {
    for (JComponent jComponent : flexSettingsComponents) {
      jComponent.setVisible(visible);
    }

    mainClassPanel.setVisible(outputType.getSelectedIndex() == OutputType.FLEX_APPLICATION.getIndex() || outputType.getSelectedIndex() == OutputType.HTML5_APPLICATION.getIndex());
    compilationSettingsPanel.setVisible(outputType.getSelectedIndex() != OutputType.HTML5_LIBRARY.getIndex());
  }

  private void enableCustomCompileSettings(boolean enable) {
    for (JComponent jComponent : customCompilerOptionComponents) {
      jComponent.setEnabled(enable);
    }
  }

  public boolean sync() {
    if (!doValidate()) {
      return false;
    }

    compilerSettings.mainClassNodeId = mainClassNodeId;
    compilerSettings.mainClassModelUID = mainClassModelUID;

    compilerSettings.setExcludedPackages(excludedPackages);

    boolean outputTypeChanged = compilerSettings.outputTypeIndex != outputType.getSelectedIndex();

    compilerSettings.outputTypeIndex = outputType.getSelectedIndex();
    compilerSettings.useDefaultSDKConfiguration = myUseDefaultSDKCompilerCheckBox.isSelected();
    compilerSettings.useCustomSDKConfiguration = myUseCustomCompilerCofigurationCheckBox.isSelected();
    compilerSettings.configurationFile = customCompilerConfigurationPath.getText();
    compilerSettings.outputFileName = outputFileName.getText();
    compilerSettings.inheritProjectOutputPath = myInheritProjectOutputPathRadioButton.isSelected();
    compilerSettings.outputPath = moduleOutputPath.getText();

    compilerSettings.playerVersion = myTargetPlayerVersionComboBox.getSelectedItem().getPlayer();

    compilerSettings.useFrameworkAsRSL = myUseFrameworkAsRuntimeCheckBox.isSelected();
    compilerSettings.includeResources = myIncludeResourceFilesInCheckBox.isSelected();
    compilerSettings.compilerOptions = compilerOptions.getText();
    compilerSettings.nonDefaultLocale = myNonDefaultLocaleSettingsCheckBox.isSelected();
    compilerSettings.localeOptions = localeSettings.getText();
    compilerSettings.setIncludeAllRoots(myIncludeAllClassesCheckBox.isSelected());

    // RE-3543 - Add/remove astojs import
    final Solution module = MPSModuleRepository.getInstance().getSolution(solutionName);
    if (module != null) {
      final boolean addAstojsImport = EnumSet.of(OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY).contains(compilerSettings.getOutputType());
      ModelAccess.instance().runWriteAction(new Runnable() {
        @Override
        public void run() {
          ModelUtils.toggleAS2JSDenepdency(module, addAstojsImport);
        }
      });
    }

    // RE-4173
    for (JSOptimizationKind jsOptimizationKind : jsAdvancedOptimizationCheckboxes.keySet()) {
      JCheckBox optimizationCheckbox = jsAdvancedOptimizationCheckboxes.get(jsOptimizationKind);
      compilerSettings.toggleJSOptimization(jsOptimizationKind, optimizationCheckbox.isSelected());
    }
    for (JSOptimizationKind jsOptimizationKind : jsRegularOptimizationCheckboxes.keySet()) {
      JCheckBox optimizationCheckbox = jsRegularOptimizationCheckboxes.get(jsOptimizationKind);
      compilerSettings.toggleJSOptimization(jsOptimizationKind, optimizationCheckbox.isSelected());
    }

    // RE-4100
    if (outputTypeChanged) {
      OptimizeImportsHelper optimizeImportsHelper = new OptimizeImportsHelper(new ModuleContext(module, ProjectHolder.getProject()));
      optimizeImportsHelper.optimizeSolutionImports((Solution) module);
    }

    return true;
  }

  private boolean doValidate() {
    if (contentPane.getParent().isVisible()) {
      // Main class is needed for Flex & HTML5 application output types
      if (outputType.getSelectedIndex() == OutputType.FLEX_APPLICATION.getIndex() || outputType.getSelectedIndex() == OutputType.HTML5_APPLICATION.getIndex()) {
        if (!myUseCustomCompilerCofigurationCheckBox.isSelected() && StringUtils.isEmpty(mainClass.getText())) {
          parent.setErrorText("Main class is not specified");
          return false;
        }
      }

      // Skip validation for HTML5 output type
      if (outputType.getSelectedIndex() == OutputType.HTML5_APPLICATION.getIndex() || outputType.getSelectedIndex() == OutputType.HTML5_LIBRARY.getIndex()) {
        return true;
      }

      if (myUseCustomCompilerCofigurationCheckBox.isSelected() && StringUtils.isEmpty(customCompilerConfigurationPath.getText())) {
        parent.setErrorText("Custom configuration path is empty");
        return false;
      }

      if (!myUseCustomCompilerCofigurationCheckBox.isSelected() && StringUtils.isEmpty(outputFileName.getText())) {
        parent.setErrorText("Output file name is empty");
        return false;
      }

      if (!myUseCustomCompilerCofigurationCheckBox.isSelected() && myUseModuleCompileOutputRadioButton.isSelected() && StringUtils.isEmpty(moduleOutputPath.getText())) {
        parent.setErrorText("Module output path is not specified");
        return false;
      }
    }
    return true;
  }

  private void onOK() {
    // add your code here
    dispose();
  }

  private void onCancel() {
    // add your code here if necessary
    dispose();
  }

  private void createUIComponents() {
    // TODO: place custom component creation code here
  }

  /**
   * Method generated by IntelliJ IDEA GUI Designer
   * >>> IMPORTANT!! <<<
   * DO NOT edit this method OR call it in your code!
   *
   * @noinspection ALL
   */
  private void $$$setupUI$$$() {
    contentPane = new JPanel();
    contentPane.setLayout(new GridLayoutManager(2, 1, new Insets(10, 10, 10, 10), -1, -1));
    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(8, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    useDefaultSDKCompilerPanel = new JPanel();
    useDefaultSDKCompilerPanel.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(useDefaultSDKCompilerPanel, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myUseDefaultSDKCompilerCheckBox = new JCheckBox();
    myUseDefaultSDKCompilerCheckBox.setSelected(true);
    myUseDefaultSDKCompilerCheckBox.setText("Use default SDK compiler configuration file");
    useDefaultSDKCompilerPanel.add(myUseDefaultSDKCompilerCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(panel2, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label1 = new JLabel();
    label1.setText("Output type:");
    panel2.add(label1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    outputType = new JComboBox();
    final DefaultComboBoxModel defaultComboBoxModel1 = new DefaultComboBoxModel();
    defaultComboBoxModel1.addElement("Flash Application");
    defaultComboBoxModel1.addElement("Flash Library");
    defaultComboBoxModel1.addElement("HTML5 Application");
    defaultComboBoxModel1.addElement("HTML5 Library");
    outputType.setModel(defaultComboBoxModel1);
    panel2.add(outputType, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(160, 27), new Dimension(170, -1), 0, false));
    useCustomCompilerConfigPanel = new JPanel();
    useCustomCompilerConfigPanel.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(useCustomCompilerConfigPanel, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myUseCustomCompilerCofigurationCheckBox = new JCheckBox();
    myUseCustomCompilerCofigurationCheckBox.setText("Use custom compiler cofiguration file");
    useCustomCompilerConfigPanel.add(myUseCustomCompilerCofigurationCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    customCompilerConfigurationPath = new TextFieldWithBrowseButton();
    customCompilerConfigurationPath.setText("");
    useCustomCompilerConfigPanel.add(customCompilerConfigurationPath, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, 1, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(180, -1), new Dimension(180, -1), 0, false));
    compilationSettingsPanel = new JPanel();
    compilationSettingsPanel.setLayout(new GridLayoutManager(3, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(compilationSettingsPanel, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    compilationSettingsPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), null));
    mainClassPanel = new JPanel();
    mainClassPanel.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    compilationSettingsPanel.add(mainClassPanel, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label2 = new JLabel();
    label2.setText("Main class:");
    mainClassPanel.add(label2, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    mainClass = new TextFieldWithBrowseButton();
    mainClassPanel.add(mainClass, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    compilerOutputPanel = new JPanel();
    compilerOutputPanel.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    compilationSettingsPanel.add(compilerOutputPanel, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    compilerOutputPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Compiler Output"));
    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    compilerOutputPanel.add(panel3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label3 = new JLabel();
    label3.setText("Output file name:");
    panel3.add(label3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    outputFileName = new JTextField();
    panel3.add(outputFileName, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(325, -1), new Dimension(325, -1), 0, false));
    final JPanel panel4 = new JPanel();
    panel4.setLayout(new GridLayoutManager(3, 1, new Insets(0, 0, 0, 0), -1, -1));
    compilerOutputPanel.add(panel4, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myUseModuleCompileOutputRadioButton = new JRadioButton();
    myUseModuleCompileOutputRadioButton.setText("Use module compile output path");
    panel4.add(myUseModuleCompileOutputRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(443, 23), null, 0, false));
    final JPanel panel5 = new JPanel();
    panel5.setLayout(new GridLayoutManager(1, 2, new Insets(0, 50, 0, 0), -1, -1));
    panel4.add(panel5, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(443, 32), null, 0, false));
    final JLabel label4 = new JLabel();
    label4.setText("Output path:");
    panel5.add(label4, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    moduleOutputPath = new JTextField();
    panel5.add(moduleOutputPath, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myInheritProjectOutputPathRadioButton = new JRadioButton();
    myInheritProjectOutputPathRadioButton.setSelected(true);
    myInheritProjectOutputPathRadioButton.setText("Inherit project output path");
    panel4.add(myInheritProjectOutputPathRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(443, 23), null, 0, false));
    targetPlayerPanel = new JPanel();
    targetPlayerPanel.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    compilationSettingsPanel.add(targetPlayerPanel, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel6 = new JPanel();
    panel6.setLayout(new GridLayoutManager(3, 2, new Insets(0, 0, 0, 0), -1, -1));
    targetPlayerPanel.add(panel6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myIncludeResourceFilesInCheckBox = new JCheckBox();
    myIncludeResourceFilesInCheckBox.setText("Include resource files in SWC");
    panel6.add(myIncludeResourceFilesInCheckBox, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myUseFrameworkAsRuntimeCheckBox = new JCheckBox();
    myUseFrameworkAsRuntimeCheckBox.setText("Use Framework as Runtime Shared Library (RSL)");
    panel6.add(myUseFrameworkAsRuntimeCheckBox, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel7 = new JPanel();
    panel7.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel6.add(panel7, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label5 = new JLabel();
    label5.setText("Target player version:");
    panel7.add(label5, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel8 = new JPanel();
    panel8.setLayout(new GridBagLayout());
    panel7.add(panel8, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_FIXED, new Dimension(300, -1), null, new Dimension(300, -1), 0, false));
    myTargetPlayerVersionComboBox = new PlayerComboBox();
    GridBagConstraints gbc;
    gbc = new GridBagConstraints();
    gbc.gridx = 0;
    gbc.gridy = 0;
    gbc.anchor = GridBagConstraints.WEST;
    panel8.add(myTargetPlayerVersionComboBox, gbc);
    final JPanel panel9 = new JPanel();
    panel9.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    targetPlayerPanel.add(panel9, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myNonDefaultLocaleSettingsCheckBox = new JCheckBox();
    myNonDefaultLocaleSettingsCheckBox.setText("Non-default locale settings:");
    panel9.add(myNonDefaultLocaleSettingsCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, 1, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    localeSettings = new JTextField();
    localeSettings.setText("en_US");
    panel9.add(localeSettings, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    additionalCompilerPanel = new JPanel();
    additionalCompilerPanel.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(additionalCompilerPanel, new GridConstraints(6, 0, 1, 1, GridConstraints.ANCHOR_NORTH, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label6 = new JLabel();
    label6.setText("Additional compiler options:");
    additionalCompilerPanel.add(label6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    compilerOptions = new JTextField();
    additionalCompilerPanel.add(compilerOptions, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    advancedJSCheckboxesPanel = new JPanel();
    advancedJSCheckboxesPanel.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(advancedJSCheckboxesPanel, new GridConstraints(5, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    advancedJSCheckboxesPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Advanced JS Code Optimization"));
    regularJSCheckBoxes = new JPanel();
    regularJSCheckBoxes.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(regularJSCheckBoxes, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    additionalFlexPropertiesPanel = new JPanel();
    additionalFlexPropertiesPanel.setLayout(new GridLayoutManager(2, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(additionalFlexPropertiesPanel, new GridConstraints(7, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myIncludeAllClassesCheckBox = new JCheckBox();
    myIncludeAllClassesCheckBox.setText("Include all classes");
    additionalFlexPropertiesPanel.add(myIncludeAllClassesCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer1 = new Spacer();
    additionalFlexPropertiesPanel.add(spacer1, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    myExcludedPackagesButton = new JButton();
    myExcludedPackagesButton.setText("Exclude packages...");
    additionalFlexPropertiesPanel.add(myExcludedPackagesButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer2 = new Spacer();
    contentPane.add(spacer2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    label5.setLabelFor(myTargetPlayerVersionComboBox);
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myInheritProjectOutputPathRadioButton);
    buttonGroup.add(myUseModuleCompileOutputRadioButton);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return contentPane;
  }
}
