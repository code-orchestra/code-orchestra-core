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
package jetbrains.mps.workbench.search;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.util.IconLoader;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.ui.components.panels.NonOpaquePanel;
import jetbrains.mps.ide.actions.FindNext_Action;
import jetbrains.mps.ide.actions.FindPrevious_Action;
import jetbrains.mps.ide.actions.Find_Action;
import jetbrains.mps.ide.ui.CompletionTextField;
import jetbrains.mps.workbench.search.icons.Icons;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;


public abstract class AbstractSearchPanel extends JPanel {
  protected final Color myBadSequenceColor = Color.pink;
  protected HistoryCompletionTextField myText = new HistoryCompletionTextField();
  private JCheckBox myIsCaseSensitive = new JCheckBox("Case sensitive");
  private JCheckBox myIsWordsOnly = new JCheckBox("Match whole words only");
  private JCheckBox myIsRegex = new JCheckBox("Regex");
  protected JLabel myFindResult = new JLabel();
  private JComponent myToolbarComponent;
  private String myErrorMessage = null;

  protected abstract SearchHistoryComponent getSearchHistory();

  public abstract void goToPrevious();

  public abstract void goToNext();

  protected abstract void search();

  protected abstract void deactivate();

  protected AbstractSearchPanel() {
    super(new BorderLayout(0, 0));
    setPreferredSize(new Dimension((int) getPreferredSize().getWidth(),
      (int) myText.getPreferredSize().getHeight() + 5));

    JPanel mainPanel = new NonOpaquePanel(new FlowLayout(FlowLayout.LEFT, 5, 0));
    mainPanel.add(new JLabel("Text:"));
    mainPanel.add(myText);
    myText.setHideCompletionOnClick(true);
    setSmallerFont(myText);

    DefaultActionGroup group = new DefaultActionGroup("search bar", false);
    group.add(new ShowHistoryAction());
    group.add(new PrevOccurenceAction());
    group.add(new NextOccurenceAction());
    group.add(new FindAllAction());

    final ActionToolbar tb = ActionManager.getInstance().createActionToolbar("SearchBar", group, true);
    tb.setLayoutPolicy(ActionToolbar.NOWRAP_LAYOUT_POLICY);
    myToolbarComponent = tb.getComponent();
    myToolbarComponent.setBorder(null);
    myToolbarComponent.setOpaque(false);

    mainPanel.add(myToolbarComponent);

    mainPanel.add(myIsCaseSensitive);
    myIsCaseSensitive.setMnemonic(KeyEvent.VK_C);
    myIsCaseSensitive.setFocusable(false);
    myIsCaseSensitive.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent event) {
        search();
      }
    });

    mainPanel.add(myIsWordsOnly);
    myIsWordsOnly.setMnemonic(KeyEvent.VK_M);
    myIsWordsOnly.setFocusable(false);
    myIsWordsOnly.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent event) {
        search();
      }
    });

    mainPanel.add(myIsRegex);
    myIsRegex.setMnemonic(KeyEvent.VK_R);
    myIsRegex.setFocusable(false);
    myIsRegex.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent event) {
        myIsWordsOnly.setEnabled(!myIsWordsOnly.isEnabled());
      }
    });

    this.add(mainPanel, BorderLayout.WEST);

    JPanel tailPanel = new NonOpaquePanel(new BorderLayout(5, 0));
    JPanel tailContainer = new NonOpaquePanel(new BorderLayout(5, 0));
    JLabel escapeLabel = new JLabel(Icons.ESCAPE_ICON);

    tailPanel.add(myFindResult, BorderLayout.CENTER);
    tailPanel.add(escapeLabel, BorderLayout.EAST);

    tailContainer.add(tailPanel, BorderLayout.EAST);
    this.add(tailContainer, BorderLayout.CENTER);

    escapeLabel.addMouseListener(new MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        deactivate();
      }
    });

    setSmallerFontAndOpaque(myIsWordsOnly);
    setSmallerFontAndOpaque(myIsCaseSensitive);
    setSmallerFontAndOpaque(myIsRegex);
    setSmallerFontAndOpaque(myFindResult);

    myText.getDocument().addDocumentListener(new DocumentListener() {
      public void insertUpdate(DocumentEvent e) {
        search();
      }

      public void removeUpdate(DocumentEvent e) {
        search();
      }

      public void changedUpdate(DocumentEvent e) {
        search();
      }
    });

    myText.setColumns(20);


    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToNext();
      }
    }, KeyStroke.getKeyStroke("DOWN"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        goToPrevious();
      }
    }, KeyStroke.getKeyStroke("UP"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

    setVisible(false);

    registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        deactivate();
      }
    }, KeyStroke.getKeyStroke("ESCAPE"), WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
  }

  protected void setInitialText(final String initialText) {
    final String text = initialText != null ? initialText : "";
    if (text.indexOf("\n") >= 0) {
      myIsRegex.setSelected(true);
      myText.setText(StringUtil.escapeToRegexp(text));
    } else {
      myText.setText(text);
    }
  }

  protected Pattern getPattern() {
    if (myIsRegex.isSelected()) {
      return SearchConditions.containsRegexp(myText.getText(), myIsCaseSensitive.isSelected());
    } else if (myIsWordsOnly.isSelected()) {
      return SearchConditions.containsWholeWord(myText.getText(), myIsCaseSensitive.isSelected());
    } else {
      return SearchConditions.containsString(myText.getText(), myIsCaseSensitive.isSelected());
    }
  }

  protected boolean canExportToFindTool() {
    return false;
  }

  protected void exportToFindTool() {
  }

  protected void setErrorMessage(String message) {
    myErrorMessage = message;
    if (message == null) {
      return;
    }
    Font font = myFindResult.getFont().deriveFont(Font.BOLD);
    myFindResult.setFont(font);
    myFindResult.setText(message);
    myText.setBackground(myBadSequenceColor);
  }

  private boolean hasErrors() {
    return myErrorMessage != null;
  }

  protected void updateSearchReport(int matches) {
    if (hasErrors()) {
      return;
    }
    Font font = myFindResult.getFont().deriveFont(Font.PLAIN);
    String text;
    if (matches > 100) {
      font = font.deriveFont(Font.BOLD);
      text = "More than 100 matches";
    } else if (matches > 1) {
      text = String.valueOf(matches) + " matches";
    } else if (matches == 1) {
      text = String.valueOf(matches) + " match";
    } else {
      text = "No matches";
    }
    myFindResult.setFont(font);
    myFindResult.setText(text);
    if (matches == 0) {
      myText.setBackground(myBadSequenceColor);
    } else if (myText.getBackground() == myBadSequenceColor) {
      myText.setBackground(Color.white);
    }
  }

  public void activate() {
    if (getSearchHistory() != null && getSearchHistory().getSearches().size() != 0) {
      for (int i = getSearchHistory().getSearches().size() - 1; i >= 0; i--) {
        myText.addValue(getSearchHistory().getSearches().get(i));
      }
    }
    revalidate();
    setVisible(true);
    myText.requestFocus();
  }

  @Override
  protected void paintComponent(Graphics g) {
    super.paintComponent(g);

    //copied from IDEA's class EditorSearchComponent
    Graphics2D g2d = (Graphics2D) g;
    final Color BORDER_COLOR = new Color(0x87, 0x87, 0x87);
    final Color GRADIENT_C1 = getBackground();
    final Color GRADIENT_C2 = new Color(Math.max(0, GRADIENT_C1.getRed() - 0x18),
      Math.max(0, GRADIENT_C1.getGreen() - 0x18),
      Math.max(0, GRADIENT_C1.getBlue() - 0x18));
    g2d.setPaint(new GradientPaint(0, 0, GRADIENT_C1, 0, getHeight(), GRADIENT_C2));
    g2d.fillRect(1, 1, getWidth(), getHeight() - 1);
    g.setColor(BORDER_COLOR);
    g2d.setPaint(null);
    g.drawLine(0, getHeight() - 1, getWidth(), getHeight() - 1);
  }

  protected void addToHistory() {
    myText.addValue(myText.getText());
    getSearchHistory().setSearches(myText.getProposals(myText.getText()));
  }

  private static void setSmallerFontAndOpaque(final JComponent component) {
    setSmallerFont(component);
    component.setOpaque(false);
  }

  private static void setSmallerFont(final JComponent component) {
    if (SystemInfo.isMac) {
      Font f = component.getFont();
      component.setFont(f.deriveFont(f.getStyle(), f.getSize() - 2));
    }
  }

  protected class HistoryCompletionTextField extends CompletionTextField {
    private final int myPossibleValuesLimit = 30;
    private List<String> myPossibleValues = new ArrayList<String>();

    public HistoryCompletionTextField() {
      super();
    }

    public HistoryCompletionTextField(List<String> possibleValues) {
      super();
      myPossibleValues.addAll(possibleValues);
    }

    public void addValue(String value) {
      boolean added = myPossibleValues.isEmpty() || !myPossibleValues.get(0).equals(value);
      if (added && !myPossibleValues.contains(value) && value.length() != 0) {
        myPossibleValues.add(0, value);
        if (myPossibleValues.size() > myPossibleValuesLimit) {
          for (int i = myPossibleValues.size() - 1; i >= myPossibleValuesLimit; i--) {
            myPossibleValues.remove(i);
          }
        }
      }
    }

    protected boolean canShowPopupAutomatically() {
      return getText().length() == 0;
    }

    protected boolean isCanShowCompletionOnRemove() {
      return false;
    }

    public List<String> getProposals(String text) {
      return myPossibleValues;
    }

  }

  protected class ShowHistoryAction extends AnAction {
    private ShowHistoryAction() {
      getTemplatePresentation().setIcon(Icons.SEARCH_ICON);
      getTemplatePresentation().setDescription("Search history");
      getTemplatePresentation().setText("Search History");

      ArrayList<Shortcut> shortcuts = new ArrayList<Shortcut>();
      shortcuts.addAll(Arrays.asList(ActionManager.getInstance().getAction(
        Find_Action.class.getName()).getShortcutSet().getShortcuts()));
      shortcuts.add(new KeyboardShortcut(KeyStroke.getKeyStroke(KeyEvent.VK_H, KeyEvent.CTRL_DOWN_MASK), null));

      registerCustomShortcutSet(
        new CustomShortcutSet(shortcuts.toArray(new Shortcut[shortcuts.size()])),
        myText);
    }

    public void actionPerformed(AnActionEvent e) {
      myText.showCompletion();
    }

    public void update(final AnActionEvent e) {
      e.getPresentation().setEnabled(!myText.getProposals(null).isEmpty());
    }
  }

  private class PrevOccurenceAction extends AnAction {
    public PrevOccurenceAction() {
      getTemplatePresentation().setIcon(Icons.PREVIOUS_ICON);
      getTemplatePresentation().setDescription("Previous Occurrence");
      getTemplatePresentation().setText("Previous Occurrence");

      ArrayList<Shortcut> shortcuts = new ArrayList<Shortcut>();
      shortcuts.addAll(Arrays.asList(ActionManager.getInstance().getAction(
        FindPrevious_Action.class.getName()).getShortcutSet().getShortcuts()));
      shortcuts.addAll(Arrays.asList(ActionManager.getInstance().getAction(
        IdeActions.ACTION_EDITOR_MOVE_CARET_UP).getShortcutSet().getShortcuts()));
      shortcuts.add(new KeyboardShortcut(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.SHIFT_DOWN_MASK), null));

      registerCustomShortcutSet(
        new CustomShortcutSet(shortcuts.toArray(new Shortcut[shortcuts.size()])),
        myText);
    }

    @Override
    public void update(AnActionEvent e) {
      e.getPresentation().setEnabled(!myText.completionIsVisible() && myText.getText().length() > 0);
    }

    public void actionPerformed(final AnActionEvent e) {
      goToPrevious();
    }
  }

  private class NextOccurenceAction extends AnAction {
    public NextOccurenceAction() {
      getTemplatePresentation().setIcon(Icons.NEXT_ICON);
      getTemplatePresentation().setDescription("Next Occurrence");
      getTemplatePresentation().setText("Next Occurrence");

      ArrayList<Shortcut> shortcuts = new ArrayList<Shortcut>();
      shortcuts.addAll(Arrays.asList(ActionManager.getInstance().getAction(
        FindNext_Action.class.getName()).getShortcutSet().getShortcuts()));
      shortcuts.addAll(Arrays.asList(ActionManager.getInstance().getAction(
        IdeActions.ACTION_EDITOR_MOVE_CARET_DOWN).getShortcutSet().getShortcuts()));
      shortcuts.add(new KeyboardShortcut(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), null));

      registerCustomShortcutSet(
        new CustomShortcutSet(shortcuts.toArray(new Shortcut[shortcuts.size()])),
        myText);
    }

    @Override
    public void update(AnActionEvent e) {
      e.getPresentation().setEnabled(!myText.completionIsVisible() && myText.getText().length() > 0);
    }

    public void actionPerformed(final AnActionEvent e) {
      goToNext();
    }
  }

  private class FindAllAction extends AnAction {
    private FindAllAction() {
      getTemplatePresentation().setIcon(IconLoader.getIcon("/actions/export.png"));
      getTemplatePresentation().setDescription("Export matches to Find tool window");
      getTemplatePresentation().setText("Find All");
      registerCustomShortcutSet(ActionManager.getInstance().getAction(
        FindNext_Action.class.getName()).getShortcutSet(), myText);
    }

    public void update(AnActionEvent e) {
      super.update(e);
      e.getPresentation().setEnabled(canExportToFindTool());
    }

    public void actionPerformed(AnActionEvent e) {
      exportToFindTool();
    }
  }
}
