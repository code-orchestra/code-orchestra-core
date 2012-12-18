package codeOrchestra.flex.processors.conditionalNode;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class ConditionalNodeProcessor extends SNodeProcessor {

  protected String conditionName;
  protected String statementBodyName;

  protected ExpressionNodeBase condition;
  protected List<NodeBase> statementBody;

  public ConditionalNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (conditionName == null || statementBodyName == null) {
      throw new RuntimeException();
    }
    String childRole = child.getRole_();
    if (childRole.equals(conditionName)) {
      if (condition != null) {
        throw new SNodeProcessorException();
      }
      condition = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals(statementBodyName)) {
      if (statementBody != null) {
        throw new SNodeProcessorException();
      }
      statementBody = processStatementList(child);
    } else {
      return false;
    }
    return true;
  }

  protected abstract ConditionalNode createConditionalNode();

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (condition == null || statementBody == null) {
      throw new SNodeProcessorException();
    }

    ConditionalNode conditionalNode = createConditionalNode();
    conditionalNode.setConditionalExpression(condition);
    condition.setParent(conditionalNode);

    fillStatementList(conditionalNode.getContentsNode(), statementBody);

    return conditionalNode;
  }

}
