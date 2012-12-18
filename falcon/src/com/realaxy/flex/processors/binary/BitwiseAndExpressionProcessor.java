package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorBitwiseAndNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class BitwiseAndExpressionProcessor extends BinaryExpressionProcessor {

  public BitwiseAndExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorBitwiseAndNode(null, leftOperand, rightOperand);
  }

}
