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
package codeOrchestra.environment.view;

import com.intellij.openapi.diagnostic.Logger;
import com.intellij.util.ui.Table;
import codeOrchestra.environment.Environment;
import codeOrchestra.environment.EnvironmentLibrary;
import jetbrains.mps.util.Triplet;

import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import java.awt.Component;
import java.util.*;

/**
 *  @author Alexander Eliseyev
 */
public class EnvironmentLibraryTable extends Table {

  private static final Logger LOG = Logger.getInstance(EnvironmentLibraryTable.class.getName());

  private final MyTableModel myTableModel = new MyTableModel();
  private EnvironmentLibraryManager configuration;

  private static final int LIBRARY_COLUMN = 0;
  private static final int IMPLEMENTATION_COLUMN = 1;
  private static final int ENVIRONMENT_COLUMN = 2;

  private final List<Triplet<String, String, Environment>> myLibs = new ArrayList<Triplet<String, String, Environment>>();

  private static final Comparator<Triplet<String, String, Environment>> LIBRARIES_COMPARATOR = new Comparator<Triplet<String, String, Environment>>() {
    public int compare(Triplet<String, String, Environment> triple1, Triplet<String, String, Environment> triple2) {
      return triple1.first().compareTo(triple2.first());
    }
  };

  private final Collection<String> myUndefinedURIs;

  public EnvironmentLibraryTable(EnvironmentLibraryManager configuration) {
    this(null, configuration);
  }

  public EnvironmentLibraryTable(final Collection<String> undefinedURIs, EnvironmentLibraryManager configuration) {
    this.configuration = configuration;
    myUndefinedURIs = undefinedURIs;
    setModel(myTableModel);
    TableColumn column = getColumnModel().getColumn(LIBRARY_COLUMN);
    column.setCellRenderer(new DefaultTableCellRenderer() {
      public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        final Component component = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        component.setForeground(isSelected ? table.getSelectionForeground() : table.getForeground());
        return component;
      }
    });
    setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
    //obtainData();
  }

  public void addLibrary() {
    final String title = "Add an Environment-Specific Library Implementation";
    final EnvironmentLibraryEditor libraryEditor = new EnvironmentLibraryEditor(title, "", "", Environment.HTML5);
    libraryEditor.show();

    if (libraryEditor.isOK()) {
      final String libraryName = libraryEditor.getLibraryName();
      myLibs.add(new Triplet<String, String, Environment>(libraryName, libraryEditor.getImplementationName(), libraryEditor.getEnvironment()));
      final int index = indexOfLibraryWithName(libraryName);
      LOG.assertTrue(index >= 0);
      myTableModel.fireTableDataChanged();
      setRowSelectionInterval(index, index);
    }
  }

  private boolean isValidRow(int selectedRow) {
    return selectedRow >= 0 && selectedRow < myLibs.size();
  }

  public void removeSelectedLibs() {
    final int[] selectedRows = getSelectedRows();
    if(selectedRows.length == 0) return;
    Arrays.sort(selectedRows);
    final int originalRow = selectedRows[0];
    for (int i = selectedRows.length - 1; i >= 0; i--) {
      final int selectedRow = selectedRows[i];
      if (isValidRow(selectedRow)) {
        myLibs.remove(selectedRow);
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
    configuration.clearAll();

    for (Triplet<String, String, Environment> triplet : myLibs) {
      // TODO: validate if (value != null && value.trim().length() > 0))
      if (true) {
        //myPathURIs.setURI(pair.getFirst(), value.replace(File.separatorChar, '/'));
        configuration.addEnvironmentLibrary(new EnvironmentLibrary(triplet.first(), triplet.second(), triplet.third()));
      }
    }
  }

  public void reset() {
    obtainData();
  }

  private boolean hasLibraryWithName(String name) {
    for (Triplet<String, String, Environment> uri : myLibs) {
      if (name.equals(uri.first())) {
        return true;
      }
    }
    return false;
  }

  private int indexOfLibraryWithName(String name) {
    for (int i = 0; i < myLibs.size(); i++) {
      final Triplet<String, String, Environment> triplet = myLibs.get(i);
      if (name.equals(triplet.first())) {
        return i;
      }
    }
    return -1;
  }

  private void obtainData() {
    obtainLibraryTriples(myLibs);
    myTableModel.fireTableDataChanged();
  }

  private void obtainLibraryTriples(final List<Triplet<String, String, Environment>> libs) {
    libs.clear();

    for (EnvironmentLibrary environmentLibrary : configuration.getAllSettings()) {
      libs.add(environmentLibrary.toTriple());
    }

    /* ???
    if (myUndefinedURIs != null) {
      for (String undefinedURIName : myUndefinedURIs) {
        libs.add(new Pair<String, String>(undefinedURIName, ""));
      }
    }
    */
    Collections.sort(libs, LIBRARIES_COMPARATOR);
  }

  public void editURI() {
    if (getSelectedRowCount() != 1) {
      return;
    }
    final int selectedRow = getSelectedRow();
    final Triplet<String, String, Environment> triplet = myLibs.get(selectedRow);
    final String title = "Edit Environment-Specific Library Implementation";

    final String libraryName = triplet.first();
    final String implementationName = triplet.second();
    final Environment environment = triplet.third();

    final EnvironmentLibraryEditor uriEditor = new EnvironmentLibraryEditor(title, libraryName, implementationName, environment);
    uriEditor.show();

    if (uriEditor.isOK()) {
      myLibs.remove(selectedRow);
      myLibs.add(new Triplet<String, String, Environment>(uriEditor.getLibraryName(), uriEditor.getImplementationName(), uriEditor.getEnvironment()));

      Collections.sort(myLibs, LIBRARIES_COMPARATOR);
      myTableModel.fireTableDataChanged();
    }
  }

  public boolean isModified() {
    final List<Triplet<String, String, Environment>> uris = new ArrayList<Triplet<String, String, Environment>>();
    obtainLibraryTriples(uris);
    return !uris.equals(myLibs);
  }

  private class MyTableModel extends AbstractTableModel{
    public int getColumnCount() {
      return 3;
    }

    public int getRowCount() {
      return myLibs.size();
    }

    public Class getColumnClass(int columnIndex) {
      return String.class;
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
      final Triplet<String, String, Environment> pair = myLibs.get(rowIndex);
      switch (columnIndex) {
        case LIBRARY_COLUMN: return pair.first();
        case IMPLEMENTATION_COLUMN: return pair.second();
        case ENVIRONMENT_COLUMN: return pair.third().getDisplayName();
      }
      LOG.error("Wrong indices");
      return null;
    }

    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
    }

    public String getColumnName(int columnIndex) {
      switch (columnIndex) {
        case LIBRARY_COLUMN: return "Library";
        case IMPLEMENTATION_COLUMN: return "Environment-Specific Implementation";
        case ENVIRONMENT_COLUMN: return "Environment";
      }
      return null;
    }

    public boolean isCellEditable(int rowIndex, int columnIndex) {
      return false;
    }
  }


}
