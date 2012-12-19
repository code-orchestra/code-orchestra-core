package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorLessThanEqualsNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class LessThanOrEqualsExpressionProcessor extends BinaryExpressionProcessor {

  public LessThanOrEqualsExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorLessThanEqualsNode(null, leftOperand, rightOperand);
  }

}
