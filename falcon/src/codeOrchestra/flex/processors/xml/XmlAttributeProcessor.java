package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class XmlAttributeProcessor extends SNodeProcessor {

  private XMLContainerNode nameNode;
  private XMLContainerNode valueNode;

  public XmlAttributeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("attributeName")) {
      if (nameNode != null) {
        throw new SNodeProcessorException();
      }
      nameNode = processChild(child, XMLContainerNode.class);
    } else if (childRole.equals("attributeValue")) {
      if (valueNode != null) {
        throw new SNodeProcessorException();
      }
      valueNode = processChild(child, XMLContainerNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (nameNode == null || valueNode == null) {
      throw new SNodeProcessorException();
    }

    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    xmlContainerNode.addParts(nameNode);
    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "="));
    xmlContainerNode.addParts(valueNode);

    return xmlContainerNode;
  }

}
