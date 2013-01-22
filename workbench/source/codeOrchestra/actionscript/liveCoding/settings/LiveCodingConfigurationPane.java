package codeOrchestra.actionscript.liveCoding.settings;

import codeOrchestra.actionscript.modulemaker.CompilerKind;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;

import javax.swing.ButtonGroup;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import java.awt.Insets;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingConfigurationPane {

  private JPanel liveCodingSettingPanel;
  private JRadioButton mxmlcRadioButton;
  private JRadioButton fcshRadioButton;
  private JRadioButton falconRadioButton;

  private LiveCodingSettings liveCodingSettings;

  public LiveCodingConfigurationPane(LiveCodingSettings liveCodingSettings) {
    this.liveCodingSettings = liveCodingSettings;

    liveCodingSettingPanel = new JPanel();
    liveCodingSettingPanel.setLayout(new GridLayoutManager(3, 1, new Insets(10, 10, 10, 10), -1, -1));


    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel3.add(new JLabel("Compile with:"), new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    liveCodingSettingPanel.add(panel3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    final JPanel compilerPanel = new JPanel();
    compilerPanel.setLayout(new GridLayoutManager(3, 1, new Insets(0, 15, 0, 0), -1, -1));
    ButtonGroup compilerButtonGroup = new ButtonGroup();
    mxmlcRadioButton = new JRadioButton("MXMLC/COMPC");
    fcshRadioButton = new JRadioButton("Flex Compiler Shell (fcsh)");
    falconRadioButton = new JRadioButton("Falcon (Skip generation, pass AST directly to the compiler)");

    compilerButtonGroup.add(mxmlcRadioButton);
    compilerButtonGroup.add(fcshRadioButton);
    compilerButtonGroup.add(falconRadioButton);
    compilerPanel.add(mxmlcRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    compilerPanel.add(fcshRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    compilerPanel.add(falconRadioButton, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));
    liveCodingSettingPanel.add(compilerPanel, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_NORTHWEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, 1, null, null, null, 0, false));

    liveCodingSettingPanel.add(new Spacer(), new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_NORTH, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
  }

  public JPanel getContentPanel() {
    return liveCodingSettingPanel;
  }

  public boolean isModified() {
    return liveCodingSettings.getCompilerKind() != getSelectedCompilerKind();
  }

  public void apply() throws ConfigurationException {
    liveCodingSettings.setCompilerKind(getSelectedCompilerKind());
  }

  public void reset() {
    switch (liveCodingSettings.getCompilerKind()) {
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

  private CompilerKind getSelectedCompilerKind() {
    if (fcshRadioButton.isSelected()) {
      return CompilerKind.FCSH;
    } else if (mxmlcRadioButton.isSelected()) {
      return CompilerKind.MXMCL_COMPC;
    } else {
      return CompilerKind.FALCON;
    }
  }





}
