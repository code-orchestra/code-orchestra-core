package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.ASTNodeID;

import java.util.List;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of OutOfPackageScriptProcessor
 * Instances of this class must not be attached to the tree
 */
public class OutOfPackageScriptNode extends NodeBase {

  private List<NodeBase> statements;

  public OutOfPackageScriptNode(List<NodeBase> statements) {
    this.statements = statements;
  }

  @Override
  public ASTNodeID getNodeID() {
    return null;
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

  public List<NodeBase> getStatements() {
    return statements;
  }

}
