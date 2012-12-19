package codeOrchestra.flex.processors.binary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.MemberAccessExpressionNode;

/**
 * @author Anton.I.Neverov
 */
public class E4XDescendantsExpressionProcessor extends DotExpressionProcessor {

  public E4XDescendantsExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ExpressionNodeBase createOperator() {
    return new MemberAccessExpressionNode(leftOperand, new ASToken(ASTokenTypes.TOKEN_OPERATOR_DESCENDANT_ACCESS, -1, -1, -1, -1, ".."), rightOperand);
  }

}
