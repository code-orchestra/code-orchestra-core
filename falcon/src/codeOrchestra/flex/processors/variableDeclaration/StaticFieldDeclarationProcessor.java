package codeOrchestra.flex.processors.variableDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.ModifierNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;

/**
 * @author Anton.I.Neverov
 */
public class StaticFieldDeclarationProcessor extends VariableDeclarationWithCommentProcessor {

  public StaticFieldDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseVariableNode createVariableNode() {
    VariableNode variableNode = new VariableNode(nameNode);
    variableNode.addModifier(new ModifierNode("static"));
    return variableNode;
  }

}
