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
public class XmlProcessingInstructionNodeProcessor extends SNodeProcessor {

  private String instructionName;
  private List<XMLContainerNode> attrsContainer = new ArrayList<XMLContainerNode>();

  public XmlProcessingInstructionNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      instructionName = value;
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("attrs")) {
      attrsContainer.add(processChild(child, XMLContainerNode.class));
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (instructionName == null) {
      throw new SNodeProcessorException();
    }

    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "<?" + instructionName));
    for (XMLContainerNode attr : attrsContainer) {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, " "));
      xmlContainerNode.addParts(attr);
    }
    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "?>"));

    return xmlContainerNode;
  }
}
