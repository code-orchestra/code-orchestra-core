package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class E4XAttributeNameProcessor extends IdentifierProcessor {

  public E4XAttributeNameProcessor(SNode node) {
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
