package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorPlusAssignmentNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class PlusAssignmentExpressionProcessor extends BinaryExpressionProcessor {

  public PlusAssignmentExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorPlusAssignmentNode(null, leftOperand, rightOperand);
  }

}
