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
package jetbrains.mps.ide.projectPane.logicalview.highlighting;

import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.DumbService.DumbModeListener;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Disposer;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.projectPane.logicalview.ProjectPaneTree;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.listeners.ListenersFactory;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.listeners.ListenersFactory.NodeListeners;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor.ProjectPaneModifiedMarker;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor.ProjectPaneTreeErrorChecker;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor.ProjectPaneTreeGenStatusUpdater;
import jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor.TreeNodeVisitor;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeListener;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;

import java.util.HashMap;
import java.util.Map;

public class ProjectPaneTreeHighlighter {
  private ProjectPaneTreeGenStatusUpdater myGenStatusVisitor = new ProjectPaneTreeGenStatusUpdater();
  private MyMPSTreeNodeListener myNodeListener = new MyMPSTreeNodeListener();
  private ProjectPaneTree myTree;

  public void init(ProjectPaneTree tree) {
    myTree = tree;

    myTree.addTreeNodeListener(myNodeListener);

    MessageBusConnection connection = myTree.getProject().getMessageBus().connect();
    Disposer.register(myTree, connection);
    connection.subscribe(DumbService.DUMB_MODE, new MyDumbModeListener());
  }

  public void dispose() {
    myTree.removeTreeNodeListener(myNodeListener);
  }

  private class MyDumbModeListener implements DumbModeListener {
    public void enteredDumbMode() {
      if (!ProjectPane.isShowGenStatus()) return;
      visit(myTree.getRootNode(), myGenStatusVisitor);
    }

    public void exitDumbMode() {
      if (!ProjectPane.isShowGenStatus()) return;

      Project p = myTree.getProject();
      if (p.isDisposed()) return;

      visit(myTree.getRootNode(), myGenStatusVisitor);
    }

    private void visit(MPSTreeNode rootNode, TreeNodeVisitor visitor) {
      //todo width-first will be better because we normally see upper level first
      visitor.visitNode(rootNode);
      for (MPSTreeNode node : rootNode) {
        visit(node, visitor);
      }
    }
  }

  private class MyMPSTreeNodeListener implements MPSTreeNodeListener {
    private Map<MPSTreeNode, NodeListeners> myListeners = new HashMap<MPSTreeNode, NodeListeners>();

    public void treeNodeAdded(MPSTreeNode treeNode, MPSTree tree) {
      NodeListeners l = ListenersFactory.createListenersFor(treeNode);
      if (l == null) return;
      myListeners.put(treeNode, l);
      l.startListening();
    }

    public void treeNodeRemoved(MPSTreeNode treeNode, MPSTree tree) {
      NodeListeners l = myListeners.remove(treeNode);
      if (l == null) return;
      l.stopListening();
    }

    public void treeNodeUpdated(MPSTreeNode treeNode, MPSTree tree) {

    }
  }
}
