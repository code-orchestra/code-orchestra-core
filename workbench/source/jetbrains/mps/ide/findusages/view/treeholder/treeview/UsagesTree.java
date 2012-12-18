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
package jetbrains.mps.ide.findusages.view.treeholder.treeview;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.keymap.KeymapManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.util.SystemInfo;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowType;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.findusages.view.UsagesViewTool;
import jetbrains.mps.ide.findusages.view.treeholder.tree.DataNode;
import jetbrains.mps.ide.findusages.view.treeholder.tree.DataTree;
import jetbrains.mps.ide.findusages.view.treeholder.tree.TextOptions;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.BaseNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.ModelNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.ModuleNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.tree.nodedatatypes.NodeNodeData;
import jetbrains.mps.ide.findusages.view.treeholder.treeview.path.PathItemRole;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextMPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.AbstractAction;
import javax.swing.JPopupMenu;
import javax.swing.KeyStroke;
import javax.swing.event.TreeExpansionEvent;
import javax.swing.event.TreeExpansionListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.TreePath;
import java.awt.event.*;
import java.util.*;

public class UsagesTree extends MPSTree {
  private static final String COMMAND_OPEN_NODE_IN_PROJECT = "open_node_in_project";
  private static final String COMMAND_OPEN_NODE_IN_TREE = "open_node_in_tree";
  private static final String COMMAND_INCLUDE = "include";
  private static final String COMMAND_EXCLUDE = "exclude";

  private DataTree myContents = new DataTree();
  private HashSet<PathItemRole> myResultPathProvider = new HashSet<PathItemRole>();

  private boolean myAdditionalInfoNeeded;
  private boolean myShowSearchedNodes;
  private boolean myGroupSearchedNodes;
  private boolean myShowPopupMenu;
  private int myIsAdjusting = 0;
  private boolean myAutoscroll = false;
  private Project myProject;

  public UsagesTree(Project project) {
    myProject = project;
    myAdditionalInfoNeeded = false;

    myResultPathProvider.add(PathItemRole.ROLE_MAIN_RESULTS);
    myResultPathProvider.add(PathItemRole.ROLE_TARGET_NODE);

    setRootVisible(false);

    getInputMap().put(KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), COMMAND_OPEN_NODE_IN_PROJECT);
    getInputMap().put(KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0), COMMAND_OPEN_NODE_IN_PROJECT);
    getInputMap().put(KeyStroke.getKeyStroke(KeyEvent.VK_F1, InputEvent.ALT_MASK), COMMAND_OPEN_NODE_IN_TREE);

    KeyStroke deleteKeyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_DELETE, 0);
    getInputMap().put(deleteKeyStroke, COMMAND_EXCLUDE);
    if (SystemInfo.isMac) {
      //KeyStroke insertKeyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_INSERT, 0);
      //getInputMap().put(insertKeyStroke, COMMAND_INCLUDE);
    } else {
      KeyStroke insertKeyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_INSERT, 0);
      getInputMap().put(insertKeyStroke, COMMAND_INCLUDE);
    }

    addTreeExpansionListener(new TreeExpansionListener() {
      public void treeExpanded(TreeExpansionEvent event) {
        BaseNodeData data = ((UsagesTreeNode) event.getPath().getLastPathComponent()).getUserObject().getData();
        data.setExpanded(true);
      }

      public void treeCollapsed(TreeExpansionEvent event) {
        BaseNodeData data = ((UsagesTreeNode) event.getPath().getLastPathComponent()).getUserObject().getData();
        data.setExpanded(false);
      }
    });

    getActionMap().put(COMMAND_OPEN_NODE_IN_PROJECT, new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        openCurrentNodeLink(false, !isUnstableWindow());
      }
    });

    getActionMap().put(COMMAND_OPEN_NODE_IN_TREE, new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        openCurrentNodeLink(true, !isUnstableWindow());
      }
    });

    getActionMap().put(COMMAND_EXCLUDE, new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        setCurrentNodesExclusion(true);
      }
    });

    getActionMap().put(COMMAND_INCLUDE, new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        setCurrentNodesExclusion(false);
      }
    });

    addTreeSelectionListener(new TreeSelectionListener() {
      public void valueChanged(TreeSelectionEvent e) {
        if (myAutoscroll) {
          openNewlySelectedNodeLink(e, false, false);
        }
      }
    });

    addMouseListener(new MouseAdapter() {
      public void mouseClicked(MouseEvent e) {
        if (e.getClickCount() == 2 && e.getButton() == MouseEvent.BUTTON1) {
          openCurrentNodeLink(false, true);
        }
      }
    });
  }

  public void startAdjusting() {
    myIsAdjusting++;
  }

  public void finishAdjusting() {
    myIsAdjusting--;
    rebuildLater();
  }

  public void rebuildNow() {
    if (!ThreadUtils.isEventDispatchThread()) {
      throw new IllegalStateException("Can't use this outside of EDT");
    }

    UsagesTree.super.rebuildNow();
    int i;
    for (i = 0; i < getRootNode().getChildCount(); i++) {
      Object[] path = {getRootNode(), getRootNode().getChildAt(i)};
      TreePath treePath = new TreePath(path);
      expandPath(treePath);
    }
  }

  public void setContents(DataTree contents, Set<PathItemRole> pathProvider) {
    myContents = contents;
    myResultPathProvider.clear();
    myResultPathProvider.addAll(pathProvider);
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public void setContents(DataTree contents) {
    myContents = contents;
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public void setResultPathProvider(Set<PathItemRole> resultPathProvider) {
    myResultPathProvider.clear();
    myResultPathProvider.addAll(resultPathProvider);
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public void setAdditionalInfoNeeded(boolean additionalInfoNeeded) {
    myAdditionalInfoNeeded = additionalInfoNeeded;
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public boolean isAdditionalInfoNeeded() {
    return myAdditionalInfoNeeded;
  }

  public void setShowSearchedNodes(boolean showSearchedNodes) {
    myShowSearchedNodes = showSearchedNodes;
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public boolean isShowSearchedNodes() {
    return myShowSearchedNodes;
  }

  public void setGroupSearchedNodes(boolean groupSearchedNodes) {
    myGroupSearchedNodes = groupSearchedNodes;
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public boolean isGroupSearchedNodes() {
    return myGroupSearchedNodes;
  }

  public boolean isShowPopupMenu() {
    return myShowPopupMenu;
  }

  public void setShowPopupMenu(boolean showPopupMenu) {
    myShowPopupMenu = showPopupMenu;
  }

  public void setAll(DataTree contents, HashSet<PathItemRole> pathProvider) {
    myContents = contents;
    myResultPathProvider = pathProvider;
    if (myIsAdjusting == 0) {
      rebuildLater();
    }
  }

  public void expandResults() {
    expandAll(getResultsNode());
  }

  public void collapseResults() {
    int i;
    for (i = 0; i < getResultsNode().getChildCount(); i++) {
      collapseAll((UsagesTreeNode) getResultsNode().getChildAt(i));
    }
  }

  protected UsagesTreeNode rebuild() {
    return ModelAccess.instance().runReadAction(new Computable<UsagesTreeNode>() {
      public UsagesTreeNode compute() {
        UsagesTreeNode root = new UsagesTreeNode("");
        if (myShowSearchedNodes) {
          HashSet<PathItemRole> searchedNodesPathProvider = new HashSet<PathItemRole>();
          searchedNodesPathProvider.add(PathItemRole.ROLE_MAIN_SEARCHED_NODES);

          DataNode searchedNodesRoot = myContents.getTreeRoot().getChildren().get(0);
          if (searchedNodesRoot.containsNodes(NodeNodeData.class)) {
            if (myGroupSearchedNodes) {
              searchedNodesPathProvider.add(PathItemRole.ROLE_ROOT);
              searchedNodesPathProvider.add(PathItemRole.ROLE_ROOT_TO_TARGET_NODE);
            }
            searchedNodesPathProvider.add(PathItemRole.ROLE_TARGET_NODE);
          } else if (searchedNodesRoot.containsNodes(ModelNodeData.class)) {
            if (myGroupSearchedNodes) {
              searchedNodesPathProvider.add(PathItemRole.ROLE_MODULE);
            }
            searchedNodesPathProvider.add(PathItemRole.ROLE_MODEL);
          } else {
            searchedNodesPathProvider.add(PathItemRole.ROLE_MODULE);
          }
          root.add(buildTree(searchedNodesRoot, searchedNodesPathProvider));
        }
        root.add(buildTree(myContents.getTreeRoot().getChildren().get(1), myResultPathProvider));

        return root;
      }
    });
  }

  //this is not recursive
  //use only for top-level nodes
  private UsagesTreeNode buildTree(DataNode root, HashSet<PathItemRole> nodeCategories) {
    List<UsagesTreeNode> children = buildSubtreeStructure(root, nodeCategories);
    assert children.size() == 1;

    UsagesTreeNode child = children.get(0);

    mergeChildren(children);
    buildCounters(child);
    sortByCaption(children);
    setUIProperties(child);
    makeNodesHTML(child);

    return child;
  }

  private void sortByCaption(List<UsagesTreeNode> children) {
    Collections.sort(children, new Comparator<UsagesTreeNode>() {
      private boolean isIgnored(UsagesTreeNode node) {
        Object idObject = node.getUserObject().getData().getIdObject();
        if (idObject instanceof SNode) {
          SNode nodeObject = (SNode) idObject;
          return !nodeObject.isRoot();
        }
        return false;
      }

      public int compare(UsagesTreeNode o1, UsagesTreeNode o2) {
        if (isIgnored(o1) || isIgnored(o2)) return 0;
        String s1 = o1.getUserObject().getData().getPlainText();
        String s2 = o2.getUserObject().getData().getPlainText();
        return s1.compareTo(s2);
      }
    });
    for (UsagesTreeNode child : children) {
      sortByCaption(child.internalGetChildren());
    }
  }

  private List<UsagesTreeNode> buildSubtreeStructure(DataNode root, HashSet<PathItemRole> nodeCategories) {
    List<UsagesTreeNode> children = new ArrayList<UsagesTreeNode>();
    for (DataNode child : root.getChildren()) {
      children.addAll(buildSubtreeStructure(child, nodeCategories));
    }

    BaseNodeData data = root.getData();
    if (nodeCategories.contains(data.getRole())) {
      UsagesTreeNode node = new UsagesTreeNode("");
      node.setNodeIdentifier(data.getPlainText());
      node.setUserObject(root);

      for (UsagesTreeNode child : children) {
        node.add(child);
      }
      children.clear();
      children.add(node);
    }
    return children;
  }

  private int buildCounters(UsagesTreeNode root) {
    int num = 0;
    for (UsagesTreeNode child : root.internalGetChildren()) {
      num += buildCounters(child);
    }

    root.setSubresultsCount(num);

    if (root.getUserObject().getData().isResultNode()) {
      num++;
    }

    return num;
  }

  private void mergeChildren(List<UsagesTreeNode> children) {
    List<UsagesTreeNode> mergedChildren = new ArrayList<UsagesTreeNode>();

    Map<Object, UsagesTreeNode> childMap = new LinkedHashMap<Object, UsagesTreeNode>();
    for (UsagesTreeNode child : children) {
      Object additionID = child.getUserObject().getData().getIdObject();
      if (additionID == null) {
        //we don't know what to do in the case of deleted nodes, so we won't merge them
        mergedChildren.add(child);
      } else {
        UsagesTreeNode addToNode = childMap.get(additionID);
        if (addToNode == null) {
          childMap.put(additionID, child);
        } else {
          List<UsagesTreeNode> addition = new ArrayList<UsagesTreeNode>(child.internalGetChildren());
          for (UsagesTreeNode additionChild : addition) {
            addToNode.add(additionChild);
          }
        }
      }
    }
    mergedChildren.addAll(childMap.values());

    for (UsagesTreeNode child : mergedChildren) {
      mergeChildren(child.internalGetChildren());
    }

    children.clear();
    children.addAll(mergedChildren);
  }

  private void setUIProperties(UsagesTreeNode root) {
    BaseNodeData data = root.getUserObject().getData();

    root.setIcon(data.getIcon());

    String invalid = data.isInvalid() ? "<font color=red>[Invalid]</font> " : "";
    String caption = data.getText(new TextOptions(myAdditionalInfoNeeded, !root.isLeaf(), root.getSubresultsCount()));
    if (data.isExcluded()) {
      root.setText(invalid + "<font color=gray><s>" + caption + "</s></font>");
    } else {
      root.setText(invalid + caption);
    }

    int i;
    for (i = 0; i < root.getChildCount(); i++) {
      setUIProperties((UsagesTreeNode) root.getChildAt(i));
    }
  }

  private void makeNodesHTML(UsagesTreeNode root) {
    root.setText("<html>" + root.getText() + "</html>");
    int i;
    for (i = 0; i < root.getChildCount(); i++) {
      UsagesTreeNode child = (UsagesTreeNode) root.getChildAt(i);
      makeNodesHTML(child);
    }
  }

  public UsagesTreeNode getCurrentNode() {
    return (UsagesTreeNode) super.getCurrentNode();
  }

  public UsagesTreeNode[] getCurrentNodes() {
    return getSelectedNodes(UsagesTreeNode.class, null);
  }

  private void setCurrentNodesExclusion(boolean isExcluded) {
    List<DataNode> nodes = new ArrayList<DataNode>();
    for (UsagesTreeNode node : getCurrentNodes()) {
      nodes.add(node.getUserObject());
    }
    myContents.setExcluded(nodes, isExcluded);
  }

  private void setCurrentNodesOnlyExclusion() {
    myContents.setExcluded(Arrays.asList(myContents.getTreeRoot()), true);
    setCurrentNodesExclusion(false);
  }

  protected JPopupMenu createPopupMenu(MPSTreeNode node) {
    if (!myShowPopupMenu) return null;

    BaseAction includeAction = new BaseAction("Include") {
      {
        String keyStroke = "INSERT";
        KeyboardShortcut shortcut = new KeyboardShortcut(KeyStroke.getKeyStroke(keyStroke), null);
        KeymapManager.getInstance().getKeymap(KeymapManager.DEFAULT_IDEA_KEYMAP).addShortcut(getActionId(), shortcut);
      }

      @Override
      protected boolean isEnabledInASView() {
        return true;
      }

      public void doExecute(AnActionEvent e, Map<String, Object> _params) {
        setCurrentNodesExclusion(false);
        e.getInputEvent().consume();
      }
    };
    BaseAction excludeAction = new BaseAction("Exclude") {
      {
        String keyStroke = "DELETE";
        KeyboardShortcut shortcut = new KeyboardShortcut(KeyStroke.getKeyStroke(keyStroke), null);
        KeymapManager.getInstance().getKeymap(KeymapManager.DEFAULT_IDEA_KEYMAP).addShortcut(getActionId(), shortcut);
      }

      @Override
      protected boolean isEnabledInASView() {
        return true;
      }

      public void doExecute(AnActionEvent e, Map<String, Object> _params) {
        setCurrentNodesExclusion(true);
        e.getInputEvent().consume();
      }
    };
    BaseAction includeSelectedOnlyAction = new BaseAction("Include selected only") {

      @Override
      protected boolean isEnabledInASView() {
        return true;
      }

      public void doExecute(AnActionEvent e, Map<String, Object> _params) {
        setCurrentNodesOnlyExclusion();
        e.getInputEvent().consume();
      }
    };

    DefaultActionGroup group = ActionUtils.groupFromActions(includeAction, excludeAction, includeSelectedOnlyAction);
    return ActionManager.getInstance().createActionPopupMenu(ActionPlaces.UNKNOWN, group).getComponent();
  }

  private void openCurrentNodeLinkIfLeaf(boolean inProject, boolean focus) {
    UsagesTreeNode treeNode = getCurrentNode();
    if (treeNode == null) return;
    if (treeNode.getChildCount() != 0) return;
    goByNodeLink(treeNode, inProject, focus);
  }

  private void openCurrentNodeLink(boolean inProjectIfPossible, boolean focus) {
    UsagesTreeNode treeNode = getCurrentNode();
    if (treeNode == null) return;
    goByNodeLink(treeNode, inProjectIfPossible, focus);
  }

  private void openNewlySelectedNodeLink(TreeSelectionEvent e, boolean inProjectIfPossible, boolean focus) {
    TreePath path = e.getNewLeadSelectionPath();
    if (path == null) return;
    Object treeNode = path.getLastPathComponent();
    if (!(treeNode instanceof UsagesTreeNode)) return;
    goByNodeLink((UsagesTreeNode) treeNode, inProjectIfPossible, focus);
  }

  private void goByNodeLink(final UsagesTreeNode treeNode, final boolean inProjectIfPossible, final boolean focus) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        if (treeNode.getUserObject() == null) {
          return;
        }

        BaseNodeData data = treeNode.getUserObject().getData();
        if (data instanceof NodeNodeData) {
          SNode node = ((NodeNodeData) data).getNode();
          if (node != null) {
            if (!inProjectIfPossible) {
              navigateToNode(node, focus);
            } else {
              navigateInTree(node, focus);
            }
          } else {
            LOG.info("clicked node was deleted");
          }
        } else if (data instanceof ModelNodeData) {
          SModel model = (SModel) ((ModelNodeData) data).getIdObject();
          if (model != null) {
            navigateInTree(model, focus);
          }
        } else if (data instanceof ModuleNodeData) {
          IModule module = (IModule) ((ModuleNodeData) data).getIdObject();
          if (module != null) {
            navigateInTree(module, focus);
          }
        }
      }
    });
  }

  private boolean isAliveResultNode(DataNode node) {
    return node.getData().isResultNode() && !node.getData().isInvalid();
  }

  private UsagesTreeNode findFirstResultInSubtree(UsagesTreeNode root, boolean includeRoot) {
    assert root != null;

    if (includeRoot && isAliveResultNode(root.getUserObject())) return root;

    for (MPSTreeNode node : root) {
      UsagesTreeNode result = findFirstResultInSubtree(((UsagesTreeNode) node), true);
      if (result != null) return result;
    }

    return null;
  }

  private UsagesTreeNode findLastResultInSubtree(UsagesTreeNode root, boolean includeRoot) {
    assert root != null;

    List<MPSTreeNode> children = new ArrayList<MPSTreeNode>();
    for (MPSTreeNode node : root) {
      children.add(node);
    }
    Collections.reverse(children);

    for (MPSTreeNode node : children) {
      UsagesTreeNode result = findLastResultInSubtree(((UsagesTreeNode) node), true);
      if (result != null) return result;
    }

    if (includeRoot && isAliveResultNode(root.getUserObject())) return root;

    return null;
  }

  public UsagesTreeNode findNextResult(UsagesTreeNode fromNode) {
    assert fromNode != null;

    //trying to do step into
    UsagesTreeNode node = findFirstResultInSubtree(fromNode, false);
    if (node != null) return node;

    //go up until reach a node with child to the right from that we came from and try to get results from its children, the go to parent...
    UsagesTreeNode current = fromNode;
    while (true) {
      UsagesTreeNode parent = (UsagesTreeNode) current.getParent();
      if (parent == getResultsNode().getParent()) return null;

      //step into next children of that parent
      int nextIndex = parent.getIndex(current) + 1;
      while (nextIndex < parent.getChildCount()) {
        UsagesTreeNode firstResult = findFirstResultInSubtree((UsagesTreeNode) parent.getChildAt(nextIndex), true);
        if (firstResult != null) return firstResult;
        nextIndex++;
      }
      current = parent;
    }
  }

  public UsagesTreeNode findPrevResult(UsagesTreeNode fromNode) {
    assert fromNode != null;

    //go up until reach a node with child result nodes to the left from that we came from or find a result node
    UsagesTreeNode current = fromNode;
    while (true) {
      UsagesTreeNode parent = (UsagesTreeNode) current.getParent();
      if (parent == null) return null;

      //step into prev children of that parent
      int prevIndex = parent.getIndex(current) - 1;
      while (prevIndex >= 0) {
        UsagesTreeNode lastResult = findLastResultInSubtree((UsagesTreeNode) parent.getChildAt(prevIndex), true);
        if (lastResult != null) return lastResult;
        prevIndex--;
      }

      DataNode userObject = parent.getUserObject();
      if (userObject != null) {
        if (isAliveResultNode(userObject)) return parent;
      }

      current = parent;
    }
  }

  public void navigateToNextResult() {
    if (getResultsNode().getChildCount() == 0) return;

    UsagesTreeNode currentNode = getCurrentNode();
    UsagesTreeNode next;

    if (currentNode == null || !inResults(currentNode)) {
      next = findFirstResultInSubtree((UsagesTreeNode) getResultsNode().getChildAt(0), false);
    } else {
      next = findNextResult(currentNode);
    }

    if (next != null) {
      setCurrentNode(next);
      openCurrentNodeLink(false, !isUnstableWindow());
    }
  }

  public void navigateToPreviousResult() {
    boolean noResults = getResultsNode().getChildCount() == 0;

    UsagesTreeNode searchedNodesNode = getSearchedNodesNode();
    boolean noSearchedNodes = searchedNodesNode == null || searchedNodesNode.getChildCount() == 0;

    if (noResults && noSearchedNodes) return;

    UsagesTreeNode currentNode = getCurrentNode();
    UsagesTreeNode next;

    if (currentNode == null) {
      next = findLastResultInSubtree((UsagesTreeNode) getResultsNode().getChildAt(0), false);
    } else {
      next = findPrevResult(currentNode);
    }

    if (next != null) {
      setCurrentNode(next);
      openCurrentNodeLink(false, !isUnstableWindow());
    }
  }

  private boolean inResults(UsagesTreeNode node) {
    if (node == getRootNode()) return false;
    if (node == getResultsNode()) return true;
    return inResults((UsagesTreeNode) node.getParent());
  }

  public void navigateToNode(final SNode node, boolean focus) {
    ModuleContext context = ModuleContext.create(node, myProject);
    boolean select = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        return !node.isRoot();
      }
    });
    myProject.getComponent(MPSEditorOpener.class).openNode(node, context, focus, select);
  }

  private void navigateInTree(Object o, boolean focus) {
    // RF-272
    IProjectPane projectPane = ViewUtils.getCurrentPane(myProject);
    if (projectPane == null) {
      return;
    }

    if (o instanceof SNode) {
      projectPane.selectNode((SNode) o, focus);
    } else if (o instanceof SModel) {
      projectPane.selectModel(((SModel) o).getModelDescriptor(), focus);
    } else if (o instanceof IModule) {
      projectPane.selectModule((IModule) o, focus);
    } else {
      throw new IllegalArgumentException();
    }
  }

  private UsagesTreeNode getResultsNode() {
    int index = myShowSearchedNodes ? 1 : 0;
    return (UsagesTreeNode) getRootNode().getChildAt(index);
  }

  @Nullable
  private UsagesTreeNode getSearchedNodesNode() {
    if (!myShowSearchedNodes) return null;
    return (UsagesTreeNode) getRootNode().getChildAt(0);
  }

  public void setAutoscroll(boolean autoscroll) {
    myAutoscroll = autoscroll;
    if (getCurrentNode() != null) {
      goByNodeLink(getCurrentNode(), false, false);
    }
  }

  public boolean isAutoscroll() {
    return myAutoscroll;
  }

  public class UsagesTreeNode extends TextMPSTreeNode {
    private int mySubresultsCount = 0;

    public UsagesTreeNode(String text) {
      super(text, null);
    }

    public int getSubresultsCount() {
      return mySubresultsCount;
    }

    public void setSubresultsCount(int subresultsCount) {
      mySubresultsCount = subresultsCount;
    }

    public void setChildAt(int i, UsagesTreeNode child) {
      children.set(i, child);
    }

    @Override
    public DataNode getUserObject() {
      return (DataNode) super.getUserObject();
    }

    public boolean isLeaf() {
      return getChildCount() == 0;
    }

    List<UsagesTreeNode> internalGetChildren() {
      if (children == null) return new ArrayList<UsagesTreeNode>();
      return children;
    }
  }

  protected boolean isUnstableWindow() {
    //todo this is a workaround for IDEA bug. Remove the method when they'll fix isAutoHide()
    return getToolWindow().isAutoHide() || getToolWindow().getType() == ToolWindowType.SLIDING;
  }

  private ToolWindow getToolWindow() {
    return myProject.getComponent(UsagesViewTool.class).getToolWindow();
  }
}
