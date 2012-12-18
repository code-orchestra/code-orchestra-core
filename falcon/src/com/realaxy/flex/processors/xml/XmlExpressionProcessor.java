package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.internal.tree.as.XMLLiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class XmlExpressionProcessor extends SNodeProcessor {

  private XMLContainerNode xmlContainer;

  public XmlExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("xmlNode")) {
      if (xmlContainer != null) {
        throw new SNodeProcessorException();
      }
      xmlContainer = processChild(child, XMLContainerNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (xmlContainer == null) {
      throw new SNodeProcessorException();
    }

    XMLLiteralNode xmlLiteralNode = new XMLLiteralNode();
    ContainerNode contentsNode = xmlLiteralNode.getContentsNode();

    List<NodeBase> concatenatedParts = new ArrayList<NodeBase>();

    List<NodeBase> parts = xmlContainer.getParts();
    for (int i = 0; i < parts.size(); i++) {
      NodeBase first = parts.get(i);
      if (!(first instanceof LiteralNode && ((LiteralNode) first).getLiteralType() == LiteralType.XML)) {
        concatenatedParts.add(first);
        continue;
      }
      ArrayList<LiteralNode> nodesToConcatenate = new ArrayList<LiteralNode>();
      nodesToConcatenate.add((LiteralNode) first);
      while (++i < parts.size()) {
        NodeBase next = parts.get(i);
        if (next instanceof LiteralNode && ((LiteralNode) next).getLiteralType() == LiteralType.XML) {
          nodesToConcatenate.add((LiteralNode) next);
        } else {
          i--; // Start new FOR loop from current node
          break;
        }
      }
      StringBuilder builder = new StringBuilder();
      for (LiteralNode node : nodesToConcatenate) {
        builder.append(node.getValue());
      }
      concatenatedParts.add(new LiteralNode(LiteralType.XML, builder.toString()));
    }

    for (NodeBase part : concatenatedParts) {
      contentsNode.addItem(part);
      part.setParent(contentsNode);
    }

    return xmlLiteralNode;
  }

}
