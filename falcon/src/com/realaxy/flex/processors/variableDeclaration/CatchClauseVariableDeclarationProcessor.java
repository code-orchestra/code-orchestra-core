package codeOrchestra.flex.processors.variableDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.ParameterNode;

/**
 * @author Anton.I.Neverov
 */
public class CatchClauseVariableDeclarationProcessor extends VariableDeclarationProcessor {

  public CatchClauseVariableDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseVariableNode createVariableNode() {
    return new ParameterNode(nameNode);
  }

}
