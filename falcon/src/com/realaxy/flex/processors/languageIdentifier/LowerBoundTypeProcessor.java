package codeOrchestra.flex.processors.languageIdentifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 *
 * TODO: `? super` is now transformed into *
 */
public class LowerBoundTypeProcessor extends WildCardTypeProcessor {

  public LowerBoundTypeProcessor(SNode node) {
    super(node);
  }

}
