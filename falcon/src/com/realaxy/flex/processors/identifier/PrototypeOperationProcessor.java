package codeOrchestra.flex.processors.identifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class PrototypeOperationProcessor extends IdentifierProcessor {

  public PrototypeOperationProcessor(SNode node) {
    super(node);
    identifierName = "prototype";
  }

}
