package codeOrchestra.flex.processors.functionDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.GetterNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;

/**
 * @author Anton.I.Neverov
 */
public class InstanceGetterDeclarationProcessor extends FunctionDeclarationProcessor {

  public InstanceGetterDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FunctionNode createFunctionNode(IdentifierNode nameNode) {
    return new GetterNode(null, null, nameNode);
  }

}
