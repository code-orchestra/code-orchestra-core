package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;
import org.apache.flex.compiler.internal.tree.as.LanguageIdentifierNode;

/**
 * @author Anton.I.Neverov
 */
public class SuperConstructorInvocationProcessor extends AbstractFunctionCallProcessor {

  public SuperConstructorInvocationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    // SuperConstructorInvocation havs no reference to a function, it is just super keyword
    LanguageIdentifierNode nameNode = LanguageIdentifierNode.buildSuper();
    FunctionCallNode functionCallNode = new FunctionCallNode(nameNode);
    nameNode.setParent(functionCallNode);
    return functionCallNode;
  }

}
