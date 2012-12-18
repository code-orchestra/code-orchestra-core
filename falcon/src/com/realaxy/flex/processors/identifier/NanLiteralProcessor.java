package codeOrchestra.flex.processors.identifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class NanLiteralProcessor extends IdentifierProcessor {

  public NanLiteralProcessor(SNode node) {
    super(node);
    identifierName = "NaN";
  }

}
