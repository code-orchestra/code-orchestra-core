package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorStrictEqualNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class StrictEqualsExpressionProcessor extends BinaryExpressionProcessor {

  public StrictEqualsExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorStrictEqualNode(null, leftOperand, rightOperand);
  }

}
