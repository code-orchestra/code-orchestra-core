package codeOrchestra.flex.processors.variableDeclaration;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class VariableDeclarationWithCommentProcessor extends VariableDeclarationProcessor {

  public VariableDeclarationWithCommentProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("remark")) {
        // Ignore
      } else if (childRole.equals("asDoc")) {
        // Ignore (LocalVariableDeclaration doesn't have asDoc, but it is not a problem)
      } else {
        return false;
      }
    }
    return true;
  }

}
