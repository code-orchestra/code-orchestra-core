package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorBitwiseLeftShiftNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class ShiftLeftExpressionProcessor extends BinaryExpressionProcessor {

  public ShiftLeftExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorBitwiseLeftShiftNode(null, leftOperand, rightOperand);
  }

}
