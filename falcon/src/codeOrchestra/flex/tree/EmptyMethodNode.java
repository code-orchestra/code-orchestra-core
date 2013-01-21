package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.internal.tree.as.parts.IFunctionContentsPart;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of processor that processes method empty line
 * Instances of this class must not be attached to the tree
 */
public class EmptyMethodNode extends FunctionNode {

  public EmptyMethodNode(IdentifierNode node, IFunctionContentsPart part) {
    super(node, part);
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

}
