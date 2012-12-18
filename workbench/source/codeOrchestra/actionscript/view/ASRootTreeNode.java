package codeOrchestra.actionscript.view;

import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;

import javax.swing.tree.DefaultTreeModel;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASRootTreeNode extends SNodeTreeNode {

  public ASRootTreeNode(final SNode node, String role, IOperationContext operationContext, Condition<SNode> condition) {
    super(node, role, operationContext, condition);
  }

  protected void doInit() {
    this.removeAllChildren();

    SNode node = getSNode();
    if (node == null) return;

    List<SNode> children = null;
    boolean customStructure = false;

    // RE-1478 - try ICustomStructureView
    if (node.isRoot()) {
      if (node.isInstanceOfConcept(Concepts.ICUSTOM_STRUCTURE_VIEW_CONCEPT)) {
        children = NodeUtils.getStructureList(node);
        customStructure = true;
      }
    }
    if (children == null) {
      children = node.getChildren();
    }

    // Filter the children
    List<SNode> filteredChildren;
    if (customStructure) {
      filteredChildren = children;
    } else {
      filteredChildren = CollectionUtil.filter(children, myCondition);
    }

    for (SNode childNode : filteredChildren) {
      if (childNode == null) {
        continue;
      }

      SNodeTreeNode child = new SNodeTreeNode(childNode, childNode.getRole_(), getOperationContext()) {
        public boolean isLeaf() {
          return true; // RE-1404
        }
      };
      child.setCondition(myCondition);
      add(child);
    }

    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    treeModel.nodeStructureChanged(this);
    myInitialized = true;
  }

}
