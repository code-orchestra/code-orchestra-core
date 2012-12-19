package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.ASTNodeID;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of ConfigVariableExpressionProcessor
 * Instances of this class must not be attached to the tree
 */
public class ConfigVariableNode extends NodeBase {

  private boolean enabled;

  public ConfigVariableNode(boolean enabled) {
    this.enabled = enabled;
  }

  @Override
  public ASTNodeID getNodeID() {
    return null;
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

  public boolean isEnabled() {
    return enabled;
  }

}
