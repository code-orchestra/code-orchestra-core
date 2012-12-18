package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.FunctionObjectNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class AnonymousFunctionProcessor extends FunctionDeclarationProcessor {

  public AnonymousFunctionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected void check() throws SNodeProcessorException {
    if (returnType == null) {
      throw new SNodeProcessorException();
    }
    functionName = "";
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new FunctionObjectNode((FunctionNode) super.createNode());
  }
}
