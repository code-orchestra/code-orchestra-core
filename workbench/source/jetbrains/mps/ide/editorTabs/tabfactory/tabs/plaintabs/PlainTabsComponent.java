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
package jetbrains.mps.ide.editorTabs.tabfactory.tabs.plaintabs;

import com.intellij.ide.DataManager;
import com.intellij.openapi.Disposable;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.actionSystem.IdeActions;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Disposer;
import com.intellij.ui.PrevNextActionsDescriptor;
import com.intellij.ui.TabbedPaneWrapper.AsJBTabs;
import com.intellij.ui.tabs.JBTabs;
import jetbrains.mps.ide.editorTabs.EditorTabComparator;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.editorTabs.tabfactory.NodeChangeCallback;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.BaseTabsComponent;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.CreateModeCallback;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.apache.commons.lang.ObjectUtils;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.BorderLayout;
import java.awt.Color;
import java.util.*;

public class PlainTabsComponent extends BaseTabsComponent {
  private List<PlainEditorTab> myRealTabs = new ArrayList<PlainEditorTab>();
  private AsJBTabs myJbTabs;
  private EditorTabDescriptor myLastEmptyTab = null;

  private final Disposable myJbTabsDisposable = new Disposable() {
    public void dispose() {
    }
  };

  public PlainTabsComponent(SNodePointer baseNode, Set<EditorTabDescriptor> possibleTabs, JComponent editor, NodeChangeCallback callback, boolean showGrayed, CreateModeCallback createModeCallback) {
    super(baseNode, possibleTabs, editor, callback, showGrayed, createModeCallback);

    DataContext dataContext = DataManager.getInstance().getDataContext(myEditor);
    Project project = PlatformDataKeys.PROJECT.getData(dataContext);

    PrevNextActionsDescriptor navigation = new PrevNextActionsDescriptor(IdeActions.ACTION_NEXT_EDITOR_TAB, IdeActions.ACTION_PREVIOUS_EDITOR_TAB);
    myJbTabs = new AsJBTabs(project, SwingConstants.BOTTOM, navigation, myJbTabsDisposable);
    decorate(myJbTabs.getTabs());

    getComponent().add(myJbTabs.getTabs().getComponent(), BorderLayout.CENTER);

    updateTabs();

    myJbTabs.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            int index = myJbTabs.getSelectedIndex();
            PlainEditorTab tab = myRealTabs.get(index);
            SNodePointer np = tab.getNode();
            SNode node = np == null ? null : np.getNode();

            if (node != null) {
              myLastEmptyTab = null;
              onNodeChange(node);
            } else {
              myLastEmptyTab = tab.getTab();
              enterCreateMode(myLastEmptyTab);
            }
          }
        });
      }
    });
  }

  public void setLastNode(SNodePointer node) {
    //not to make infinite recursion when tab is clicked
    if (ObjectUtils.equals(node, getLastNode())) return;

    super.setLastNode(node);
    selectNodeTab();
  }

  public void dispose() {
    Disposer.dispose(myJbTabsDisposable);
    super.dispose();
  }

  private void decorate(JBTabs jbTabs) {
    jbTabs.getPresentation()
      .setPaintBorder(0, 0, 0, 0)
      .setAdjustBorders(true)
      .setGhostsAlwaysVisible(true);
  }

  protected void updateTabs() {
    myRealTabs.clear();
    myJbTabs.removeAll();

    ArrayList<EditorTabDescriptor> tabs = new ArrayList<EditorTabDescriptor>(myPossibleTabs);
    Collections.sort(tabs, new EditorTabComparator());

    Map<EditorTabDescriptor, List<SNode>> newContent = updateDocumentsAndNodes();

    //todo sort nodes inside aspect
    JLabel fill = new JLabel("");
    for (EditorTabDescriptor tab : tabs) {
      List<SNode> nodes = newContent.get(tab);
      if (nodes != null) {
        for (SNode node : nodes) {
          myRealTabs.add(new PlainEditorTab(new SNodePointer(node), tab));
          myJbTabs.addTab(node.getPresentation(), IconManager.getIconFor(node), fill, "");
        }
      } else if (myShowGrayed) {
        myRealTabs.add(new PlainEditorTab(null, tab));
        myJbTabs.addTab(tab.getTitle(), fill);
        myJbTabs.setForegroundAt(myJbTabs.getTabCount() - 1, Color.GRAY);
      }
    }
  }

  private void selectNodeTab() {
    for (PlainEditorTab t : myRealTabs) {
      if (t.getNode() != null && t.getNode().equals(getLastNode())) {
        myJbTabs.setSelectedIndex(myRealTabs.indexOf(t));
        return;
      }
    }
    for (PlainEditorTab t : myRealTabs) {
      if (t.getNode() == null && t.getTab().equals(myLastEmptyTab)) {
        myJbTabs.setSelectedIndex(myRealTabs.indexOf(t));
        return;
      }
    }
  }

  protected void nextTab() {
    int i = myJbTabs.getSelectedIndex();
    if (i < myJbTabs.getTabCount() - 1) {
      myJbTabs.setSelectedIndex(i + 1);
    }
  }

  protected void prevTab() {
    int i = myJbTabs.getSelectedIndex();
    if (i > 0) {
      myJbTabs.setSelectedIndex(i - 1);
    }
  }

  protected boolean checkNodeRemoved(SNodePointer node) {
    if (myBaseNode.equals(node)) return false; //will be closed by idea
    for (PlainEditorTab tab : myRealTabs) {
      if (ObjectUtils.equals(tab.getNode(), node)) {
        onNodeChange(myBaseNode.getNode());
        return true;
      }
    }
    return false;
  }
}
