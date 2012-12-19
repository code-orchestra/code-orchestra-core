package codeOrchestra.flex.processors.variableDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;

/**
 * @author Anton.I.Neverov
 */
public class TopLevelConstantDeclarationProcessor extends VariableDeclarationProcessor {

  public TopLevelConstantDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseVariableNode createVariableNode() {
    return new VariableNode(nameNode);
  }

}
