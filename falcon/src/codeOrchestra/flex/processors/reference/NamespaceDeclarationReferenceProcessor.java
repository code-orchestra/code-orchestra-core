package codeOrchestra.flex.processors.reference;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.NamespaceIdentifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class NamespaceDeclarationReferenceProcessor extends ReferenceNodeProcessor {

  public NamespaceDeclarationReferenceProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    String targetNodeName = getNameByReference(myNode, "reference");
    return new NamespaceIdentifierNode(targetNodeName);
  }

}
