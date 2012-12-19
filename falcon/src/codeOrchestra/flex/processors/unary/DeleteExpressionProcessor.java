package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorDeleteNode;

/**
 * @author Anton.I.Neverov
 */
public class DeleteExpressionProcessor extends UnaryExpressionProcessor {

  public DeleteExpressionProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorDeleteNode(null, expression);
  }

}
