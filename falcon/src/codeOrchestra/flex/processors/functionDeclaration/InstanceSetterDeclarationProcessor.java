package codeOrchestra.flex.processors.functionDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.SetterNode;

/**
 * @author Anton.I.Neverov
 */
public class InstanceSetterDeclarationProcessor extends FunctionDeclarationProcessor {

  public InstanceSetterDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected FunctionNode createFunctionNode(IdentifierNode nameNode) {
    return new SetterNode(null, null, nameNode);
  }

}
