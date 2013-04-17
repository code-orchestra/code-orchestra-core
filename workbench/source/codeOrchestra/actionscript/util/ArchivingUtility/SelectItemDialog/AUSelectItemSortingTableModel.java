/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package codeOrchestra.actionscript.util.ArchivingUtility.SelectItemDialog;

import jetbrains.mps.util.Pair;

import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;
import java.awt.Component;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;


abstract class AUSelectItemSortingTableModel extends AUSelectItemTableModel {

  private static final int NONE = 0;

  private static final int ASC = 1;

  private static final int DESC = 2;
  private int mySortedColumn = -1;
  private int mySortingOrder = NONE;
  private int[] myViewToModelMap;

  public AUSelectItemSortingTableModel(String[] columns, int itemNum) {
    super(columns, itemNum);
  }

  @Override
  public boolean isCellEditable(int row, int column) {
    return super.isCellEditable(convertRowIndexToModel(row), column);
  }
  @Override
  public Class<?> getColumnClass(int column) {
    return super.getColumnClass(column);
  }
  @Override
  public Object getValueAt(int row, int column) {
    return super.getValueAt(convertRowIndexToModel(row), column);
  }
  @Override
  public void setValueAt(Object aValue, int row, int column) {
    super.setValueAt(aValue, convertRowIndexToModel(row), column);
    fireTableCellUpdated(row, column);
  }
  public boolean isChecked(int row) {
    return (Boolean) getValueAt(row, 0);
  }
  public void setChecked(int row) {
    setValueAt(true, row, 0);
  }
  public int convertRowIndexToModel(int viewIndex) {
    if (mySortingOrder == NONE) { return viewIndex; }
    return myViewToModelMap[viewIndex];
  }
  public int convertRowIndexToView(int modelIndex) {
    if (mySortingOrder == NONE) { return modelIndex; }
    for (int i = 0; i < myViewToModelMap.length; i++) {
      if (myViewToModelMap[i] == modelIndex) { return i; }
    }
    return -1;
  }
  public void install(final JTable table) {
    TableColumnModel columnModel = table.getColumnModel();
    for (int i = 0; i < columnModel.getColumnCount(); i++) {
      columnModel.getColumn(i).setHeaderRenderer(new TableCellRenderer() {
        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
          Component c = table.getTableHeader().getDefaultRenderer().getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
          column = table.convertColumnIndexToModel(column);
          if (mySortedColumn == column) {
            if (mySortingOrder == AUSelectItemSortingTableModel.ASC) {
              ((JLabel) c).setIcon(new AUSelectItemDownIcon(7));
            } else if (mySortingOrder == AUSelectItemSortingTableModel.DESC) {
              ((JLabel) c).setIcon(new AUSelectItemUpIcon(8));
            } else ((JLabel) c).setIcon(null);
          } else {
            ((JLabel) c).setIcon(null);
          }
          return c;
        }
      });
    }
    final JTableHeader header = table.getTableHeader();
    header.addMouseListener(new MouseAdapter() {
      @Override
      public void mouseClicked(MouseEvent e) {
        int col = header.columnAtPoint(e.getPoint());
        col = header.getTable().convertColumnIndexToModel(col);
        if (col == 0) { return; }
        int sortingOrder = AUSelectItemSortingTableModel.ASC;
        if (mySortedColumn == col) {
          if (mySortingOrder == AUSelectItemSortingTableModel.NONE) {
            sortingOrder = AUSelectItemSortingTableModel.ASC;
          }
          if (mySortingOrder == AUSelectItemSortingTableModel.ASC) {
            sortingOrder = AUSelectItemSortingTableModel.DESC;
          }
          if (mySortingOrder == AUSelectItemSortingTableModel.DESC) {
            sortingOrder = AUSelectItemSortingTableModel.NONE;
          }
        } else {
          if (mySortingOrder == AUSelectItemSortingTableModel.NONE) {
            sortingOrder = AUSelectItemSortingTableModel.ASC;
          } else sortingOrder = mySortingOrder;
        }
        int[] selectedRows = table.getSelectedRows();
        for (int i = 0; i < selectedRows.length; i++) {
          selectedRows[i] = convertRowIndexToModel(selectedRows[i]);
        }
        AUSelectItemSortingTableModel.this.sort(col, sortingOrder);
        for (int selectedRow : selectedRows) {
          selectedRow = convertRowIndexToView(selectedRow);
          table.addRowSelectionInterval(selectedRow, selectedRow);
        }
      }
    });
  }
  private void sort(final int column, int order) {
    mySortingOrder = order;
    mySortedColumn = column;
    if (order == NONE) {
    } else {
      ArrayList<Pair<Integer, String>> values = new ArrayList<Pair<Integer, String>>();
      for (int i = 0; i < getRowCount(); i++) {
        values.add(new Pair<Integer, String>(i, String.valueOf(super.getValueAt(i, column))));
      }
      ArrayList<Pair<Integer, String>> valuesSorted = new ArrayList<Pair<Integer, String>>(values);
      Collections.sort(valuesSorted, new Comparator<Pair<Integer, String>>() {
        @Override
        public int compare(Pair<Integer, String> o1, Pair<Integer, String> o2) {
          return o1.o2.compareTo(o2.o2);
        }
      });
      if (order == DESC) {
        Collections.reverse(valuesSorted);
      }
      myViewToModelMap = new int[values.size()];
      for (int i = 0; i < values.size(); i++) {
        myViewToModelMap[i] = values.indexOf(valuesSorted.get(i));
      }
    }
    fireTableDataChanged();
  }
}