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

import com.intellij.openapi.actionSystem.ActionToolbar;
import jetbrains.mps.smodel.IOperationContext;

import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import java.awt.Component;
import java.awt.Container;
import java.awt.GridBagLayout;
import java.awt.HeadlessException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class BaseTabbedBindedDialog extends BaseBindedDialog {
  private JTabbedPane myTabbedPane;
  private Map<String, JComponent> myComponents;
  private List<String> myTabOrder;

  protected BaseTabbedBindedDialog(String text, IOperationContext operationContext) throws HeadlessException {
    super(text, operationContext);
    myComponents = new HashMap<String, JComponent>();
    myTabOrder = new ArrayList<String>();
  }

  public JComponent getMainComponent() {
    if (myTabbedPane == null) {
      myTabbedPane = new JTabbedPane();
      for (String tabName : myTabOrder) {
        myTabbedPane.addTab(tabName, myComponents.get(tabName));
      }
    }
    return myTabbedPane;
  }

  protected void addComponent(String tabName, JComponent comp, ConstraintsType c) {
    if (!myTabOrder.contains(tabName)) {
      myTabOrder.add(tabName);
    }

    JComponent tab = myComponents.get(tabName);
    if (tab == null) tab = new JPanel(new GridBagLayout());
    tab.add(comp, c.create(tab.getComponentCount()));
    myComponents.put(tabName, tab);
  }

  private static void setReadOnly(Component comp) {
    comp.setEnabled(false);
    if (comp instanceof ActionToolbar) {  // temp workaround to disable ActionToolbar component also
      ((ActionToolbar) comp).getComponent().getParent().remove(((ActionToolbar) comp).getComponent());
    }
    if (comp instanceof Container) {
      for (Component c : ((Container) comp).getComponents()) {
        setReadOnly(c);
      }
    }
  }

  public void addTab(DialogTab tab) {
    for (ComponentDescriptor d : tab.getComponents()) {
      if (d.isReadOnly())  setReadOnly(d.getComponent());
      addComponent(tab.getName(), d.getComponent(), d.getConstraints());
    }
  }

  public static class DialogTab {
    private String myName;
    private List<ComponentDescriptor> myComponents = new ArrayList<ComponentDescriptor>();

    public DialogTab(String name) {
      myName = name;
    }

    public void addComponent(ComponentDescriptor d) {
      myComponents.add(d);
    }

    public String getName() {
      return myName;
    }

    public List<ComponentDescriptor> getComponents() {
      return myComponents;
    }
  }

  public static class ComponentDescriptor {
    private JComponent myComponent;
    private ConstraintsType myConstraints;
    private boolean myReadOnly = false;

    public JComponent getComponent() {
      return myComponent;
    }

    public void setComponent(JComponent component) {
      myComponent = component;
    }

    public ConstraintsType getConstraints() {
      return myConstraints;
    }

    public void setConstraints(ConstraintsType constraints) {
      myConstraints = constraints;
    }

    public boolean isReadOnly() {
      return myReadOnly;
    }

    public void setReadOnly() {
      myReadOnly = true;
    }
  }
}
