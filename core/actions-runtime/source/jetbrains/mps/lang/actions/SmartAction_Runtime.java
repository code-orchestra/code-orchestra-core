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
package jetbrains.mps.lang.actions;

import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.smodel.IOperationContext;

import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.AbstractAction;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;

public abstract class SmartAction_Runtime {
  public abstract void execute(EditorCell selectedCell);

  public abstract SmartActionUIPanel getUI();

  public abstract boolean isApplicable(EditorCell selectedCell);

  public abstract String getDescriptionText();

  private SmartActionContext mySmartActionContext;
  private IOperationContext myOperationContext;

  public SmartAction_Runtime(IOperationContext operationContext) {
    myOperationContext = operationContext;
    mySmartActionContext = new SmartActionContext(operationContext);
  }

  protected SmartActionContext getSmartActionContext() {
    return mySmartActionContext;
  }

  protected IOperationContext getOperationContext() {
    return myOperationContext;
  }

  public void askForActionParametersAndExecute(final EditorCell selectedCell) {
    final SmartActionUIPanel mainPanel = getUI();

    if (mainPanel == null) {
      execute(selectedCell);
      return;
    }

    final JDialog dialog = new JDialog();
    dialog.setModal(true);
    dialog.setLayout(new BorderLayout());

    JPanel buttonPanel = new JPanel();
    buttonPanel.setLayout(new FlowLayout());
    buttonPanel.add(new JButton(new AbstractAction("OK") {
      public void actionPerformed(ActionEvent e) {
        onOk(mainPanel, selectedCell, dialog);
      }
    }));
    buttonPanel.add(new JButton(new AbstractAction("Cancel") {
      public void actionPerformed(ActionEvent e) {
        dialog.dispose();
      }
    }));
    mainPanel.setOnOk(new Runnable() {
      public void run() {
        onOk(mainPanel, selectedCell, dialog);
      }
    });

    dialog.add(mainPanel, BorderLayout.CENTER);
    dialog.add(buttonPanel, BorderLayout.SOUTH);
    dialog.setSize(200, 400);
    EditorComponent editorComponent = selectedCell.getEditor();
    dialog.setLocation((editorComponent.getWidth() - dialog.getWidth()) / 2,
      (editorComponent.getHeight() - dialog.getHeight()) / 2);
    dialog.setVisible(true);
  }

  private void onOk(SmartActionUIPanel mainPanel, EditorCell selectedCell, JDialog dialog) {
    mainPanel.fillActionContext();
    execute(selectedCell);
    dialog.dispose();
  }
}
