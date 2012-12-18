package codeOrchestra.actionscript.jsRunConfiguration;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.actionscript.jsRunConfiguration.JSRunConfiguration.MyBrowser;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.ProjectAndModuleHolder;

import javax.swing.*;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Anton.I.Neverov
 */
public class JSRunConfigurationComponent extends JPanel {

  private JPanel contentPane;
  private JComboBox moduleChooser;
  private JRadioButton myDefaultBrowserRadioButton;
  private JRadioButton myGoogleChromeRadioButton;
  private TextFieldWithBrowseButton chromeBinaryChooser;

  private MPSProject mpsProject;

  public JSRunConfigurationComponent() {
    this.mpsProject = ProjectAndModuleHolder.getInstance().getProject().getComponent(MPSProject.class);

    $$$setupUI$$$();
  }

  private ActionListener moduleChooserListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      final String solutionName = moduleChooser.getSelectedItem().toString();
      // TODO: do something?
    }
  };
  private ActionListener myDefaultBrowserRadioButtonListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      chromeBinaryChooser.setEnabled(false);
    }
  };
  private ActionListener myGoogleChromeRadioButtonListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      chromeBinaryChooser.setEnabled(true);
    }
  };

  private void createUIComponents() {
    contentPane = new JPanel();
    add(contentPane);
  }

  public void reset(final JSRunConfiguration runConfiguration) {
    // Init moduleChooser

    // RE-1647
    ModuleReference moduleReference = ProjectAndModuleHolder.getInstance().getModuleReference();
    final String moduleName = moduleReference == null ? null : moduleReference.getModuleFqName();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        int i = 0;

        boolean selectionSet = false;

        for (Solution solution : mpsProject.getProjectSolutions()) {
          if (SolutionUtils.isActionScriptDependent(solution) && !SolutionUtils.isSWCSolution(solution) && !SolutionUtils.isLiveCodingSolution(solution, ProjectHolder.getProject())) {
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

    moduleChooser.addActionListener(moduleChooserListener);

    myDefaultBrowserRadioButton.setSelected(runConfiguration.getBrowser() == MyBrowser.DEFAULT);
    myGoogleChromeRadioButton.setSelected(runConfiguration.getBrowser() == MyBrowser.CHROME);

    chromeBinaryChooser.setEnabled(runConfiguration.getBrowser() == MyBrowser.CHROME);
    chromeBinaryChooser.setText(runConfiguration.getChromePath());

    myDefaultBrowserRadioButton.addActionListener(myDefaultBrowserRadioButtonListener);
    myGoogleChromeRadioButton.addActionListener(myGoogleChromeRadioButtonListener);

    chromeBinaryChooser.getTextField().setEditable(false);
    chromeBinaryChooser.addBrowseFolderListener("Path to chrome launcher", "Choose chrome launcher",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(true, false, false, false, false, false));

  }

  public void apply(final JSRunConfiguration runConfiguration) {
    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      runConfiguration.setModuleName(selectedModuleName);
    }

    runConfiguration.setChromePath(chromeBinaryChooser.getText());

    if (myDefaultBrowserRadioButton.isSelected()) {
      runConfiguration.setBrowser(MyBrowser.DEFAULT);
    } else {
      runConfiguration.setBrowser(MyBrowser.CHROME);
    }

    runConfiguration.setMpsProject(mpsProject);

  }

  public void dispose() {
    myDefaultBrowserRadioButton.removeActionListener(myDefaultBrowserRadioButtonListener);
    myGoogleChromeRadioButton.removeActionListener(myGoogleChromeRadioButtonListener);
    moduleChooser.removeActionListener(moduleChooserListener);
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
    contentPane.setLayout(new GridLayoutManager(3, 1, new Insets(0, 0, 0, 0), -1, -1));
    final JPanel panel1 = new JPanel();
    panel1.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JLabel label1 = new JLabel();
    label1.setFont(new Font(label1.getFont().getName(), Font.BOLD, label1.getFont().getSize()));
    label1.setText("Run configuration for module:");
    panel1.add(label1, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_FIXED, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(140, 16), null, 0, false));
    moduleChooser = new JComboBox();
    panel1.add(moduleChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, new Dimension(200, -1), new Dimension(200, -1), 0, false));
    final Spacer spacer1 = new Spacer();
    contentPane.add(spacer1, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    final JPanel panel2 = new JPanel();
    panel2.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel2, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel2.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Launch"));
    final JPanel panel3 = new JPanel();
    panel3.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    panel2.add(panel3, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myDefaultBrowserRadioButton = new JRadioButton();
    myDefaultBrowserRadioButton.setText("Default browser");
    panel3.add(myDefaultBrowserRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final JPanel panel4 = new JPanel();
    panel4.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel2.add(panel4, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myGoogleChromeRadioButton = new JRadioButton();
    myGoogleChromeRadioButton.setText("Google Chrome");
    panel4.add(myGoogleChromeRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    chromeBinaryChooser = new TextFieldWithBrowseButton();
    panel4.add(chromeBinaryChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, new Dimension(300, -1), new Dimension(300, -1), 0, false));
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myDefaultBrowserRadioButton);
    buttonGroup.add(myGoogleChromeRadioButton);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return contentPane;
  }
}
