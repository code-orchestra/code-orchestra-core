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
public class XmlCommentNodeProcessor extends SNodeProcessor {

  private XMLContainerNode xmlList;

  public XmlCommentNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("body")) {
      if (xmlList != null) {
        throw new SNodeProcessorException();
      }
      xmlList = processChild(child, XMLContainerNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "<!-- "));
    xmlContainerNode.addParts(xmlList);
    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, " -->"));

    return xmlContainerNode;
  }

}
