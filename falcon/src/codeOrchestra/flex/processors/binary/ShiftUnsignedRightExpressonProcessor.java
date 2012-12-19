package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorBitwiseUnsignedRightShiftNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class ShiftUnsignedRightExpressonProcessor extends BinaryExpressionProcessor {

  public ShiftUnsignedRightExpressonProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorBitwiseUnsignedRightShiftNode(null, leftOperand, rightOperand);
  }

}
