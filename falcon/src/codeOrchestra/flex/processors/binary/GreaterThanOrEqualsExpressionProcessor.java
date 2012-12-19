package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorGreaterThanEqualsNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class GreaterThanOrEqualsExpressionProcessor extends BinaryExpressionProcessor {

  public GreaterThanOrEqualsExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorGreaterThanEqualsNode(null, leftOperand, rightOperand);
  }

}
