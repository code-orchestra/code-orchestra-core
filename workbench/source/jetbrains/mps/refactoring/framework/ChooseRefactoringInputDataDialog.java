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
package jetbrains.mps.refactoring.framework;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.smodel.ModelAccess;

import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

@Deprecated
//left for compatibility with old refactorings
public class ChooseRefactoringInputDataDialog extends BaseDialog {

  private JPanel myInnerPanel;
  private boolean myIsCancelled = true;
  private List<IChooseComponent> myComponents;
  private AbstractLoggableRefactoring myRefactoring;
  private RefactoringContext myRefactoringContext;
  private IChooseComponent myFirstComponent = null;
  private IChooseComponent myLastComponent = null;

  public ChooseRefactoringInputDataDialog(AbstractLoggableRefactoring refactoring, final RefactoringContext refactoringContext, List<IChooseComponent> components) throws HeadlessException {
    super(refactoringContext.getCurrentOperationContext().getMainFrame(), "Input Data for " + refactoring.getUserFriendlyName());
    myRefactoring = refactoring;
    myRefactoringContext = refactoringContext;
    myComponents = new ArrayList<IChooseComponent>(components);
    myInnerPanel = new JPanel();
    GridBagLayout layout = new GridBagLayout();
    GridBagConstraints constraints = new GridBagConstraints();
    constraints.gridx = 0;
    constraints.gridy = GridBagConstraints.RELATIVE;
    constraints.gridwidth = 1;
    constraints.fill = GridBagConstraints.BOTH;
    constraints.weightx = 1;
    constraints.weighty = 0;
    myInnerPanel.setLayout(layout);

    for (IChooseComponent component : myComponents) {
      if (myFirstComponent == null && component instanceof JComponent) {
        myFirstComponent = component;
      }
      if (component instanceof JComponent) {
        myLastComponent = component;
      }
      myInnerPanel.add(component.getMainComponent(), constraints);
    }

    constraints.weighty = 1;
    myInnerPanel.add(new JPanel(), constraints);
  }

  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(200, 200, 800, 600);
  }

  protected JComponent getMainComponent() {
    return myInnerPanel;
  }

  public boolean getResult() {
    return !myIsCancelled;
  }

  protected void prepareDialog() {
    super.prepareDialog();
    pack();
    if (myFirstComponent != null) {
      final FocusTraversalPolicy policy = this.getFocusTraversalPolicy();
      this.setFocusTraversalPolicy(new FocusTraversalPolicy() {
        public Component getComponentAfter(Container aContainer, Component aComponent) {
          return policy.getComponentAfter(aContainer, aComponent);
        }

        public Component getComponentBefore(Container aContainer, Component aComponent) {
          return policy.getComponentBefore(aContainer, aComponent);
        }

        public Component getFirstComponent(Container aContainer) {
          return myFirstComponent.getComponentToFocus();
        }

        public Component getLastComponent(Container aContainer) {
          return myLastComponent.getComponentToFocus();
        }

        public Component getDefaultComponent(Container aContainer) {
          return myFirstComponent.getComponentToFocus();
        }

        public Component getInitialComponent(Window window) {
          return myFirstComponent.getComponentToFocus();
        }
      });
    }
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    try {
      for (IChooseComponent component : myComponents) {
        myRefactoringContext.setParameter(component.getPropertyName(), component.submit());
      }

      boolean applicable = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
        public Boolean compute() {
          return myRefactoring.isApplicable(myRefactoringContext);
        }
      });

      if (applicable) {
        myIsCancelled = false;
        dispose();
      } else {
        myIsCancelled = true;
        myRefactoringContext.clearParameters();
        JOptionPane.showMessageDialog(this, "refactoring is not applicable");
      }
    } catch (InvalidInputValueException ex) {
      myIsCancelled = true;
      JOptionPane.showMessageDialog(this, ex.getMessage());
    }
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    dispose();
  }
}
