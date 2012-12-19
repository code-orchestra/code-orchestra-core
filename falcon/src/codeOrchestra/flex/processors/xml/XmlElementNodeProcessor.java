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
public class XmlElementNodeProcessor extends SNodeProcessor {

  private XMLContainerNode nameContainer;
  private List<XMLContainerNode> attrsContainer = new ArrayList<XMLContainerNode>();
  private XMLContainerNode bodyContainer;

  public XmlElementNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("xmlName")) {
      if (nameContainer != null) {
        throw new SNodeProcessorException();
      }
      nameContainer = processChild(child, XMLContainerNode.class);
    } else if (childRole.equals("attrs")) {
      attrsContainer.add(processChild(child, XMLContainerNode.class));
    } else if (childRole.equals("body")) {
      if (bodyContainer != null) {
        throw new SNodeProcessorException();
      }
      bodyContainer = processChild(child, XMLContainerNode.class);
    } else if (childRole.equals("xmlName_last")) {
      // Ignore - name will be taken from name node
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (nameContainer == null || nameContainer.isEmpty() || bodyContainer == null) {
      throw new SNodeProcessorException();
    }

    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "<"));
    xmlContainerNode.addParts(nameContainer);

    for (XMLContainerNode attr : attrsContainer) {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, " "));
      xmlContainerNode.addParts(attr);
    }

    if (bodyContainer.isEmpty()) {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, " />"));
    } else {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, ">"));
      xmlContainerNode.addParts(bodyContainer);
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, "</"));
      xmlContainerNode.addParts(nameContainer); // TODO: We add existing objects to the list. Looks like OK for now, but be aware +)
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, ">"));
    }

    return xmlContainerNode;
  }

}
