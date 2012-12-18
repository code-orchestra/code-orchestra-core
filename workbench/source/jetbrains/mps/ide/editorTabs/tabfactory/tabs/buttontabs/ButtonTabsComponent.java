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
package jetbrains.mps.ide.editorTabs.tabfactory.tabs.buttontabs;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.*;
import jetbrains.mps.ide.editorTabs.EditorTabComparator;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.editorTabs.tabfactory.NodeChangeCallback;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.BaseTabsComponent;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.JComponent;
import java.awt.BorderLayout;
import java.awt.Component;
import java.util.*;

public class ButtonTabsComponent extends BaseTabsComponent {
  private List<ButtonEditorTab> myRealTabs = new ArrayList<ButtonEditorTab>();
  private JComponent myToolbar = null;

  public ButtonTabsComponent(SNodePointer baseNode, Set<EditorTabDescriptor> possibleTabs, JComponent editor, NodeChangeCallback callback, boolean showGrayed) {
    super(baseNode, possibleTabs, editor, callback, showGrayed, null);
    updateTabs();
  }

  public Component getComponentForTabIndex(int index) {
    return myToolbar.getComponent(index);
  }

  protected void updateTabs() {
    myRealTabs.clear();

    ArrayList<EditorTabDescriptor> tabs = new ArrayList<EditorTabDescriptor>(myPossibleTabs);
    Collections.sort(tabs, new EditorTabComparator());

    Map<EditorTabDescriptor, List<SNode>> newContent = updateDocumentsAndNodes();
    for (EditorTabDescriptor tab : tabs) {
      List<SNode> nodes = newContent.get(tab);
      if (nodes != null) {
        myRealTabs.add(new ButtonEditorTab(this, new NodeChangeCallback() {
          public void changeNode(SNode newNode) {
            onNodeChange(newNode);
          }
        }, myRealTabs.size(), tab, myBaseNode));
      }
    }

    DefaultActionGroup group = new DefaultActionGroup();
    for (ButtonEditorTab tab : myRealTabs) {
      group.add(tab.getAction(myEditor));
    }
    if (myToolbar != null) {
      getComponent().remove(myToolbar);
    }
    ActionToolbar actionToolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, true);
    actionToolbar.setLayoutPolicy(ActionToolbar.WRAP_LAYOUT_POLICY);
    myToolbar = actionToolbar.getComponent();
    getComponent().add(myToolbar, BorderLayout.CENTER);
  }

  protected void nextTab() {
    for (ButtonEditorTab tab : myRealTabs) {
      if (!isCurrent(tab)) continue;
      int index = myRealTabs.indexOf(tab);
      if (index == myRealTabs.size() - 1) {
        performTabAction(0);
        return;
      }

      performTabAction(index + 1);
      return;
    }
  }

  public boolean isCurrent(ButtonEditorTab tab) {
    boolean current = false;
    for (SNode aspect : tab.getDescriptor().getNodes(myBaseNode.getNode())) {
      if (getLastNode() == null) continue;
      if (aspect.getContainingRoot().equals(getLastNode().getNode())) {
        current = true;
        break;
      }
    }
    return current;
  }

  protected void prevTab() {
    for (ButtonEditorTab tab : myRealTabs) {
      if (!isCurrent(tab)) continue;

      int index = myRealTabs.indexOf(tab);
      if (index == 0) {
        performTabAction(myRealTabs.size() - 1);
        return;
      }

      performTabAction(index - 1);
      return;
    }
  }

  private void performTabAction(final int index) {
    final DataContext context = DataManager.getInstance().getDataContext(getComponent());
    AnActionEvent event = ActionUtils.createEvent(ActionPlaces.UNKNOWN, context);

    myRealTabs.get(index).getAction(myEditor).actionPerformed(event);
  }

  protected boolean checkNodeRemoved(SNodePointer node) {
    if (myBaseNode.equals(node)) return false; //will be closed by idea

    if (getLastNode().equals(node)) {
      onNodeChange(myBaseNode.getNode());
      return true;
    }

    return false;
  }
}
