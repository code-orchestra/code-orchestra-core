package jetbrains.mps.workbench.dialogs.project.components.parts.renderers;

/*Generated by MPS */

import javax.swing.table.DefaultTableCellRenderer;
import java.awt.Component;
import javax.swing.JTable;
import jetbrains.mps.project.structure.modules.mappingpriorities.RuleType;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import javax.swing.border.EmptyBorder;

public class RuleTypeRenderer extends DefaultTableCellRenderer {
  public RuleTypeRenderer() {
  }

  @Override
  @CodeOrchestraPatch
  public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
    // CO-4941
    if (value == null) {
      return super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
    }

    String caption = ((RuleType) value).getPresentation();
    JComponent comp = (JComponent) super.getTableCellRendererComponent(table, caption, isSelected, hasFocus, row, column);
    return RuleTypeRenderer.createCenterAlignmentInCell(comp);
  }

  public static JComponent createCenterAlignmentInCell(JComponent comp) {
    JPanel compPanel = new JPanel(new GridBagLayout());
    GridBagConstraints constraints = new GridBagConstraints(1, 1, 1, 1, 1, 1, GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
    compPanel.add(comp, constraints);
    compPanel.setBackground(comp.getBackground());
    compPanel.setBorder(new EmptyBorder(2, 2, 2, 2));
    return compPanel;
  }
}
