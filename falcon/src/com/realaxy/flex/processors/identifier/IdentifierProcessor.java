package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class IdentifierProcessor extends SNodeProcessor {

  protected String identifierName;

  public IdentifierProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (identifierName == null) {
      throw new SNodeProcessorException();
    }

    return new IdentifierNode(identifierName);
  }

}
