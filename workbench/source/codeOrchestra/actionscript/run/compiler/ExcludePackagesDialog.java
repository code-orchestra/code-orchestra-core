package codeOrchestra.actionscript.run.compiler;

import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;
import jetbrains.mps.project.Solution;

import javax.swing.*;
import javax.swing.table.TableColumn;
import java.awt.Dialog;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ExcludePackagesDialog extends BaseDialog {

  private JComponent myComponent;
  private Solution solution;
  private List<String> excludedPackages;

  public ExcludePackagesDialog(Dialog dialog, Solution solution, List<String> excludedPackages) {
    super(dialog, "Excluded Packages");
    this.solution = solution;
    this.excludedPackages = excludedPackages;

    this.myComponent = createPanel();
    setSize(getDefaultDimensionSettings().getDimensions());
  }

  protected JComponent getMainComponent() {
    return this.myComponent;
  }

  @Override
  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    DialogDimensionsSettings.DialogDimensions dialogDimensions = super.getDefaultDimensionSettings();
    dialogDimensions.setWidth(300);
    dialogDimensions.setHeight(360);
    return dialogDimensions;
  }

  private JComponent createPanel() {
    JPanel panel = new JPanel();

    panel.setLayout(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();

    JTable packagesTable = new JTable();
    packagesTable.setCellSelectionEnabled(false);
    packagesTable.setRowSelectionAllowed(true);
    packagesTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    packagesTable.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
    packagesTable.setModel(new ExcludePackagesTableModel(excludedPackages, solution));

    for (int i = 0; i < packagesTable.getColumnModel().getColumnCount(); i++) {
      TableColumn tableColumn = packagesTable.getColumnModel().getColumn(i);
      if (i == ExcludePackagesTableModel.ICON_COLUMN_INDEX) {
        tableColumn.setPreferredWidth(25);
        tableColumn.setMaxWidth(25);
        continue;
      } else if (i == ExcludePackagesTableModel.INCLUDE_COLUMN_INDEX) {
        tableColumn.setPreferredWidth(60);
        tableColumn.setMaxWidth(60);
        continue;
      }
    }

    c.fill = GridBagConstraints.BOTH;
    c.anchor = GridBagConstraints.PAGE_START;
    c.gridx = 1;
    c.gridy = 1;
    c.weightx = 1;
    c.weighty = 1;
    panel.add(new JScrollPane(packagesTable), c);

    return panel;
  }

  @BaseDialog.Button(name = "OK", mnemonic = 'O', position = 0, defaultButton = true)
  public void onOk() {
    this.dispose();
  }

}
