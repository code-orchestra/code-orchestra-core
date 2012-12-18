package codeOrchestra.flex.processors.conditionalNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;
import org.apache.flex.compiler.internal.tree.as.WhileLoopNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class WhileStatementProcessor extends ConditionalNodeProcessor {

  protected String loopLabelName;

  public WhileStatementProcessor(SNode node) {
    super(node);
    conditionName = "condition";
    statementBodyName = "statementBody";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("loopLabel")) {
        if (loopLabelName != null) {
          throw new SNodeProcessorException();
        }
        loopLabelName = getStatementLabelName(child);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return new WhileLoopNode(null);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    ConditionalNode node = (ConditionalNode) super.createNode();

    if (loopLabelName != null) {
      return wrapInLabeledStatement(node, loopLabelName);
    }

    return node;
  }

}
