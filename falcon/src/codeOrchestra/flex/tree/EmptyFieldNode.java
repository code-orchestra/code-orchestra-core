package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.internal.tree.as.VariableNode;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of processor that processes field empty line
 * Instances of this class must not be attached to the tree
 */
public class EmptyFieldNode extends VariableNode {

  public EmptyFieldNode(IdentifierNode nameNode) {
    super(nameNode);
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

}
