package codeOrchestra.flex.tree;

import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.ASTNodeID;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 *
 * Node that represents result of processing XML tree
 * Instances of this class must not be attached to the tree
 */
public class XMLContainerNode extends NodeBase {

  private List<NodeBase> parts = new ArrayList<NodeBase>();

  @Override
  public ASTNodeID getNodeID() {
    return null;
  }

  @Override
  public void setParent(NodeBase parent) {
    throw new RuntimeException();
  }

  public void addPart(NodeBase newPart) {
    parts.add(newPart);
  }

  public void addParts(XMLContainerNode otherNode) {
    parts.addAll(otherNode.getParts());
  }

  public List<NodeBase> getParts() {
    return parts;
  }

  public boolean isEmpty() {
    return parts.isEmpty();
  }

}
