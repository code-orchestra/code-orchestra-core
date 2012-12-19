package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorLogicalNotNode;

/**
 * @author Anton.I.Neverov
 */
public class NotExpressionProcessor extends UnaryExpressionProcessor {

  public NotExpressionProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorLogicalNotNode(null, expression);
  }

}
