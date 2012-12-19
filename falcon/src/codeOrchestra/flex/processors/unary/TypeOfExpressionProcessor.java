package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorTypeOfNode;

/**
 * @author Anton.I.Neverov
 */
public class TypeOfExpressionProcessor extends UnaryExpressionProcessor {

  public TypeOfExpressionProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorTypeOfNode(null, expression);
  }

}
