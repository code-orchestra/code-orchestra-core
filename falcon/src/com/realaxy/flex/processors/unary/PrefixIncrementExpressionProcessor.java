package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorPreIncrementNode;

/**
 * @author Anton.I.Neverov
 */
public class PrefixIncrementExpressionProcessor extends UnaryExpressionProcessor {

  public PrefixIncrementExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorPreIncrementNode(null, expression);
  }

}
