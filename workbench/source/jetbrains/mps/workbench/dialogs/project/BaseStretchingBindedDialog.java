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
package jetbrains.mps.workbench.dialogs.project;

import jetbrains.mps.smodel.IOperationContext;

import javax.swing.JComponent;
import javax.swing.JPanel;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.HeadlessException;

public abstract class BaseStretchingBindedDialog extends BaseBindedDialog {
  private JPanel myContentPanel;

  protected BaseStretchingBindedDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(text, operationContext);
    myContentPanel = new JPanel(new GridBagLayout());
  }

  public JComponent getMainComponent() {
    return myContentPanel;
  }

  protected void addComponent(JComponent comp, ConstraintsType c) {
    myContentPanel.add(comp, c.create(myContentPanel.getComponentCount()));
  }

  //todo remove this method
  protected void addComponent(JComponent comp, GridBagConstraints c) {
    myContentPanel.add(comp, c);
  }
}
