package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorDivisionNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class DivideExpressionProcessor extends BinaryExpressionProcessor {

  public DivideExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorDivisionNode(null, leftOperand, rightOperand);
  }

}
