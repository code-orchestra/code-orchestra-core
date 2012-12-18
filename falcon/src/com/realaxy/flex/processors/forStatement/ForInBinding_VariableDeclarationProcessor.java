package codeOrchestra.flex.processors.forStatement;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.VariableExpressionNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ForInBinding_VariableDeclarationProcessor extends SNodeProcessor {

  private VariableNode declaration;

  public ForInBinding_VariableDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("variableDeclaration")) {
      if (declaration != null) {
        throw new SNodeProcessorException();
      }
      declaration = processChild(child, VariableNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (declaration == null) {
      throw new SNodeProcessorException();
    }

    return new VariableExpressionNode(declaration);
  }

}
