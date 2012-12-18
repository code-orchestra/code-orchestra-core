package codeOrchestra.flex.processors.transparent;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class ExpressionStatementProcessor extends TransparentNodeProcessor {

  public ExpressionStatementProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("remark")) {
        // Ignore
      } else {
        return false;
      }
    }
    return true;
  }

}
