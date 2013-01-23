package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class OperationExpressionSurroundWrapperProcessor extends TransparentNodeProcessor{

  public OperationExpressionSurroundWrapperProcessor(SNode node) {
    super(node);
    childName = "wrappedNode";
  }

}
