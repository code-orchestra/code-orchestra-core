package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.processors.terminalNode.ElseBlockProcessor;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class IfStatementProcessor extends SNodeProcessor {

  private String loopLabelName;

  private ExpressionNodeBase condition;
  private List<NodeBase> statementBody;
  private List<NodeBase> elseIfClauses = new ArrayList<NodeBase>();
  private TerminalNode elseClause;

  public IfStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("condition")) {
      if (condition != null) {
        throw new SNodeProcessorException();
      }
      condition = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals("statementBody")) {
      if (statementBody != null) {
        throw new SNodeProcessorException();
      }
      statementBody = processStatementList(child);
    } else if (childRole.equals("elsifClauses")) {
      elseIfClauses.add(processChild(child, NodeBase.class));
    } else if (childRole.equals("ifFalseStatement")) {
      if (elseClause != null) {
        throw new SNodeProcessorException();
      }
      if (!nodeIsInstanceOfConcept(child, Concept.BlockStatement)) {
        throw new SNodeProcessorException();
      }
      elseClause = (TerminalNode) new ElseBlockProcessor(child).process(); // TODO: hack - direct call to the processor!
    } else if (childRole.equals("loopLabel")) {
      if (loopLabelName != null) {
        throw new SNodeProcessorException();
      }
      loopLabelName = getStatementLabelName(child);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (condition == null || statementBody == null) {
      throw new SNodeProcessorException();
    }

    IfNode ifNode = new IfNode(null);
    ConditionalNode conditionalNode = new ConditionalNode(null);
    conditionalNode.setConditionalExpression(condition);
    condition.setParent(conditionalNode);
    fillStatementList(conditionalNode.getContentsNode(), statementBody);
    ifNode.addChild(conditionalNode);
    conditionalNode.setParent(ifNode);

    for (NodeBase elseIfClause : elseIfClauses) {
      ifNode.addChild(elseIfClause);
      elseIfClause.setParent(ifNode);
    }

    if (elseClause != null) {
      ifNode.addChild(elseClause);
      elseClause.setParent(ifNode);
    }

    if (loopLabelName != null) {
      return wrapInLabeledStatement(ifNode, loopLabelName);
    }

    return ifNode;
  }

}
