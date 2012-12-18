package codeOrchestra.flex.processors.identifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class UndefinedLiteralProcessor extends IdentifierProcessor {

  public UndefinedLiteralProcessor(SNode node) {
    super(node);
    identifierName = "undefined";
  }

}
