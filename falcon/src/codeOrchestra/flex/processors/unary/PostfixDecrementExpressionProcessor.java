package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorPostDecrementNode;

/**
 * @author Anton.I.Neverov
 */
public class PostfixDecrementExpressionProcessor extends UnaryExpressionProcessor {

  public PostfixDecrementExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorPostDecrementNode(null, expression);
  }

}
