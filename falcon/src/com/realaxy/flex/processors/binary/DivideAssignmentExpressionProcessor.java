package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorDivisionAssignmentNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class DivideAssignmentExpressionProcessor extends BinaryExpressionProcessor {

  public DivideAssignmentExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorDivisionAssignmentNode(null, leftOperand, rightOperand);
  }

}
