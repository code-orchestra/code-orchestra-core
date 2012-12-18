/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.refactoring.framework;

import com.intellij.ui.popup.PopupOwner;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.refactoring.framework.paramchooser.IChooser;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.Arrays;

public class AskDialog extends BaseDialog {
  private JPanel myInnerPanel;
  private boolean myIsCancelled = true;
  private ArrayList<IChooser> myChoosers;
  private IChooseComponent myFirstChooser = null;
  private IChooseComponent myLastChooser = null;

  private KeyEventDispatcher enterAndEscapeEventDispatcher = new KeyEventDispatcher() {
    public boolean dispatchKeyEvent(KeyEvent e) {
      if (e.getSource() instanceof JButton) {
        return false;
      }
      if (e.getSource() instanceof PopupOwner) {
        return false;
      }

      int keyCode = e.getKeyCode();
      if (e.getID() == KeyEvent.KEY_PRESSED) {
        if (keyCode == KeyEvent.VK_ENTER) {
          onOk();
          return true;
        } else if (keyCode == KeyEvent.VK_ESCAPE) {
          onCancel();
          return true;
        }
      }

      return false;
    }
  };

  public AskDialog(final RefactoringContext refactoringContext, IChooser... choosers) throws HeadlessException {
    super(refactoringContext.getCurrentOperationContext().getMainFrame(), refactoringContext.getRefactoring().getUserFriendlyName());
    myChoosers = new ArrayList<IChooser>(Arrays.asList(choosers));
    myInnerPanel = new JPanel();
    GridBagLayout layout = new GridBagLayout();
    GridBagConstraints constraints = new GridBagConstraints();
    constraints.gridx = 0;
    constraints.gridy = GridBagConstraints.RELATIVE;
    constraints.gridwidth = 1;
    constraints.fill = GridBagConstraints.BOTH;
    constraints.weightx = 1;
    myInnerPanel.setLayout(layout);

    boolean hasStretchableChild = false;
    for (IChooser chooser : myChoosers) {
      if (chooser.isStretchable()) {
        constraints.weighty = 1;
        hasStretchableChild = true;
      } else {
        constraints.weighty = 0;
      }
      myInnerPanel.add(chooser.getMainComponent(), constraints);
    }

    if (!hasStretchableChild) {
      constraints.weighty = 1;
      myInnerPanel.add(new JPanel(), constraints);
    }

    // Init global VK_ENTER && VK_ESC listener
    KeyboardFocusManager.getCurrentKeyboardFocusManager().addKeyEventDispatcher(enterAndEscapeEventDispatcher);
    addWindowListener(new WindowAdapter() {
      @Override
      public void windowClosing(WindowEvent e) {
        // Init global VK_ENTER && VK_ESC listener
        KeyboardFocusManager.getCurrentKeyboardFocusManager().removeKeyEventDispatcher(enterAndEscapeEventDispatcher);
      }
    });
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 800, 600);
  }

  protected JComponent getMainComponent() {
    return myInnerPanel;
  }

  public boolean isCancelled() {
    return myIsCancelled;
  }

  @CodeOrchestraPatch
  protected void prepareDialog() {
    super.prepareDialog();

    // RE-1476
    pack();

    if (myFirstChooser != null) {
      final FocusTraversalPolicy policy = this.getFocusTraversalPolicy();
      this.setFocusTraversalPolicy(new FocusTraversalPolicy() {
        public Component getComponentAfter(Container aContainer, Component aComponent) {
          return policy.getComponentAfter(aContainer, aComponent);
        }

        public Component getComponentBefore(Container aContainer, Component aComponent) {
          return policy.getComponentBefore(aContainer, aComponent);
        }

        public Component getFirstComponent(Container aContainer) {
          return myFirstChooser.getComponentToFocus();
        }

        public Component getLastComponent(Container aContainer) {
          return myLastChooser.getComponentToFocus();
        }

        public Component getDefaultComponent(Container aContainer) {
          return myFirstChooser.getComponentToFocus();
        }

        public Component getInitialComponent(Window window) {
          return myFirstChooser.getComponentToFocus();
        }
      });
    }
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    try {
      for (IChooser chooser : myChoosers) {
        chooser.commit();
      }

      myIsCancelled = false;

      // Remove ESC && ENTER dispatcher
      KeyboardFocusManager.getCurrentKeyboardFocusManager().removeKeyEventDispatcher(enterAndEscapeEventDispatcher);

      dispose();
    } catch (InvalidInputValueException ex) {
      myIsCancelled = true;
      JOptionPane.showMessageDialog(this, ex.getMessage());
    }
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    // Remove ESC && ENTER dispatcher
    KeyboardFocusManager.getCurrentKeyboardFocusManager().removeKeyEventDispatcher(enterAndEscapeEventDispatcher);

    dispose();
  }
}
