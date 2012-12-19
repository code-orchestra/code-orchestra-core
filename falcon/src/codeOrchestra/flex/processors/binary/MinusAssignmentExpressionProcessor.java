package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorMinusAssignmentNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class MinusAssignmentExpressionProcessor extends BinaryExpressionProcessor {

  public MinusAssignmentExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorMinusAssignmentNode(null, leftOperand, rightOperand);
  }

}
