package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class LocalFunctionDeclarationProcessor extends FunctionDeclarationProcessor {

  public LocalFunctionDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected void check() throws SNodeProcessorException {
    if (functionName == null || returnType == null) {
      throw new SNodeProcessorException();
    }
  }

}
