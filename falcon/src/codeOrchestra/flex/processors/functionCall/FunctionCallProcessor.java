package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;

/**
 * @author Anton.I.Neverov
 */
public class FunctionCallProcessor extends AbstractFunctionCallProcessor {

  protected String nameExpressionName = "expression";
  protected ExpressionNodeBase nameExpression;

  public FunctionCallProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals(nameExpressionName)) {
        if (nameExpression != null) {
          throw new SNodeProcessorException();
        }
        nameExpression = processChild(child, ExpressionNodeBase.class);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    // FunctionCall has no reference to a function, instead it has child in role "expression"
    if (nameExpression == null) {
      throw new SNodeProcessorException();
    }

    FunctionCallNode functionCallNode = new FunctionCallNode(nameExpression);
    nameExpression.setParent(functionCallNode);

    return functionCallNode;
  }

}
