package codeOrchestra.flex.tree;

import codeOrchestra.flex.processors.SNodeProcessorException;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of DynamicClassifierTypeProcessor that processes dynamic without name
 * i.e. class MyClazz extends none implements none
 * Instances of this class must not be attached to the tree
 */
public class EmptyIdentifierNode extends IdentifierNode {

  private EmptyIdentifierNode(String name) {
    super(name);
  }

  public EmptyIdentifierNode() {
    this(null);
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

}
