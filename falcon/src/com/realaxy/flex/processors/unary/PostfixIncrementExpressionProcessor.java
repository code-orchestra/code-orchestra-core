package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorPostIncrementNode;

/**
 * @author Anton.I.Neverov
 */
public class PostfixIncrementExpressionProcessor extends UnaryExpressionProcessor {

  public PostfixIncrementExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorPostIncrementNode(null, expression);
  }

}
