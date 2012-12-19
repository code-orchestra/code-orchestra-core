package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class XmlAttributeValueProcessor extends XmlTextNodeProcessor {

  public XmlAttributeValueProcessor(SNode node) {
    super(node);
  }

  @Override
  protected void fillTextContent(XMLContainerNode xmlContainerNode) {
    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "\"" + textValue + "\""));
  }

}
