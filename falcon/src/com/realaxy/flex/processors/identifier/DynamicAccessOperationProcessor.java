package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class DynamicAccessOperationProcessor extends IdentifierProcessor {

  public DynamicAccessOperationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      identifierName = value;
    } else {
      return false;
    }
    return true;
  }

}
