package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorNotEqualNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class NotEqualsExpressionProcessor extends BinaryExpressionProcessor {

  public NotEqualsExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorNotEqualNode(null, leftOperand, rightOperand);
  }

}
