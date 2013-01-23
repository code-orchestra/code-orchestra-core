package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.ActualArgumentInfoNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ActualArgumentInfoProcessor extends ExcludedNodeProcessor {

  private ExpressionNodeBase expression;

  public ActualArgumentInfoProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("expression")) {
      if (child.getChildCount() != 0) {
        expression = processChild(child, ExpressionNodeBase.class);
      }
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (expression == null) {
      return new ActualArgumentInfoNode();
    }
    return expression;
  }

}
