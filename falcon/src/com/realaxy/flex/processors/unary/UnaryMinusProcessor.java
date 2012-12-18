package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorMinusNode;

/**
 * @author Anton.I.Neverov
 */
public class UnaryMinusProcessor extends UnaryExpressionProcessor {

  public UnaryMinusProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorMinusNode(null, expression);
  }

}
