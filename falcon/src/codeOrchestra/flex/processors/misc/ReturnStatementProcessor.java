package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.ReturnNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ReturnStatementProcessor extends SNodeProcessor {

  private ExpressionNodeBase returnExpression;

  public ReturnStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("expression")) {
      if (returnExpression != null) {
        throw new SNodeProcessorException();
      }
      returnExpression = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals("remark")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    ReturnNode returnStatement = new ReturnNode(null);
    if (returnExpression != null) {
      returnStatement.setStatementExpression(returnExpression);
      returnExpression.setParent(returnStatement);
    }

    return returnStatement;
  }

}
