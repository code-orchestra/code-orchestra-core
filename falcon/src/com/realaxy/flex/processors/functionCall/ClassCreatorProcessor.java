package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;
import org.apache.flex.compiler.internal.tree.as.TypedExpressionNode;

/**
 * @author Anton.I.Neverov
 */
public class ClassCreatorProcessor extends AbstractFunctionCallProcessor {

  private ExpressionNodeBase parameter;

  public ClassCreatorProcessor(SNode node) {
    super(node);
    referenceName = "classConcept";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("typeParameter")) {
        if (parameter != null) { // Our AST permits multiple parameters, but Falcon AST does not
          throw new SNodeProcessorException();
        }
        parameter = processChild(child, ExpressionNodeBase.class);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    FunctionCallNode functionCall = super.createFunctionCall();

    if (parameter != null) {
      ExpressionNodeBase nameNode = functionCall.getNameNode();
      TypedExpressionNode typedExpressionNode = new TypedExpressionNode(nameNode, parameter);
      nameNode.setParent(typedExpressionNode);
      parameter.setParent(typedExpressionNode);
      functionCall.replaceChild(nameNode, typedExpressionNode);
    }

    return functionCall;
  }

}
