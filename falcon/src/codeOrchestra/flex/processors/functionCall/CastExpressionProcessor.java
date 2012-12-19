package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;

/**
 * @author Anton.I.Neverov
 */
public class CastExpressionProcessor extends FunctionCallProcessor {

  public CastExpressionProcessor(SNode node) {
    super(node);
    actualArgumentsName = "expression";
    nameExpressionName = "type";
  }

  @Override
  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    if (actualArguments.size() != 1) {
      throw new SNodeProcessorException();
    }

    return super.createFunctionCall();
  }

}
