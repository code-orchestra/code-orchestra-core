/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
package jetbrains.mps.ide.ui.smodel;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.LogicalViewTree;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.ide.ui.ErrorState;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeNode;
import java.awt.Color;
import java.awt.font.TextAttribute;
import java.util.List;

public class SNodeTreeNode extends MPSTreeNodeEx {
  private static final Logger LOG = Logger.getLogger(SNodeTreeNode.class);

  private boolean presentationInitialized;

  protected boolean myInitialized = false;
  private SNode myNode;
  private String myRole;
  protected Condition<SNode> myCondition;

  public SNodeTreeNode(SNode node, IOperationContext operationContext) {
    this(node, null, operationContext);
  }

  public SNodeTreeNode(SNode node, String role, IOperationContext operationContext) {
    this(node, role, operationContext, Condition.TRUE_CONDITION);
  }

  public SNodeTreeNode(SNode node, String role, IOperationContext operationContext, Condition<SNode> condition) {
    super(operationContext);
    myNode = node;
    myRole = role;
    myCondition = condition;

    if (myNode == null) {
      setNodeIdentifier("null");
    } else {
      setNodeIdentifier(myNode.getId());
    }

    presentationInitialized = true;
  }

  @CodeOrchestraPatch
  public void setCondition(Condition<SNode> condition) {
    myCondition = condition;
  }

  protected final void doUpdatePresentation() {
    if (getSModelModelTreeNode() != null) {
      getSModelModelTreeNode().getDependencyRecorder().rebuild(this, new Runnable() {
        public void run() {
          doUpdatePresentation_internal();
        }
      });
    } else {
      doUpdatePresentation_internal();
    }
  }

  protected void onRemove() {
    super.onRemove();
    if (getSModelModelTreeNode() != null) {
      getSModelModelTreeNode().getDependencyRecorder().remove(this);
    }
  }

  @CodeOrchestraPatch
  protected void doUpdatePresentation_internal() {
    if (myNode.isRoot() && presentationInitialized) {
      // Invalidate cache
      // RF-181
      MPSTree tree = getTree();
      if (tree != null) {
        tree.invalidateTreeCache();
      }
    }

    if (myNode.isDisposed()) {
      return;
    }
    if (hasErrors()) {
      setColor(Color.RED);
    } else {
      setColor(Color.BLACK);
    }
    if (myNode != null) {
      setIcon(IconManager.getIconFor(myNode, !enableLayeredIcon(), enableLayeredIcon())); // RE-1756
    }

    if (SNodeOperations.isUnknown(myNode)) {
      setErrorState(ErrorState.ERROR);
    }
    //if ((SLinkOperations.getTarget(myNode, AttributesRolesUtil.childRoleFromAttributeRole("deprecatedNode"), true) != null)) {
    if (AttributeOperations.getNodeAttribute(myNode, "deprecatedNode") != null) {
      addFontAttribute(TextAttribute.STRIKETHROUGH, TextAttribute.STRIKETHROUGH_ON);
    }

    setText(caclulateNodeTextPresentation());
    setAutoExpandable(myNode != null && !myNode.isRoot());
  }

  protected boolean enableLayeredIcon() {
    return true;
  }

  public SModelTreeNode getSModelModelTreeNode() {
    if (getParent() instanceof SModelTreeNode) {
      return (SModelTreeNode) getParent();
    }

    if (getParent() instanceof SNodeTreeNode) {
      return ((SNodeTreeNode) getParent()).getSModelModelTreeNode();
    }

    if (getParent() instanceof SNodeGroupTreeNode) {
      TreeNode node = getParent();
      while (!(node instanceof SModelTreeNode)) {
        node = node.getParent();
      }
      return (SModelTreeNode) node;
    }

    return null;
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_NODE_ACTIONS);
  }

  public Object getUserObject() {
    return myNode;
  }

  public int getToggleClickCount() {
    return -1;
  }

  public SNode getSNode() {
    return myNode;
  }

  protected void doUpdate() {
    this.removeAllChildren();
    myInitialized = false;
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  protected void doInit() {
    this.removeAllChildren();
    SNode n = getSNode();
    if (n == null) return;

    if (showPropertiesAndReferences()) {
      add(new PropertiesTreeNode(getOperationContext(), n));
      add(new ReferencesTreeNode(getOperationContext(), n));
    }

    List<SNode> children = n.getChildren();
    List<SNode> filteredChildren = CollectionUtil.filter(children, myCondition);
    for (SNode childNode : filteredChildren) {
      SNodeTreeNode child = createChildTreeNode(childNode, childNode.getRole_(), getOperationContext());
      child.myCondition = myCondition;
      add(child);
    }

    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    treeModel.nodeStructureChanged(this);
    myInitialized = true;
  }

  protected SNodeTreeNode createChildTreeNode(SNode childNode, String role, IOperationContext operationContext) {
    SModelTreeNode sModelTreeNode = getSModelModelTreeNode();
    SNodeTreeNode child = sModelTreeNode == null ? new SNodeTreeNode(childNode, role, operationContext)
      : sModelTreeNode.createSNodeTreeNode(childNode, role, operationContext);
    return child;
  }

  private boolean showPropertiesAndReferences() {
    Project project = getOperationContext().getProject();
    return getTree() instanceof LogicalViewTree &&
      ProjectPane.getInstance(project).isShowPropertiesAndReferences();
  }

  public void doubleClick() {
    if (getTree() instanceof NodeEditor) {
      ((NodeEditor) getTree()).editNode(myNode, getOperationContext(), true);
    }
  }

  @Override
  public void autoscroll() {
    super.autoscroll();
    if (getTree() instanceof NodeEditor) {
      ((NodeEditor) getTree()).editNode(myNode, getOperationContext(), false);
    }
  }

  protected SModelDescriptor getModelDescriptor() {
    SNode node = getSNode();
    if (node == null) return null;
    SModelDescriptor md = node.getModel().getModelDescriptor();
    return md;
  }

  private String caclulateNodeTextPresentation() {
    StringBuffer output = new StringBuffer();

    if (myRole != null) {
      output.append(myRole).append(" : ");
    }

    SNode node = getSNode();
    if (node != null) {
      String nodePresentation;
      try {
        nodePresentation = node.getPresentation();
      } catch (Throwable t) {
        nodePresentation = null;
        LOG.error(t);
      }
      String nodeString = nodePresentation;
      output.append(nodeString);
      /*if (myRole != null) {
        String presentation = node.getPresentation();
        if (presentation != null && !presentation.equals(nodeString)) {
          output.append(" [").append(presentation).append("]");
        }
      }*/
    }

    return output.toString();
  }

  public boolean hasErrors() {
    return false;
  }
}
