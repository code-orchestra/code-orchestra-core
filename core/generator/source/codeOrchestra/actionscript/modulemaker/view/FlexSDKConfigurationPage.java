package codeOrchestra.actionscript.modulemaker.view;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextComponentAccessor;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionScript.flexsdk.FlexSDKLib;
import codeOrchestra.actionScript.flexsdk.FlexSDKLibsManager;
import codeOrchestra.actionScript.flexsdk.FlexSDKNotPresentException;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import jetbrains.mps.InternalFlag;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Alexander Eliseyev
 */
public class FlexSDKConfigurationPage {

  private JPanel flexSettingPanel;
  private JRadioButton mxmlcRadioButton;
  private JRadioButton fcshRadioButton;
  private JRadioButton falconRadioButton;

  private TextFieldWithBrowseButton fileChooser;
  private FlexSDKSettings flexSDKSettings;

  public FlexSDKConfigurationPage(FlexSDKSettings flexSDKSettings) {
    this.flexSDKSettings = flexSDKSettings;

    flexSettingPanel = new JPanel();
    flexSettingPanel.setLayout(new GridLayoutManager(5, 1, new Insets(10, 10, 10, 10), -1, -1));

    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel1.add(new JLabel("Flex SDK path:"), new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    flexSettingPanel.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    fileChooser = new TextFieldWithBrowseButton();
    fileChooser.addBrowseFolderListener(
      "Flex SDK path",
      "Specify the Flex SDK location",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(false, true, false, false, false, false),
      TextComponentAccessor.TEXT_FIELD_WHOLE_TEXT,
      false);
    panel2.add(fileChooser, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    flexSettingPanel.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel3.add(new JLabel("Compile with:"), new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    flexSettingPanel.add(panel3, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    final JPanel compilerPanel = new JPanel();
    compilerPanel.setLayout(new GridLayoutManager(3, 1, new Insets(0, 15, 0, 0), -1, -1));
    ButtonGroup compilerButtonGroup = new ButtonGroup();
    mxmlcRadioButton = new JRadioButton("MXMLC/COMPC");
    fcshRadioButton = new JRadioButton("Flex Compiler Shell (fcsh)");
    falconRadioButton = new JRadioButton("Falcon (Skip generation, pass AST directly to the compiler)");

    ActionListener listener = new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        fileChooser.setEnabled(!falconRadioButton.isSelected());
      }
    };
    mxmlcRadioButton.addActionListener(listener);
    fcshRadioButton.addActionListener(listener);
    falconRadioButton.addActionListener(listener);

    compilerButtonGroup.add(mxmlcRadioButton);
    compilerButtonGroup.add(fcshRadioButton);
    compilerButtonGroup.add(falconRadioButton);
    compilerPanel.add(mxmlcRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    compilerPanel.add(fcshRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    compilerPanel.add(falconRadioButton, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    flexSettingPanel.add(compilerPanel, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    flexSettingPanel.add(new Spacer(), new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_NORTH, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
  }

  public JPanel getContentPanel() {
    return flexSettingPanel;
  }

  public boolean isFlexSDKPathChanged() {
    return !ObjectUtils.equals(flexSDKSettings.getFlexSDKPath(), fileChooser.getText());
  }

  public boolean isModified() {
    return isFlexSDKPathChanged() || flexSDKSettings.getCompilerKind() != getSelectedCompilerKind();
  }

  public void apply() throws ConfigurationException {
    String newFlexSDKPath = fileChooser.getText();

    try {
      FlexSDKLibsManager.getInstance().checkIsValidFlexSDKPath(newFlexSDKPath);
    } catch (FlexSDKNotPresentException e) {
      throw new ConfigurationException(e.getMessage());
    }

    flexSDKSettings.setFlexSDKPath(newFlexSDKPath);
    flexSDKSettings.setCompilerKind(getSelectedCompilerKind());
  }

  private CompilerKind getSelectedCompilerKind() {
    if (fcshRadioButton.isSelected()) {
      return CompilerKind.FCSH;
    } else if (mxmlcRadioButton.isSelected()) {
      return CompilerKind.MXMCL_COMPC;
    } else {
      return CompilerKind.FALCON;
    }
  }

  public void reset() {
    fileChooser.setText(flexSDKSettings.getFlexSDKPath());

    fileChooser.setEnabled(!falconRadioButton.isSelected());

    switch (flexSDKSettings.getCompilerKind()) {
      case MXMCL_COMPC:
        mxmlcRadioButton.setSelected(true);
        break;
      case FCSH:
        fcshRadioButton.setSelected(true);
        break;
      case FALCON:
        falconRadioButton.setSelected(true);
        break;
    }
  }

}