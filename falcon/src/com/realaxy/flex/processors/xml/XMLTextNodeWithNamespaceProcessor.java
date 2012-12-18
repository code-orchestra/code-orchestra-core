package codeOrchestra.flex.processors.xml;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.XMLContainerNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public abstract class XMLTextNodeWithNamespaceProcessor extends XmlTextNodeProcessor {

  protected String namespace;

  public XMLTextNodeWithNamespaceProcessor(SNode node) {
    super(node);
    textValueName = "name";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("xmlNamespace")) {
        if (namespace != null) {
          throw new SNodeProcessorException();
        }
        if (!nodeIsInstanceOfConcept(child, Concept.XmlNamespace)) {
          throw new SNodeProcessorException();
        }
        namespace = child.getProperty("name");
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected void fillTextContent(XMLContainerNode xmlContainerNode) {
    if (namespace != null) {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, namespace + ":" + textValue));
    } else {
      xmlContainerNode.addPart(new LiteralNode(LiteralType.XML, textValue));
    }
  }

}
