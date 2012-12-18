package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class WithAccessOperationExpressionProcessor extends TransparentNodeProcessor {

  public WithAccessOperationExpressionProcessor(SNode node) {
    super(node);
    childName = "operation";
  }

}
