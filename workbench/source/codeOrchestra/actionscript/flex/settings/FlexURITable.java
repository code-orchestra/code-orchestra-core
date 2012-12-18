/*
 * Copyright 2000-2009 JetBrains s.r.o.
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
package codeOrchestra.actionscript.flex.settings;

import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.util.Pair;
import com.intellij.util.ui.Table;

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.util.*;
import java.util.List;

/**
 *  @author Alexander Eliseyev
 */
public class FlexURITable extends Table {
  private static final Logger LOG = Logger.getInstance("#codeOrchestra.actionscript.flex.settings.PathMacroTable");

  private final MyTableModel myTableModel = new MyTableModel();
  private FlexURIs flexURIs;
  private static final int NAME_COLUMN = 0;
  private static final int VALUE_COLUMN = 1;

  private final List<Pair<String, String>> myUris = new ArrayList<Pair<String, String>>();
  private static final Comparator<Pair<String, String>> MACRO_COMPARATOR = new Comparator<Pair<String, String>>() {
    public int compare(Pair<String, String> pair, Pair<String, String> pair1) {
      return pair.getFirst().compareTo(pair1.getFirst());
    }
  };

  private final Collection<String> myUndefinedURIs;

  public FlexURITable(FlexURIs flexURIs) {
    this(null, flexURIs);
  }

  public FlexURITable(final Collection<String> undefinedURIs, FlexURIs flexURIs) {
    this.flexURIs = flexURIs;
    myUndefinedURIs = undefinedURIs;
    setModel(myTableModel);
    TableColumn column = getColumnModel().getColumn(NAME_COLUMN);
    column.setCellRenderer(new DefaultTableCellRenderer() {
      public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        final Component component = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        final String uriValue = getURIValueAt(row);
        component.setForeground(uriValue.length() == 0
                                ? Color.RED
                                : isSelected ? table.getSelectionForeground() : table.getForeground());
        return component;
      }
    });
    setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
    //obtainData();
  }

  public String getURIValueAt(int row) {
    return (String) getValueAt(row, VALUE_COLUMN);
  }

  public String getURINameAt(int row) {
    return (String)getValueAt(row, NAME_COLUMN);
  }

  public void addURI() {
    final String title = "Add an URI";
    final FlexURIEditor uriEditor = new FlexURIEditor(title, "", "");
    uriEditor.show();
    if (uriEditor.isOK()) {
      final String name = uriEditor.getName();
      myUris.add(new Pair<String, String>(name, uriEditor.getValue()));
      Collections.sort(myUris, MACRO_COMPARATOR);
      final int index = indexOfURIWithName(name);
      LOG.assertTrue(index >= 0);
      myTableModel.fireTableDataChanged();
      setRowSelectionInterval(index, index);
    }
  }

  private boolean isValidRow(int selectedRow) {
    return selectedRow >= 0 && selectedRow < myUris.size();
  }

  public void removeSelectedURIs() {
    final int[] selectedRows = getSelectedRows();
    if(selectedRows.length == 0) return;
    Arrays.sort(selectedRows);
    final int originalRow = selectedRows[0];
    for (int i = selectedRows.length - 1; i >= 0; i--) {
      final int selectedRow = selectedRows[i];
      if (isValidRow(selectedRow)) {
        myUris.remove(selectedRow);
      }
    }
    myTableModel.fireTableDataChanged();
    if (originalRow < getRowCount()) {
      setRowSelectionInterval(originalRow, originalRow);
    } else if (getRowCount() > 0) {
      final int index = getRowCount() - 1;
      setRowSelectionInterval(index, index);
    }
  }

  public void commit() {
    flexURIs.clearAllURIs();

    for (Pair<String, String> pair : myUris) {
      final String value = pair.getSecond();
      if (value != null && value.trim().length() > 0) {
        //myPathURIs.setURI(pair.getFirst(), value.replace(File.separatorChar, '/'));
        flexURIs.addURI(pair.getFirst(), value);
      }
    }
  }

  public void reset() {
    obtainData();
  }

  private boolean hasURIWithName(String name) {
    for (Pair<String, String> uri : myUris) {
      if (name.equals(uri.getFirst())) {
        return true;
      }
    }
    return false;
  }

  private int indexOfURIWithName(String name) {
    for (int i = 0; i < myUris.size(); i++) {
      final Pair<String, String> pair = myUris.get(i);
      if (name.equals(pair.getFirst())) {
        return i;
      }
    }
    return -1;
  }

  private void obtainData() {
    obtainURIPairs(myUris);
    myTableModel.fireTableDataChanged();
  }

  private void obtainURIPairs(final List<Pair<String, String>> uris) {
    uris.clear();
    final Set<String> availableURIs = flexURIs.getURIs();
    for (String name : availableURIs) {
      //availableURIs.add(Pair.create(name, myPathURIs.getValue(name).replace('/', File.separatorChar)));
      uris.add(Pair.create(name, flexURIs.getFilePathByURI(name)));
    }

    if (myUndefinedURIs != null) {
      for (String undefinedURIName : myUndefinedURIs) {
        uris.add(new Pair<String, String>(undefinedURIName, ""));
      }
    }
    Collections.sort(uris, MACRO_COMPARATOR);
  }

  public void editURI() {
    if (getSelectedRowCount() != 1) {
      return;
    }
    final int selectedRow = getSelectedRow();
    final Pair<String, String> pair = myUris.get(selectedRow);
    final String title = "Edit URI";
    final String uriName = pair.getFirst();
    final FlexURIEditor uriEditor = new FlexURIEditor(title, uriName, pair.getSecond());
    uriEditor.show();
    if (uriEditor.isOK()) {
      myUris.remove(selectedRow);
      myUris.add(Pair.create(uriEditor.getName(), uriEditor.getValue()));
      Collections.sort(myUris, MACRO_COMPARATOR);
      myTableModel.fireTableDataChanged();
    }
  }

  public boolean isModified() {
    final ArrayList<Pair<String, String>> uris = new ArrayList<Pair<String, String>>();
    obtainURIPairs(uris);
    return !uris.equals(myUris);
  }

  private class MyTableModel extends AbstractTableModel{
    public int getColumnCount() {
      return 2;
    }

    public int getRowCount() {
      return myUris.size();
    }

    public Class getColumnClass(int columnIndex) {
      return String.class;
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
      final Pair<String, String> pair = myUris.get(rowIndex);
      switch (columnIndex) {
        case NAME_COLUMN: return pair.getFirst();
        case VALUE_COLUMN: return pair.getSecond();
      }
      LOG.error("Wrong indices");
      return null;
    }

    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
    }

    public String getColumnName(int columnIndex) {
      switch (columnIndex) {
        case NAME_COLUMN: return "URI";
        case VALUE_COLUMN: return "Manifest File";
      }
      return null;
    }

    public boolean isCellEditable(int rowIndex, int columnIndex) {
      return false;
    }
  }


}
