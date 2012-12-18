package codeOrchestra.flex.processors.binary;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;
import org.apache.flex.compiler.internal.tree.as.MemberAccessExpressionNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class DotExpressionProcessor extends BinaryExpressionProcessor {

  public DotExpressionProcessor(SNode node) {
    super(node);
    leftOperandName = "operand";
    rightOperandName = "operation";
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new MemberAccessExpressionNode(leftOperand, null, rightOperand);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    MemberAccessExpressionNode node = (MemberAccessExpressionNode) super.createNode();

    if (!(rightOperand instanceof FunctionCallNode)) {
      return node;
    }

    // TODO: Handle foo.bar[baz] in the same way?
    /*
    our tree for foo.bar() is
    .
      foo
        ()
          bar

    falcon tree is
    ()
      .
        foo
        bar

    so we fix it here
    */
    ExpressionNodeBase nameNode = ((FunctionCallNode) rightOperand).getNameNode();
    ((FunctionCallNode) rightOperand).replaceChild(nameNode, node);
    node.setRightOperandNode(nameNode);
    nameNode.setParent(node);
    node.setParent(rightOperand);
    rightOperand.setParent(null); // It will be set in the outer processor
    return rightOperand;
  }
}
