package codeOrchestra.flex.processors.identifier;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class ArgumentsExpressionProcessor extends IdentifierProcessor {

  public ArgumentsExpressionProcessor(SNode node) {
    super(node);
    identifierName = "arguments";
  }

}
