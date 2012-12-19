package codeOrchestra.flex.processors.unary;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class UnaryExpressionProcessor extends SNodeProcessor {

  protected String childName = "nodeToWrap";
  ExpressionNodeBase expression;

  public UnaryExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals(childName)) {
      if (expression != null) {
        throw new SNodeProcessorException();
      }
      expression = processChild(child, ExpressionNodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  protected abstract FixedChildrenNode createOperator();

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (expression == null) {
      throw new SNodeProcessorException();
    }

    FixedChildrenNode result = createOperator();
    expression.setParent(result);

    return result;
  }

}
