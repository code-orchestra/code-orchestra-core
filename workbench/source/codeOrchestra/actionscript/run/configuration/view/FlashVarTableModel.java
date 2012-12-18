package codeOrchestra.actionscript.run.configuration.view;

import codeOrchestra.actionscript.run.configuration.FlashVar;
import jetbrains.mps.internal.collections.runtime.ListSequence;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class FlashVarTableModel extends AbstractTableModel {

  private static final int KEY_COLUMN_INDEX = 0;
  private static final int VALUE_COLUMN_INDEX = 1;

  private List<FlashVar> vars = new ArrayList<FlashVar>();
    
  public void setVars(List<FlashVar> vars) {
    this.vars = vars;
    fireTableDataChanged();
  }

  public Class<?> getColumnClass(int columnIndex) {
    switch (columnIndex) {
      case KEY_COLUMN_INDEX:
        return String.class;
      case VALUE_COLUMN_INDEX:
        return String.class;
      default:
        return null;
    }
  }

  public int getRowCount() {
    return vars.size();
  }

  public int getColumnCount() {
    return 2;
  }

  public Object getValueAt(int row, int column) {
    switch (column) {
      case KEY_COLUMN_INDEX:
        return ListSequence.fromList(vars).getElement(row).getKey();
      case VALUE_COLUMN_INDEX:
        return ListSequence.fromList(vars).getElement(row).getValue();
      default:
        return null;
    }
  }

  public void setValueAt(Object value, int row, int column) {
    switch (column) {
      case KEY_COLUMN_INDEX:
        ListSequence.fromList(vars).getElement(row).setKey((String) value);
        break;
      case VALUE_COLUMN_INDEX:
        ListSequence.fromList(vars).getElement(row).setValue((String) value);
        break;
      default:
    }
    fireTableCellUpdated(row, column);
  }

  public boolean isCellEditable(int row, int column) {
    return true;
  }

}
