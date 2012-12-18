package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class XmlTextNodeProcessor extends SNodeProcessor {

  protected String textValueName = "value";
  protected String textValue;
  protected NodeBase templateContent;

  public XmlTextNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals(textValueName)) {
      textValue = value;
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("smodelAttribute")) {
      if (templateContent != null) {
        throw new SNodeProcessorException();
      }
      templateContent = processChild(child, NodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  protected void fillTextContent(XMLContainerNode xmlContainerNode) {
    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, textValue));
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    if (templateContent != null) {
      xmlContainerNode.addPart(templateContent);
    } else if (textValue != null) {
      fillTextContent(xmlContainerNode);
    }

    return xmlContainerNode;
  }

}
