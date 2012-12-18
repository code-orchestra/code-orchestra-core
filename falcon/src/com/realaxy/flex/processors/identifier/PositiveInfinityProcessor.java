package codeOrchestra.flex.processors.identifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class PositiveInfinityProcessor extends IdentifierProcessor {

  public PositiveInfinityProcessor(SNode node) {
    super(node);
    identifierName = "Infinity";
  }

}
