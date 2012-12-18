package codeOrchestra.flex.processors.binary;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.DynamicAccessNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class AccessExpressionProcessor extends BinaryExpressionProcessor {

  public AccessExpressionProcessor(SNode node) {
    super(node);
    leftOperandName = "expression";
    rightOperandName = "access";
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    DynamicAccessNode dynamicAccessNode = new DynamicAccessNode(leftOperand);
    dynamicAccessNode.setRightOperandNode(rightOperand);
    return dynamicAccessNode;
  }

}
