package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.ASTNodeID;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of StatementProcessor that processes empty MPS statement
 * Instances of this class must not be attached to the tree
 */
public class EmptyStatementNode extends NodeBase {

  @Override
  public ASTNodeID getNodeID() {
    return null;
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

}
