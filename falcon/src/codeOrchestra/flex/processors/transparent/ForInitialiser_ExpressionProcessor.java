package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class ForInitialiser_ExpressionProcessor extends TransparentNodeProcessor {

  public ForInitialiser_ExpressionProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

}
