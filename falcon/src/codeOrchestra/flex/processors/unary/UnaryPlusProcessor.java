package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorPlusNode;

/**
 * @author Anton.I.Neverov
 */
public class UnaryPlusProcessor extends UnaryExpressionProcessor {

  public UnaryPlusProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorPlusNode(null, expression);
  }

}
