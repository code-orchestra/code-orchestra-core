package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class XmlCDATANodeProcessor extends SNodeProcessor {

  private List<XMLContainerNode> nodes = new ArrayList<XMLContainerNode>();

  public XmlCDATANodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("nodes")) {
      nodes.add(processChild(child, XMLContainerNode.class));
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (nodes.isEmpty()) {
      throw new SNodeProcessorException();
    }

    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "<![CDATA["));
    for (XMLContainerNode node : nodes) {
      xmlContainerNode.addParts(node);
    }

    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "]]>"));

    return xmlContainerNode;
  }

}
