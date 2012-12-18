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
package jetbrains.mps.debugger.api.ui.tree;

import com.intellij.openapi.actionSystem.DataProvider;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.MPSDataKeys;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.AbstractAction;
import javax.swing.KeyStroke;
import javax.swing.tree.TreePath;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.util.*;

public class VariablesTree extends MPSTree implements DataProvider {
  @NotNull
  private AbstractUiState myUiState;
  private final Project myProject;
  private final IOperationContext myContext;
  private static final String COMMAND_OPEN_NODE_IN_PROJECT = "COMMAND_OPEN_NODE_IN_PROJECT";

  public VariablesTree(Project project, AbstractUiState state) {
    ApplicationManager.getApplication().assertIsDispatchThread();
    myUiState = state;
    myProject = project;
    myContext = ProjectOperationContext.get(project);

    getInputMap().put(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), COMMAND_OPEN_NODE_IN_PROJECT);
    getActionMap().put(COMMAND_OPEN_NODE_IN_PROJECT, new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        AbstractWatchableNode selectedNode = findSelectedNode();
        if (selectedNode != null) {
          selectedNode.openNode(false, true);
        }
      }
    });
    setRootVisible(false);
    setShowsRootHandles(true);
  }

  public void setUiState(@NotNull AbstractUiState uiState) {
    ApplicationManager.getApplication().assertIsDispatchThread();
    myUiState = uiState;
  }

  @Override
  protected MPSTreeNode rebuild() {
    List<IWatchable> watchables = myUiState.getWatchables();

    if (watchables.isEmpty()) {
      TextTreeNode rootNode = new TextTreeNode("");
      TextTreeNode messageNode = new TextTreeNode("No local variables available") {
        @Override
        public boolean isLeaf() {
          return true;
        }
      };
      messageNode.setIcon(jetbrains.mps.ide.messages.Icons.INFORMATION_ICON);
      rootNode.add(messageNode);
      return rootNode;
    }

    MPSTreeNode rootTreeNode = new TextTreeNode("Local Variables");
    rootTreeNode.setTree(this);

    // collecting nodes
    Map<WatchablesCategory, List<IWatchable>> orphanesByCategory =
      new HashMap<WatchablesCategory, List<IWatchable>>();

    Map<WatchablesCategory, Map<SNode, List<IWatchable>>> nodeToVarsMapByCategory =
      new HashMap<WatchablesCategory, Map<SNode, List<IWatchable>>>();

    // Map<SNode, List<IWatchable>> nodeToVarsMap = new LinkedHashMap<SNode, List<IWatchable>>();
    // List<IWatchable> orphanes = new ArrayList<IWatchable>();
    for (IWatchable watchable : watchables) {
      WatchablesCategory category = watchable.getCategory();
      SNode node = watchable.getNode();
      if (node == null) {
        List<IWatchable> orphanes = orphanesByCategory.get(category);
        if (orphanes == null) {
          orphanes = new ArrayList<IWatchable>();
          orphanesByCategory.put(category, orphanes);
        }
        orphanes.add(watchable);
      } else {
        Map<SNode, List<IWatchable>> nodeToVarsMap = nodeToVarsMapByCategory.get(category);
        if (nodeToVarsMap == null) {
          nodeToVarsMap = new LinkedHashMap<SNode, List<IWatchable>>();
          nodeToVarsMapByCategory.put(category, nodeToVarsMap);
        }
        List<IWatchable> watchableList = nodeToVarsMap.get(node);
        if (watchableList == null) {
          watchableList = new ArrayList<IWatchable>();
          nodeToVarsMap.put(node, watchableList);
        }
        watchableList.add(watchable);
      }

    }

    SortedSet<WatchablesCategory> keys = new TreeSet<WatchablesCategory>(orphanesByCategory.keySet());
    keys.addAll(nodeToVarsMapByCategory.keySet());

    for (WatchablesCategory category : keys) {
      List<IWatchable> orphanes = orphanesByCategory.get(category);
      Map<SNode, List<IWatchable>> nodeToVarsMap = nodeToVarsMapByCategory.get(category);
      if (orphanes == null) orphanes = new ArrayList<IWatchable>();
      if (nodeToVarsMap == null) nodeToVarsMap = new HashMap<SNode, List<IWatchable>>();

      // sorting
      List<SNode> nodes = new ArrayList<SNode>();
      nodes.addAll(nodeToVarsMap.keySet());
      Collections.sort(nodes, new ToStringComparator());
      Collections.sort(orphanes, new Comparator<IWatchable>() {
        @Override
        public int compare(IWatchable o1, IWatchable o2) {
          return o1.getName().compareTo(o2.getName());
        }
      });

      // adding nodes
      for (SNode snode : nodeToVarsMap.keySet()) {
        List<IWatchable> watchablesWithNodes = nodeToVarsMap.get(snode);
        if (watchablesWithNodes.size() == 1) {
          IWatchable watchable = watchablesWithNodes.get(0);
          WatchableNode nodeTreeNode = new WatchableNode(myContext, watchable);
          rootTreeNode.add(nodeTreeNode);
        } else {
          NodeTreeNode nodeTreeNode = new NodeTreeNode(myContext, snode);
          for (IWatchable watchable : watchablesWithNodes) {
            nodeTreeNode.add(new WatchableNode(myContext, watchable));
          }
          rootTreeNode.add(nodeTreeNode);
        }
      }

      for (IWatchable watchable : orphanes) {
        rootTreeNode.add(new WatchableNode(myContext, watchable));
      }
    }
    return rootTreeNode;
  }

  @Nullable
  private AbstractWatchableNode findSelectedNode() {
    TreePath selectionPath = getSelectionPath();
    if (selectionPath == null) return null;
    Object selectedNode = selectionPath.getLastPathComponent();
    if (selectedNode instanceof AbstractWatchableNode) {
      return ((AbstractWatchableNode) selectedNode);
    }
    return null;
  }

  @Override
  @Nullable
  public Object getData(@NonNls String dataId) {
    if (dataId.equals(MPSDataKeys.NODE.getName())) {
      AbstractWatchableNode selectedNode = findSelectedNode();
      if (selectedNode != null) {
        return selectedNode.getNode();
      }
    }
    return null;
  }

  public Project getProject() {
    return myProject;
  }
}
