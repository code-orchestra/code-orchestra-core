package codeOrchestra.actionscript.run.configuration.view;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.project.ProjectManager;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.run.configuration.ASRunConfiguration;
import codeOrchestra.actionscript.run.configuration.FlashVar;
import codeOrchestra.actionscript.run.configuration.KnownFlashVars;
import codeOrchestra.actionscript.run.configuration.LauncherType;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.fileChooser.FileChooserDescriptor;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.TextFieldWithBrowseButton;
import com.intellij.uiDesigner.core.GridConstraints;
import com.intellij.uiDesigner.core.GridLayoutManager;
import com.intellij.uiDesigner.core.Spacer;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.ProjectAndModuleHolder;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.dialogs.project.components.parts.actions.TableAddAction;
import jetbrains.mps.workbench.dialogs.project.components.parts.actions.TableRemoveAction;

import javax.swing.*;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASRunConfigurationComponent extends JPanel {

  private static final int MINIMUM_TABLE_COLUMN_WIDTH = 50;

  private static final Logger LOG = Logger.getLogger(ASRunConfiguration.class);

  private JComboBox moduleChooser;
  private JRadioButton myModuleOutputFileRadioButton;
  private JRadioButton myHTMLWrapperOrSWFRadioButton;
  private JCheckBox myMakeCheckBox;
  private JPanel contentPane;
  private TextFieldWithBrowseButton fileChooser;
  private JPanel flashVarsPanel;
  private JCheckBox showTracesCheckBox;
  private JPanel flashVarsBorderPanel;
  private JRadioButton mySystemDefaultApplicationRadioButton;
  private JRadioButton myFlashPlayerRadioButton;
  private TextFieldWithBrowseButton flashPlayerChooser;
  private String swfFile;
  private MPSProject mpsProject;
  private JTable flashVarsTable;
  private FlashVarTableModel flashVarTableModel;
  private List<FlashVar> flashVars;

  private int initialVarsHash;

  private void updateSaveTracesCheckboxStatus() {
    Object moduleObj = moduleChooser.getSelectedItem();

    if (moduleObj != null) {
      String moduleName = moduleObj.toString();
      if (moduleName != null) {

        // Disable the CB if the target module doesn't import the logging language
        for (Solution solution : mpsProject.getProjectSolutions()) {
          if (moduleName.equals(solution.getModuleDescriptor().getNamespace())) {
            for (ModuleReference importedLanguage : solution.getModuleDescriptor().getUsedLanguages()) {
              if (Languages.ACTION_SCRIPT_LOGGING.equals(importedLanguage.getModuleFqName())) {
                showTracesCheckBox.setEnabled(true);
                return;
              }
            }
          }
        }
      }
    }

    showTracesCheckBox.setEnabled(false);
    showTracesCheckBox.setSelected(false);
  }

  public ASRunConfigurationComponent() {
    this.mpsProject = ProjectAndModuleHolder.getInstance().getProject().getComponent(MPSProject.class);
    this.flashVarsPanel = createFlashVarsPanel();

    $$$setupUI$$$();

    // TODO: make visible
    flashVarsBorderPanel.setVisible(false);
  }

  private JPanel createFlashVarsPanel() {
    JPanel result = new JPanel(new BorderLayout());

    flashVarTableModel = new FlashVarTableModel();
    flashVarsTable = new JTable(flashVarTableModel);
    flashVarsTable.setShowGrid(false);
    flashVarsTable.setCellSelectionEnabled(false);
    flashVarsTable.setRowSelectionAllowed(true);
    flashVarsTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    flashVarsTable.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
    flashVarsTable.setTableHeader(null);

    fitTableColumns(flashVarsTable);
    flashVarTableModel.addTableModelListener(new TableModelListener() {
      public void tableChanged(TableModelEvent event) {
        fitTableColumns(flashVarsTable);
      }
    });

    result.add(createToolbar(), BorderLayout.WEST);

    JScrollPane comp = new JScrollPane(flashVarsTable);
    comp.doLayout();
    result.add(comp, BorderLayout.CENTER);

    return result;
  }

  private JComponent createToolbar() {
    TableAddAction addAction = new TableAddAction(flashVarsTable) {
      protected int doAdd(AnActionEvent e) {
        FlashVar flashVar = new FlashVar("key", "value");
        flashVars.add(flashVar);

        flashVarTableModel.fireTableDataChanged();

        return flashVars.indexOf(flashVar);
      }
    };

    TableRemoveAction removeAction = new TableRemoveAction(flashVarsTable) {
      protected void doRemove(AnActionEvent e) {
        for (int i : flashVarsTable.getSelectedRows()) {
          flashVars.remove(i);
        }

        flashVarTableModel.fireTableDataChanged();
      }
    };

    DefaultActionGroup group = ActionUtils.groupFromActions(addAction, removeAction);
    ActionToolbar toolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false);
    return toolbar.getComponent();
  }

  // Listeners
  private ActionListener moduleChooserListener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      final String solutionName = moduleChooser.getSelectedItem().toString();
      updateSwfFile(solutionName);
      updateSaveTracesCheckboxStatus();
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
  private ActionListener mySystemDefaultApplicationRadioButtonListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      flashPlayerChooser.setEnabled(false);
    }
  };
  private ActionListener myFlashPlayerRadioButtonListener = new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
      flashPlayerChooser.setEnabled(true);
    }
  };

  public void updateSwfFile(final String solutionName) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        Solution solution = MPSModuleRepository.getInstance().getSolution(solutionName);
        if (solution != null) {
          ASRunConfigurationComponent.this.swfFile = SolutionUtils.getSWFOutputPath(solution);
        }
      }
    });
  }

  public void reset(final ASRunConfiguration runConfiguration) {
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

    showTracesCheckBox.setSelected(true);

    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      updateSwfFile(selectedModuleName);
    }
    updateSaveTracesCheckboxStatus();

    moduleChooser.addActionListener(moduleChooserListener);

    // Target

    myModuleOutputFileRadioButton.setSelected(!runConfiguration.isUseCustomFile());
    myHTMLWrapperOrSWFRadioButton.setSelected(runConfiguration.isUseCustomFile());
    fileChooser.setEnabled(runConfiguration.isUseCustomFile());
    fileChooser.setText(runConfiguration.getCustomFile());

    myMakeCheckBox.setSelected(runConfiguration.isMake());

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
    mySystemDefaultApplicationRadioButton.addActionListener(mySystemDefaultApplicationRadioButtonListener);
    myFlashPlayerRadioButton.addActionListener(myFlashPlayerRadioButtonListener);
    flashPlayerChooser.setEnabled(myFlashPlayerRadioButton.isSelected());
    flashPlayerChooser.setText(runConfiguration.getFlashPlayerPath());
    flashPlayerChooser.getTextField().setEditable(false);
    flashPlayerChooser.addBrowseFolderListener("Flash Player", "Select Flash Player path",
      ApplicationManager.getApplication().getComponent(Project.class),
      new FileChooserDescriptor(true, true, false, false, false, false));

    flashVars = new ArrayList<FlashVar>();
    for (FlashVar flashVar : runConfiguration.getFlashVars()) {
      flashVars.add(flashVar);
    }
    flashVarTableModel.setVars(flashVars);
    initialVarsHash = getVarsHash(flashVars);

    Iterator<FlashVar> varsIterator = flashVars.iterator();
    while (varsIterator.hasNext()) {
      FlashVar var = varsIterator.next();
      if (KnownFlashVars.SHOW_TRACES.equals(var.getKey())) {
        showTracesCheckBox.setSelected(Boolean.parseBoolean(var.getValue()));
      }
      break;
    }

    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        // RE-1725
        // This hack is needed to fire an event to UserActivityWatcher, which will allow
        // to save the data even if it wasn't alternated by a user

        boolean wasSelected = myMakeCheckBox.isSelected();
        myMakeCheckBox.setSelected(!wasSelected);
        myMakeCheckBox.setSelected(wasSelected);
      }
    });
  }

  public void apply(final ASRunConfiguration runConfiguration) {
    String selectedModuleName = (String) moduleChooser.getSelectedItem();
    if (selectedModuleName != null) {
      runConfiguration.setModuleName(selectedModuleName);
    }

    runConfiguration.setCustomFile(fileChooser.getText());
    runConfiguration.setMake(myMakeCheckBox.isSelected());
    runConfiguration.setSwfFile(swfFile);
    runConfiguration.setUseCustomFile(myHTMLWrapperOrSWFRadioButton.isSelected());

    runConfiguration.setLauncherType(mySystemDefaultApplicationRadioButton.isSelected() ? LauncherType.DEFAULT : LauncherType.FLASH_PLAYER);
    runConfiguration.setFlashPlayerPath(flashPlayerChooser.getText());

    runConfiguration.setMpsProject(mpsProject);

    // Show traces
    Iterator<FlashVar> varsIterator = flashVars.iterator();
    while (varsIterator.hasNext()) {
      FlashVar var = varsIterator.next();
      if (KnownFlashVars.SHOW_TRACES.equals(var.getKey())) {
        varsIterator.remove();
      }
    }
    if (showTracesCheckBox.isEnabled() && showTracesCheckBox.isSelected()) {
      flashVars.add(new FlashVar(KnownFlashVars.SHOW_TRACES, Boolean.TRUE.toString()));
    } else {
      flashVars.add(new FlashVar(KnownFlashVars.SHOW_TRACES, Boolean.FALSE.toString()));
    }

    // Flash vars
    if (initialVarsHash != getVarsHash(flashVars)) {
      for (Solution solution : mpsProject.getProjectSolutions()) {
        if (runConfiguration.getModuleName().equals(solution.getModuleDescriptor().getNamespace())) {
          solution.markForRegeneration();
          break;
        }
      }
    }
    runConfiguration.setFlashVars(flashVars);
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

  private int getVarsHash(List<FlashVar> vars) {
    StringBuilder sb = new StringBuilder();
    for (FlashVar var : vars) {
      sb.append("#").append(var.toString());
    }
    return sb.toString().hashCode();
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
    final JPanel panel5 = new JPanel();
    panel5.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel5, new GridConstraints(3, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel5.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Before launch"));
    final JPanel panel6 = new JPanel();
    panel6.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel5.add(panel6, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    myMakeCheckBox = new JCheckBox();
    myMakeCheckBox.setText("Make");
    panel6.add(myMakeCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer1 = new Spacer();
    panel6.add(spacer1, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    final Spacer spacer2 = new Spacer();
    contentPane.add(spacer2, new GridConstraints(6, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_VERTICAL, 1, GridConstraints.SIZEPOLICY_WANT_GROW, null, null, null, 0, false));
    final JPanel panel7 = new JPanel();
    panel7.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel7, new GridConstraints(4, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    panel7.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Logging"));
    showTracesCheckBox = new JCheckBox();
    showTracesCheckBox.setText("Show traces");
    panel7.add(showTracesCheckBox, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer3 = new Spacer();
    panel7.add(spacer3, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    flashVarsBorderPanel = new JPanel();
    flashVarsBorderPanel.setLayout(new GridLayoutManager(1, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(flashVarsBorderPanel, new GridConstraints(5, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    flashVarsBorderPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Flash Variables"));
    flashVarsBorderPanel.add(flashVarsPanel, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, null, null, 0, false));
    final JPanel panel8 = new JPanel();
    panel8.setLayout(new GridLayoutManager(2, 1, new Insets(0, 0, 0, 0), -1, -1));
    contentPane.add(panel8, new GridConstraints(2, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    panel8.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Launcher"));
    final JPanel panel9 = new JPanel();
    panel9.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel8.add(panel9, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    mySystemDefaultApplicationRadioButton = new JRadioButton();
    mySystemDefaultApplicationRadioButton.setText("System default application");
    panel9.add(mySystemDefaultApplicationRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    final Spacer spacer4 = new Spacer();
    panel9.add(spacer4, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_HORIZONTAL, GridConstraints.SIZEPOLICY_WANT_GROW, 1, null, null, null, 0, false));
    final JPanel panel10 = new JPanel();
    panel10.setLayout(new GridLayoutManager(1, 2, new Insets(0, 0, 0, 0), -1, -1));
    panel8.add(panel10, new GridConstraints(1, 0, 1, 1, GridConstraints.ANCHOR_CENTER, GridConstraints.FILL_BOTH, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    myFlashPlayerRadioButton = new JRadioButton();
    myFlashPlayerRadioButton.setText("Flash Player");
    panel10.add(myFlashPlayerRadioButton, new GridConstraints(0, 0, 1, 1, GridConstraints.ANCHOR_WEST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_FIXED, null, null, null, 0, false));
    flashPlayerChooser = new TextFieldWithBrowseButton();
    panel10.add(flashPlayerChooser, new GridConstraints(0, 1, 1, 1, GridConstraints.ANCHOR_EAST, GridConstraints.FILL_NONE, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, GridConstraints.SIZEPOLICY_CAN_SHRINK | GridConstraints.SIZEPOLICY_CAN_GROW, null, new Dimension(300, -1), new Dimension(300, -1), 0, false));
    ButtonGroup buttonGroup;
    buttonGroup = new ButtonGroup();
    buttonGroup.add(myModuleOutputFileRadioButton);
    buttonGroup.add(myHTMLWrapperOrSWFRadioButton);
    buttonGroup = new ButtonGroup();
    buttonGroup.add(mySystemDefaultApplicationRadioButton);
    buttonGroup.add(myFlashPlayerRadioButton);
  }

  /**
   * @noinspection ALL
   */
  public JComponent $$$getRootComponent$$$() {
    return contentPane;
  }
}
