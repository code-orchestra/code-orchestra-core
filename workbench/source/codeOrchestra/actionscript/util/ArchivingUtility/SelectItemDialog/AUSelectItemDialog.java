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

import com.intellij.ui.ScrollPaneFactory;
import com.intellij.ui.table.JBTable;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableColumnModel;
import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author olegchir
 */
abstract public class AUSelectItemDialog<T> extends JDialog {
    private ArrayList<T> items;
    private Set<String> selectedItemIds;
    private JTable table;
    private JButton checkButton;
    private JButton unCheckButton;
    private JButton runCheckedButton;
    private boolean runChecked;
    private boolean openSelected;
    private String runCheckedButtonCaption;

    public AUSelectItemDialog(Frame owner, String title, String runCheckedButtonCaption, List<T> items, Set<String> selectedItemIds) throws HeadlessException {
      super(owner, title, true);
      this.items = new ArrayList<T>();
      this.items.addAll(items);
      this.selectedItemIds = selectedItemIds;
      this.runCheckedButtonCaption = runCheckedButtonCaption;
      init();
      setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
      setSize(750, 600);
    }

  public void selectAll() {
    int count = table.getModel().getRowCount();
    AUSelectItemSortingTableModel model = (AUSelectItemSortingTableModel) table.getModel();
    for (int i = 0; i < count; i++) {
      model.setChecked(i);
    }
  }

    abstract public String[] createColumns();
    abstract public Object getValueAt(int row, int column);
    abstract public void setValueAt(Object aValue, int row, int column);

    private void init() {
      final AUSelectItemDialog that = this;

      JComponent contentPane = ((JComponent) getContentPane());
      contentPane.setLayout(new BorderLayout());
      contentPane.setBorder(BorderFactory.createEmptyBorder(4, 4, 4, 4));
      contentPane.registerKeyboardAction(new AbstractAction("Dispose dialog") {
        @Override
        public void actionPerformed(ActionEvent e) {
          setVisible(false);
        }
      }, KeyStroke.getKeyStroke("ESCAPE"), JComponent.WHEN_IN_FOCUSED_WINDOW);
      JPanel panel = new JPanel(new BorderLayout());
      contentPane.add(panel, BorderLayout.CENTER);

      AUSelectItemSortingTableModel tm = new AUSelectItemSortingTableModel(createColumns(),items.size()) {
        @Override
        public Object getValueAtOrig(int row, int column) {
          return that.getValueAt(row,column);
        }

        @Override
        public void setValueAtOrig(Object aValue, int row, int column) {
          that.setValueAt(aValue, row, column);
        }
      };

      table = new JBTable(tm);
      tm.install(table);
      TableColumnModel columnModel = table.getColumnModel();
      columnModel.getColumn(0).setMaxWidth(20);
      columnModel.getColumn(0).setResizable(false);
      columnModel.getColumn(1).setMinWidth(300);
      panel.add(ScrollPaneFactory.createScrollPane(table), BorderLayout.CENTER);
      JPanel buttonsFlow = new JPanel();
      checkButton = new JButton("Check");
      unCheckButton = new JButton("UnCheck");
      runCheckedButton = new JButton(runCheckedButtonCaption);
      JButton closeButton = new JButton("Close");
      buttonsFlow.add(checkButton);
      buttonsFlow.add(unCheckButton);
      buttonsFlow.add(runCheckedButton);
      buttonsFlow.add(closeButton);
      checkButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          int[] ints = table.getSelectedRows();
          for (int i : ints) {
            table.setValueAt(true, i, 0);
          }
        }
      });
      unCheckButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          int[] ints = table.getSelectedRows();
          for (int i : ints) {
            table.setValueAt(false, i, 0);
          }
        }
      });
      runCheckedButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          runChecked = true;
          AUSelectItemDialog.this.setVisible(false);
        }
      });
      closeButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
          AUSelectItemDialog.this.setVisible(false);
        }
      });
      JPanel buttons = new JPanel(new BorderLayout());
      buttons.setBorder(BorderFactory.createEmptyBorder(4, 0, 0, 0));
      buttons.add(buttonsFlow, BorderLayout.EAST);
      panel.add(buttons, BorderLayout.SOUTH);
      table.getModel().addTableModelListener(new TableModelListener() {
        @Override
        public void tableChanged(TableModelEvent e) {
          AUSelectItemDialog.this.updateButtons();
        }
      });
      table.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
        @Override
        public void valueChanged(ListSelectionEvent e) {
          AUSelectItemDialog.this.updateButtons();
        }
      });
      updateButtons();
    }
    private void updateButtons() {
      int[] ints = table.getSelectedRows();
      boolean enableCheck = false;
      boolean enableUnCheck = false;
      for (int i : ints) {
        if (!((Boolean) table.getModel().getValueAt(i, 0))) {
          enableCheck = true;
        } else {
          enableUnCheck = true;
        }
      }
      checkButton.setEnabled(enableCheck);
      unCheckButton.setEnabled(enableUnCheck);
      runCheckedButton.setEnabled(getCheckedItems().size() >= 1);
    }
    public ArrayList<T> getSelectedItems() {
      ArrayList<T> list = new ArrayList<T>();
      int[] ints = table.getSelectedRows();
      for (int anInt : ints) {
        int modelIndex = ((AUSelectItemSortingTableModel) table.getModel()).convertRowIndexToModel(anInt);
        list.add(items.get(modelIndex));
      }
      return list;
    }
    public ArrayList<T> getCheckedItems() {
      ArrayList<T> list = new ArrayList<T>();
      int count = table.getModel().getRowCount();
      for (int i = 0; i < count; i++) {
        if (((AUSelectItemSortingTableModel) table.getModel()).isChecked(i)) {
          list.add(items.get(i));
        }
      }
      return list;
    }

  public ArrayList<T> getUncheckedItems() {
    ArrayList<T> list = new ArrayList<T>();
    int count = table.getModel().getRowCount();
    for (int i = 0; i < count; i++) {
      if (!((AUSelectItemSortingTableModel) table.getModel()).isChecked(i)) {
        list.add(items.get(i));
      }
    }
    return list;
  }

    public boolean isRunChecked() {
      return runChecked;
    }
    public boolean isOpenSelected() {
      return openSelected;
    }


  public ArrayList<T> getItems() {
    return items;
  }

  public void setItems(ArrayList<T> items) {
    this.items = items;
  }

  public Set<String> getSelectedItemIds() {
    return selectedItemIds;
  }

  public void setSelectedItemIds(Set<String> selectedItemIds) {
    this.selectedItemIds = selectedItemIds;
  }

  public JTable getTable() {
    return table;
  }

  public void setTable(JTable table) {
    this.table = table;
  }

  public JButton getCheckButton() {
    return checkButton;
  }

  public void setCheckButton(JButton checkButton) {
    this.checkButton = checkButton;
  }

  public JButton getUnCheckButton() {
    return unCheckButton;
  }

  public void setUnCheckButton(JButton unCheckButton) {
    this.unCheckButton = unCheckButton;
  }

  public JButton getRunCheckedButton() {
    return runCheckedButton;
  }

  public void setRunCheckedButton(JButton runCheckedButton) {
    this.runCheckedButton = runCheckedButton;
  }

  public void setRunChecked(boolean runChecked) {
    this.runChecked = runChecked;
  }

  public void setOpenSelected(boolean openSelected) {
    this.openSelected = openSelected;
  }
}
