package codeOrchestra.flex.processors.binary;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorMultiplicationNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class MultiplyExpressionProcessor extends BinaryExpressionProcessor {

  public MultiplyExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("rightExpression")) {
        // Ignore
      } else if (childRole.equals("leftExpression")) {
        // Ignore
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new BinaryOperatorMultiplicationNode(null, leftOperand, rightOperand);
  }

}
