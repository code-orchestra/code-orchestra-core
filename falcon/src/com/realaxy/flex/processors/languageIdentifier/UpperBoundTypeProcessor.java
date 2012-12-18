package codeOrchestra.flex.processors.languageIdentifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 *
 * TODO: `? extends Class` is now transformed into *
 */
public class UpperBoundTypeProcessor extends WildCardTypeProcessor {

  public UpperBoundTypeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("bound")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

}
