package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorBitwiseNotNode;

/**
 * @author Anton.I.Neverov
 */
public class BitwiseNotExpressionProcessor extends UnaryExpressionProcessor {

  public BitwiseNotExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorBitwiseNotNode(null, expression);
  }

}
