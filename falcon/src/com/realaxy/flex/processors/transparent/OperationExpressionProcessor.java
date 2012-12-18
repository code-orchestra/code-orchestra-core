package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class OperationExpressionProcessor extends TransparentNodeProcessor {

  public OperationExpressionProcessor(SNode node) {
    super(node);
    childName = "operation";
  }

}
