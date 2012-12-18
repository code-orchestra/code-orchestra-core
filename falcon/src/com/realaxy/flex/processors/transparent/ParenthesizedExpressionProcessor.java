package codeOrchestra.flex.processors.transparent;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ParenthesizedExpressionProcessor extends TransparentNodeProcessor {

  public ParenthesizedExpressionProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    IASNode node = super.createNode();
    if (!(node instanceof ExpressionNodeBase)) {
      throw new SNodeProcessorException();
    }
    ((ExpressionNodeBase) node).setHasParenthesis(true);
    return node;
  }

}
