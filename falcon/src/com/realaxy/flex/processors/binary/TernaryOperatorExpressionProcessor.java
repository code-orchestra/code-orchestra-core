package codeOrchestra.flex.processors.binary;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.TernaryOperatorNode;

/**
 * @author Anton.I.Neverov
 */
public class TernaryOperatorExpressionProcessor extends BinaryExpressionProcessor {

  private ExpressionNodeBase condition;

  public TernaryOperatorExpressionProcessor(SNode node) {
    super(node);
    leftOperandName = "ifTrue";
    rightOperandName = "ifFalse";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("condition")) {
        condition = processChild(child, ExpressionNodeBase.class);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    TernaryOperatorNode ternaryOperatorNode = new TernaryOperatorNode(null, condition, leftOperand, rightOperand);
    condition.setParent(ternaryOperatorNode);
    return ternaryOperatorNode;
  }

}
