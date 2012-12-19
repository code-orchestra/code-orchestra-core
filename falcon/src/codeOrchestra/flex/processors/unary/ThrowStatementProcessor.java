package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.ThrowNode;

/**
 * @author Anton.I.Neverov
 */
public class ThrowStatementProcessor extends UnaryExpressionProcessor {

  public ThrowStatementProcessor(SNode node) {
    super(node);
    childName = "throwable";
  }

  @Override
  protected FixedChildrenNode createOperator() {
    ThrowNode throwNode = new ThrowNode(null);
    throwNode.setStatementExpression(expression);
    return throwNode;
  }

}
