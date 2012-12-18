package codeOrchestra.flex.processors.variableDeclaration;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.ParameterNode;

/**
 * @author Anton.I.Neverov
 */
public class VarargsParameterProcessor extends VariableDeclarationProcessor {

  public VarargsParameterProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseVariableNode createVariableNode() {
    ParameterNode parameterNode = new ParameterNode(nameNode);
    parameterNode.setIsRestParameter(true);
    parameterNode.setType(null, new IdentifierNode("Array"));
    return parameterNode;
  }

}
