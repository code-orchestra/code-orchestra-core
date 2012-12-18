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
package jetbrains.mps.ide.ui;

import jetbrains.mps.ide.projectPane.Icons;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

/**
 * @author Kostik
 */
public class HeaderWrapper extends JPanel {
  private JComponent myComponent;
  private JLabel myLabel = new JLabel("", JLabel.LEFT) {
    public Dimension getMinimumSize() {
      return new Dimension(0, 0);
    }
  };
  private JPanel myButtonsPanel;

  private JButton myCloseButton;
  private JButton myMinimizeButton;
  private PropertyChangeListener myFocusListener = new PropertyChangeListener() {
    public void propertyChange(PropertyChangeEvent evt) {
      updateLabel();
    }
  };

  public HeaderWrapper(String text, JComponent component) {
    this(text, component, false, false);
  }

  public HeaderWrapper(String text, JComponent component, boolean showCloseButton, boolean showMinimizeButton) {
    super(new BorderLayout());

    setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY, 1));

    JPanel labelPanel = new JPanel(new BorderLayout());
    myLabel.setText(text);
    myLabel.setFont(myLabel.getFont().deriveFont(Font.BOLD));
    myLabel.setForeground(Color.WHITE);
    myLabel.setOpaque(true);
    myLabel.setBorder(BorderFactory.createEmptyBorder(1, 3, 1, 3));
    myLabel.addMouseListener(new MouseAdapter() {
      public void mousePressed(MouseEvent e) {
        myComponent.requestFocus();
      }
    });

    if (showMinimizeButton || showCloseButton) {
      myButtonsPanel = new JPanel(new GridLayout(1, 0));

      if (showMinimizeButton) {
        myMinimizeButton = new JButton(new AbstractAction("", Icons.MINIMIZE_ICON) {
          public void actionPerformed(ActionEvent e) {
            doMinimize();
          }
        }) {
          public void updateUI() {
            setUI(new MPSRoundButtonUI());
          }
        };
        setupButton(myMinimizeButton);
        myButtonsPanel.add(myMinimizeButton);
      }

      if (showCloseButton) {
        myCloseButton = new JButton(new AbstractAction("", Icons.CLOSE_ICON) {
          public void actionPerformed(ActionEvent e) {
            doClose();
          }
        }) {
          public void updateUI() {
            setUI(new MPSRoundButtonUI());
          }
        };
        setupButton(myCloseButton);
        myButtonsPanel.add(myCloseButton);
      }


      labelPanel.add(myButtonsPanel, BorderLayout.EAST);
    }

    labelPanel.add(myLabel, BorderLayout.CENTER);

    myComponent = component;
    add(labelPanel, BorderLayout.NORTH);
    add(myComponent, BorderLayout.CENTER);

    updateLabel();

  }


  public void addNotify() {
    super.addNotify();
    KeyboardFocusManager.getCurrentKeyboardFocusManager().addPropertyChangeListener(myFocusListener);
  }


  public void removeNotify() {
    KeyboardFocusManager.getCurrentKeyboardFocusManager().removePropertyChangeListener(myFocusListener);
    super.removeNotify();
  }

  private void setupButton(JButton button) {
    button.setContentAreaFilled(false);
    button.setBorder(null);
  }

  protected void doClose() {

  }

  protected void doMinimize() {

  }

  public void setText(String text) {
    myLabel.setText(text);
  }

  private void updateLabel() {
    Component focusOwner = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner();
    if (isAncestorOf(focusOwner)) {
      myLabel.setBackground(getActiveColor());
      myLabel.setForeground(getActiveTextColor());
      if (myButtonsPanel != null) myButtonsPanel.setBackground(getActiveColor());
      if (myMinimizeButton != null) myMinimizeButton.setIcon(Icons.MINIMIZE_ICON);
      if (myCloseButton != null) myCloseButton.setIcon(Icons.CLOSE_ICON);
    } else {
      myLabel.setBackground(getNotActiveColor());
      myLabel.setForeground(getNotActiveTextColor());
      if (myButtonsPanel != null) myButtonsPanel.setBackground(getNotActiveColor());
      if (myMinimizeButton != null) myMinimizeButton.setIcon(Icons.MINIMIZE_DISABLED_ICON);
      if (myCloseButton != null) myCloseButton.setIcon(Icons.CLOSE_DISABLED_ICON);
    }
  }

  private Color getActiveColor() {
    return UIManager.getColor("List.selectionBackground");
  }

  private Color getNotActiveColor() {
    return Color.LIGHT_GRAY;
  }

  private Color getActiveTextColor() {
    return UIManager.getColor("List.selectionForeground");
  }

  private Color getNotActiveTextColor() {
    return Color.GRAY;
  }

  public static void main(String[] args) {
    JFrame frame = new JFrame("Frame");
    frame.add(new HeaderWrapper("My button", new JButton("OK")));
    frame.pack();
    frame.setVisible(true);
  }


}
