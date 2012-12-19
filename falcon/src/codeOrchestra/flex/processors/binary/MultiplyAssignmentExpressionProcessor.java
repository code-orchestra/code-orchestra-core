package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorMultiplicationAssignmentNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class MultiplyAssignmentExpressionProcessor extends BinaryExpressionProcessor {

  public MultiplyAssignmentExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorMultiplicationAssignmentNode(null, leftOperand, rightOperand);
  }

}
