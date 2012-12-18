package codeOrchestra.actionscript.liveCoding.run.view.ios;

import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionscript.liveCoding.run.config.LiveCodingMode;
import codeOrchestra.actionscript.liveCoding.run.config.ios.iOSLiveCodingRunConfiguration;
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
public class iOSLiveCodingRunConfigurationComponent extends JPanel {

  private static final int MINIMUM_TABLE_COLUMN_WIDTH = 50;

  private JComboBox moduleChooser;
  private JPanel contentPane;
  private JRadioButton myAllTheMethodsRadioButton;
  private JRadioButton myAnnotatedWithLiveCodingInRadioButton;
  private JCheckBox makeGettersSettersLiveCB;
  private JTextField maxLoopIterationsTF;
  private JTextField maxRecusionDepthTF;
  private JLabel bundleIdLabel;
  private JLabel applicationNameLabel;
  private JTextField bundleIdTF;
  private JTextField applicationNameTF;
  private MPSProject mpsProject;

  public iOSLiveCodingRunConfigurationComponent() {
    this.mpsProject = ProjectAndModuleHolder.getInstance().getProject().getComponent(MPSProject.class);

    $$$setupUI$$$();

  }

  public void reset(final iOSLiveCodingRunConfiguration runConfiguration) {
    // Init moduleChooser

    // RE-1647
    ModuleReference moduleReference = ProjectAndModuleHolder.getInstance().getModuleReference();
    final String moduleName = moduleReference == null ? null : moduleReference.getModuleFqName();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        int i = 0;

        boolean selectionSet = false;

        for (Solution solution : mpsProject.getProjectSolutions()) {
          if (SolutionUtils.isActionScriptDependent(solution) && !SolutionUtils.isStubSolution(solution)) {
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

    // Target

    applicationNameTF.setText(runConfiguration.getApplicationName());
    bundleIdTF.setText(runConfiguration.getBundleId());

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
    maxLoopIterationsTF.setText(String.valueOf(runConfiguration.getMaxLoopIterations()));
    maxRecusionDepthTF.setText(String.valueOf(runConfiguration.getMaxRecursionDepth()));
  }

  public void apply(final iOSLiveCodingRunConfiguration runConfiguration) {
    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      runConfiguration.setModuleName(selectedModuleName);
    }

    // Live coding settings
    runConfiguration.setApplicationName(applicationNameTF.getText());
    runConfiguration.setBundleId(bundleIdTF.getText());

    runConfiguration.setMode(myAllTheMethodsRadioButton.isSelected() ? LiveCodingMode.ALL_METHODS : LiveCodingMode.ANNOTATED_IN_OPEN_TABS);
    runConfiguration.setGettersAndSettersLive(makeGettersSettersLiveCB.isSelected());
    runConfiguration.setMaxLoopIterations(Integer.valueOf(maxLoopIterationsTF.getText()));
    runConfiguration.setMaxRecursionDepth(Integer.valueOf(maxRecusionDepthTF.getText()));
  }

  public void dispose() {

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
    contentPane.setLayout(new GridLayoutManager(4, 1, new Insets(0, 0, 0, 0), -1, -1));
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
    panel2.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    panel2.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Target"));
    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(2, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel2.add(panel3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    bundleIdLabel = new JLabel();
    bundleIdLabel.setText("Application Bundle Id");
    panel3.add(bundleIdLabel, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    bundleIdTF = new JTextField();
    bundleIdTF.setText("");
    panel3.add(bundleIdTF, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    applicationNameTF = new JTextField();
    panel3.add(applicationNameTF, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(150, -1), null, 0, false));
    applicationNameLabel = new JLabel();
    applicationNameLabel.setText("Application Name");
    panel3.add(applicationNameLabel, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer1 = new Spacer();
    contentPane.add(spacer1, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    final JPanel panel4 = new JPanel();
    panel4.setLayout(new GridLayoutManager(4, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel4, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel4.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Settings"));
    final JLabel label2 = new JLabel();
    label2.setText("Live Methods:");
    panel4.add(label2, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    final JPanel panel5 = new JPanel();
    panel5.setLayout(new GridLayoutManager(2, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel4.add(panel5, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myAllTheMethodsRadioButton = new JRadioButton();
    myAllTheMethodsRadioButton.setText("All the methods");
    panel5.add(myAllTheMethodsRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer2 = new Spacer();
    panel5.add(spacer2, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    myAnnotatedWithLiveCodingInRadioButton = new JRadioButton();
    myAnnotatedWithLiveCodingInRadioButton.setText("Annotated with [LiveCoding] and in open tabs");
    panel5.add(myAnnotatedWithLiveCodingInRadioButton, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label3 = new JLabel();
    label3.setText("Make Getters/Setters Live:");
    panel4.add(label3, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    makeGettersSettersLiveCB = new JCheckBox();
    makeGettersSettersLiveCB.setText(" ");
    panel4.add(makeGettersSettersLiveCB, new GridConstraints(1, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JLabel label4 = new JLabel();
    label4.setText("Max Loop Iterations:");
    panel4.add(label4, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    final JLabel label5 = new JLabel();
    label5.setText("Max Recursion Depth:");
    panel4.add(label5, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 1, false));
    maxLoopIterationsTF = new JTextField();
    panel4.add(maxLoopIterationsTF, new GridConstraints(2, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, new Dimension(65, -1), new Dimension(65, -1), new Dimension(65, -1), 0, false));
    maxRecusionDepthTF = new JTextField();
    maxRecusionDepthTF.setEditable(false);
    panel4.add(maxRecusionDepthTF, new GridConstraints(3, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, new Dimension(65, -1), new Dimension(65, -1), new Dimension(65, -1), 0, false));
    ButtonGroup buttonGroup;
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
