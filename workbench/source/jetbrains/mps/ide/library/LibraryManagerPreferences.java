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
package jetbrains.mps.ide.library;

import com.intellij.ui.ScrollPaneFactory;
import com.intellij.ui.components.JBList;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.library.BaseLibraryManager;
import jetbrains.mps.library.Library;
import jetbrains.mps.library.LibraryInitializer;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.vfs.IFile;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LibraryManagerPreferences {
  private BaseLibraryManager myManager;
  private JPanel myMainPanel = new JPanel(new BorderLayout());
  private DefaultListModel myListModel = new DefaultListModel();
  private JList myLibrariesList = new JBList(myListModel);

  private boolean myChanged;
  private JButton myRemoveButton;
  private JButton myEditButton;

  public LibraryManagerPreferences(BaseLibraryManager manager) {
    myManager = manager;

    myMainPanel.add(ScrollPaneFactory.createScrollPane(myLibrariesList), BorderLayout.CENTER);

    myLibrariesList.setCellRenderer(new DefaultListCellRenderer() {
      public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected, boolean cellHasFocus) {
        super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
        Library library = (Library) value;
        setText("<html><b>" + library.getName() + "</b> (" + library.getPath() + ")");
        return this;
      }
    });

    JPanel buttonsPanel = new JPanel(new BorderLayout());
    JPanel innerButtonsPanel = new JPanel(new GridLayout(1, 0));

    buttonsPanel.add(new JPanel(), BorderLayout.CENTER);
    buttonsPanel.add(innerButtonsPanel, BorderLayout.WEST);

    innerButtonsPanel.add(new JButton(new AbstractAction("Add") {
      public void actionPerformed(ActionEvent e) {
        add();
      }
    }));
    myRemoveButton = new JButton(new AbstractAction("Remove") {
      public void actionPerformed(ActionEvent e) {
        remove();
      }
    });
    innerButtonsPanel.add(myRemoveButton);
    myEditButton = new JButton(new AbstractAction("Edit") {
      public void actionPerformed(ActionEvent e) {
        edit();
      }
    });
    innerButtonsPanel.add(myEditButton);
    myLibrariesList.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
      public void valueChanged(ListSelectionEvent e) {
        int index = myLibrariesList.getSelectedIndex();
        if (index < 0) return;
        Library l = (Library) myListModel.get(index);
        //todo add predef lib to view
        boolean predefined = false;
        myEditButton.setEnabled(!predefined);
        myRemoveButton.setEnabled(!predefined);
      }
    });

    myMainPanel.add(buttonsPanel, BorderLayout.SOUTH);

    updateModel(false);
  }


  private void updateModel(final boolean updateManager) {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        Library oldSelection = (Library) myLibrariesList.getSelectedValue();
        List<Library> libraries = new ArrayList<Library>(myManager.getUILibraries());
        Collections.sort(libraries, new ToStringComparator());
        myListModel.clear();
        for (Library l : libraries) {
          myListModel.addElement(l);
        }

        if (oldSelection != null) {
          myLibrariesList.setSelectedValue(oldSelection, true);
        }

        if (updateManager) {
          LibraryInitializer.getInstance().update();
        }
      }
    });
  }

  private void remove() {
    int index = myLibrariesList.getSelectedIndex();
    if (index == -1) {
      return;
    }
    myManager.remove((Library) myListModel.get(index));
    updateModel(true);
    myChanged = true;
  }


  private void edit() {
    int index = myLibrariesList.getSelectedIndex();
    if (index == -1) {
      return;
    }

    Library l = (Library) myListModel.get(index);

    //add support of predefined libs
    if (false) {
      JOptionPane.showMessageDialog(myMainPanel, "You can't edit a predefined library", "Error", JOptionPane.ERROR_MESSAGE);
      return;
    }

    String path;
    TreeFileChooser chooser = new TreeFileChooser();
    chooser.setMode(TreeFileChooser.MODE_DIRECTORIES);
    IFile result = chooser.showDialog(myMainPanel);

    if (result == null) return;
    path = result.getPath();

    l.setPath(path);

    updateModel(true);
    myChanged = true;
  }

  private void add() {
    String name = JOptionPane.showInputDialog(myMainPanel, "Enter a Library name", "New Library", JOptionPane.PLAIN_MESSAGE);

    if (name == null) {
      return;
    }

    String path;
    TreeFileChooser chooser = new TreeFileChooser();
    chooser.setMode(TreeFileChooser.MODE_DIRECTORIES);

    IFile result = chooser.showDialog(myMainPanel);

    if (result == null) return;
    path = result.getPath();

    myManager.addLibrary(name).setPath(path);
    updateModel(true);

    myChanged = true;
  }

  public String getName() {
    return "Libraries";
  }

  public Icon getIcon() {
    return null;
  }

  public JComponent getComponent() {
    return myMainPanel;
  }

  public boolean validate() {
    return true;
  }

  public void commit() {

  }

  public boolean isModified() {
    return myChanged;
  }

  public void reset() {

  }
}
