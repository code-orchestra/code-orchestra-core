package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class XmlNodeListProcessor extends SNodeProcessor {

  private List<XMLContainerNode> nodesContainer = new ArrayList<XMLContainerNode>();

  public XmlNodeListProcessor(SNode node) {
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
      nodesContainer.add(processChild(child, XMLContainerNode.class));
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    XMLContainerNode xmlContainerNode = new XMLContainerNode();

    for (XMLContainerNode node : nodesContainer) {
      xmlContainerNode.addParts(node);
    }

    return xmlContainerNode;
  }

}
