package codeOrchestra.flex.processors.reference;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class ReferenceNodeProcessor extends SNodeProcessor {

  public ReferenceNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      // TODO: Looks like node with reference to INamedConcept creates "name" property during generation
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    String targetNodeName = getNameByReference(myNode, "reference");
    return new IdentifierNode(targetNodeName);
  }

}
