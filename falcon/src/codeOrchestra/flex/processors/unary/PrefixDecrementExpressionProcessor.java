package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorPreDecrementNode;

/**
 * @author Anton.I.Neverov
 */
public class PrefixDecrementExpressionProcessor extends UnaryExpressionProcessor {

  public PrefixDecrementExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorPreDecrementNode(null, expression);
  }

}
