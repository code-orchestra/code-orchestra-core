package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.ModifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class StaticMethodDeclarationProcessor extends FunctionDeclarationProcessor {

  public StaticMethodDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    FunctionNode functionNode = (FunctionNode) super.createNode();

    functionNode.addModifier(new ModifierNode("static"));

    return functionNode;
  }

}
