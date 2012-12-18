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
package jetbrains.mps.ide;

import com.intellij.ui.ScrollPaneFactory;
import com.intellij.ui.components.JBList;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class ChooseItemComponent<Item> extends JPanel {
  private JTextField myTextField;
  private Map<String, Set<Item>> myItemsMap = new HashMap<String, Set<Item>>();
  private List<String> myNames = new ArrayList<String>();
  private boolean myShowAllOnEmptyText = false;
  private JList myList = new JBList(new DefaultListModel());
  private String myHeader;
  private JComponent myHeaderLabel;
  private JPanel myMainPanel;

  public ChooseItemComponent(String header) {
    this(header, false);
  }

  public ChooseItemComponent(String header, boolean showAllOnEmptyText) {

    myHeader = header;
    myShowAllOnEmptyText = showAllOnEmptyText;

    setLayout(new BorderLayout());
    if (myHeader != null) {
      myMainPanel = new JPanel(new GridLayout(2, 1));
      myHeaderLabel = new JPanel(new BorderLayout(10, 0));
      myHeaderLabel.add(new JLabel(myHeader), BorderLayout.WEST);
      myMainPanel.add(myHeaderLabel);
    } else {
      myMainPanel = new JPanel(new GridLayout(1, 1));
    }
    myMainPanel.add(myTextField = new JTextField(""));
    add(myMainPanel, BorderLayout.NORTH);
    myList.setFocusable(false);
    myList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    setListCellRenderer(new ChooseItemWindowCellRenderer<Item>(this));
    myList.addMouseListener(new MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        if (e.getClickCount() == 2) {
          doComplete();
        }
      }
    });
    add(ScrollPaneFactory.createScrollPane(myList), BorderLayout.CENTER);


    myMainPanel.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        doComplete();
      }
    }, KeyStroke.getKeyStroke("ENTER"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    myMainPanel.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        for (String name : myNames) {
          if (name != null && name.startsWith(myTextField.getText())) {
            myTextField.setText(name.toString());
            return;
          }
        }
      }
    }, KeyStroke.getKeyStroke("ctrl SPACE"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    myMainPanel.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        int index = myList.getSelectedIndex();
        if (index == -1) return;
        myList.setSelectedIndex(Math.max((index - 1), 0));
        myList.ensureIndexIsVisible(myList.getSelectedIndex());
      }
    }, KeyStroke.getKeyStroke("UP"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    myMainPanel.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        int index = myList.getSelectedIndex();
        if (index == -1) return;
        myList.setSelectedIndex(Math.min((index + 1), myList.getModel().getSize() - 1));
        myList.ensureIndexIsVisible(myList.getSelectedIndex());
      }
    }, KeyStroke.getKeyStroke("DOWN"), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    myTextField.getDocument().addDocumentListener(new DocumentListener() {
      public void insertUpdate(DocumentEvent e) {
        updateState();
      }

      public void removeUpdate(DocumentEvent e) {
        updateState();
      }

      public void changedUpdate(DocumentEvent e) {
        updateState();
      }
    });
  }


  private void doComplete() {
    final Item selectedItem = getSelectedItem();
    if (selectedItem == null) return;
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        doChoose(selectedItem);
      }
    });
  }

  public Item getSelectedItem() {
    return (Item) myList.getSelectedValue();
  }

  public abstract void doChoose(Item item);

  public void setListCellRenderer(ListCellRenderer cellRenderer) {
    if (cellRenderer != null) {
      myList.setCellRenderer(cellRenderer);
    }
  }

  protected String getItemPresentation(Item item) {
    return item.toString();
  }

  protected String getItemDescription(Item item) {
    return null;
  }

  protected Icon getItemIcon(Item item) {
    if (item instanceof SNode) {
      SNode node = (SNode) item;
      return IconManager.getIconFor(node);
    }
    return null;
  }

  protected Color getItemColor(Item item) {
    return Color.BLACK;
  }

  public JPanel getMainPanel() {
    return myMainPanel;
  }

  public JComponent getHeaderLabel() {
    return myHeaderLabel;
  }

  public JTextField getTextField() {
    return myTextField;
  }

  public JList getList() {
    return myList;
  }

  public List<String> getNames() {
    return myNames;
  }

  public Map<String, Set<Item>> getItemsMap() {
    return myItemsMap;
  }

  public void putItem(String name, Item item) {
    if (!myItemsMap.containsKey(name)) {
      myItemsMap.put(name, new HashSet<Item>());
    }
    myItemsMap.get(name).add(item);
  }

  public void makeNamesConsistent() {
    myNames.addAll(myItemsMap.keySet());
    Collections.sort(myNames);
  }

  public Pattern getItemPattern() {
    final String text = myTextField.getText();
    return getItemPattern(text, true);
  }

  protected Pattern getItemPattern(String text, boolean useDots) {
    StringBuilder b = getExactItemPatternBuilder(text, useDots);
    b.append(".*");
    Pattern p = Pattern.compile(b.toString());
    return p;
  }


  protected void updateState() {
    DefaultListModel model = (DefaultListModel) myList.getModel();
    model.clear();
    boolean isMatchesSomething = false;
    if (myTextField.getText().length() > 0) {
      Matcher itemMatcher = getItemPattern().matcher("");
      outerLoop:
      for (String name : myNames) {
        itemMatcher.reset(name);
        if (itemMatcher.matches()) {
          if (!isMatchesSomething) {
            myTextField.setBackground(Color.WHITE);
            isMatchesSomething = true;
          }
          for (Item i : myItemsMap.get(name)) {
            model.addElement(i);
            if (model.size() > 42) break outerLoop;
          }
        }
      }
    } else if (myShowAllOnEmptyText) {
      myTextField.setBackground(Color.WHITE);
      isMatchesSomething = true;
      outerLoop:
      for (String name : myNames) {
        for (Item i : myItemsMap.get(name)) {
          model.addElement(i);
          if (model.size() > 42) break outerLoop;
        }
      }
    }

    if (!isMatchesSomething) {
      myTextField.setBackground(new Color(255, 220, 220));
    }

    Item oldSelection = getSelectedItem();
    if ((oldSelection == null || !model.contains(oldSelection)) && model.size() > 0) {
      oldSelection = (Item) model.getElementAt(0);
    }

    myList.setSelectedValue(oldSelection, true);
  }

  @CodeOrchestraPatch
  public static StringBuilder getExactItemPatternBuilder(String text, boolean useDots) {
    StringBuilder b = new StringBuilder();
    int state = 0;
    for (int i = 0; i < text.length(); i++) {
      char c = text.charAt(i);

      switch (state) {
        case 0: // no quoting
          if (c == '*') {
            b.append(".*");
          }
          // RE-3298
          /*
          else if (c == '?') {
            b.append(".");
          }
          */
          else if (c == '.') {
            if (useDots) {
              b.append("[^\\.]*\\.");
            } else {
              b.append("\\.");
            }
          } else if (c == '@') {
            b.append("[^\\@\\.]*\\@");
          } else if (Character.isLetterOrDigit(c) || c == '_') {
            b.append(c);
            state = 2;
          } else {
            b.append("\\Q");
            b.append(c);
            state = 1;
          }
          break;
        case 1: // quoting
          if (c == '*') {
            b.append("\\E");
            b.append(".*");
            state = 0;
          } else if (c == '?') {
            b.append("\\E");
            b.append(".");
            state = 0;
          } else if (c == '.') {
            if (useDots) {
              b.append("\\E");
              b.append("[^\\.]*\\.");
            } else {
              b.append("\\.");
            }
            state = 0;
          } else if (c == '@') {
            b.append("\\E");
            b.append("[^\\@\\.]*\\@");
            state = 0;
          } else if (Character.isLetterOrDigit(c) || c == '_') {
            b.append("\\E");
            b.append(c);
            state = 2;
          } else {
            b.append(c);
          }
          break;
        case 2: // Sequence of letters, digits and underscores
          if (c == '*') {
            b.append(".*");
            state = 0;
          // RE-3298
          /*
          } else if (c == '?') {
            b.append(".");
            state = 0;
          */
          } else if (c == '.') {
            if (useDots) {
              b.append("[^\\.]*\\.");
            } else {
              b.append("\\.");
            }
            state = 0;
          } else if (c == '@') {
            b.append("[^\\@\\.]*\\@");
            state = 0;
          } else if (Character.isUpperCase(c)) {
            b.append("[a-z0-9_]*");
            b.append(c);
          } else if (Character.isLetterOrDigit(c) || c == '_') {
            b.append(c);
          } else {
            b.append("\\Q");
            b.append(c);
            state = 1;
          }
          break;
      }
    }
    if (state == 1) {
      b.append("\\E");
    }
    return b;
  }
}
