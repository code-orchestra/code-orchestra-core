package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorBitwiseUnsignedRightShiftAssignmentNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class BitwiseUnsignedRightShiftAssignmentProcessor extends BinaryExpressionProcessor {

  public BitwiseUnsignedRightShiftAssignmentProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorBitwiseUnsignedRightShiftAssignmentNode(null, leftOperand, rightOperand);
  }

}
