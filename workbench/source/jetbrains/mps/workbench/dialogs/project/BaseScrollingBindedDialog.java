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

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.smodel.IOperationContext;

import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.HeadlessException;

public abstract class BaseScrollingBindedDialog extends BaseBindedDialog {
  private JPanel myContentPanel;
  private JComponent myMainComponent;

  protected BaseScrollingBindedDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(text, operationContext);
    myContentPanel = new JPanel(new GridBagLayout());
    myMainComponent = ScrollPaneFactory.createScrollPane(myContentPanel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    myMainComponent.setBorder(new EmptyBorder(0, 0, 0, 0));
  }

  public JComponent getMainComponent() {
    return myMainComponent;
  }

  protected void addComponent(JComponent comp, GridBagConstraints c) {
    myContentPanel.add(comp, c);
  }
}
