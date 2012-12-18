package codeOrchestra.flex.processors.forStatement;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.parsing.IASToken;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class AbstractForStatementProcessor extends SNodeProcessor {

  protected String loopLabelName;

  protected IASToken myKeywordToken; // It can be null in case of for statement

  // For initializer can be NodeBase, but to create foreach/forin initializer we need to have ExpressionNodeBase
  protected Class<? extends NodeBase> initializerExpectedClass;

  protected NodeBase initializer;
  protected List<NodeBase> statements;

  public AbstractForStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (initializerExpectedClass == null) {
      throw new RuntimeException();
    }
    String childRole = child.getRole_();
    if (childRole.equals("initializer")) {
      if (initializer != null) {
        throw new SNodeProcessorException();
      }
      initializer = processChild(child, initializerExpectedClass);
    } else if (childRole.equals("statementBody")) {
      if (statements != null) {
        throw new SNodeProcessorException();
      }
      statements = processStatementList(child);
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

  protected void check() throws SNodeProcessorException {
    if (statements == null) {
      throw new SNodeProcessorException();
    }
  }

  protected void setSpecificConditions(ContainerNode conditionalsContainerNode) {
    // Do nothing by default
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    check();

    ForLoopNode forLoopNode = new ForLoopNode(myKeywordToken);

    ContainerNode conditionalsContainerNode = forLoopNode.getConditionalsContainerNode();
    if (initializer == null) {
      initializer = new NilNode();
    }
    conditionalsContainerNode.addItem(initializer);
    initializer.setParent(conditionalsContainerNode);

    setSpecificConditions(conditionalsContainerNode);

    fillStatementList(forLoopNode.getContentsNode(), statements);

    if (loopLabelName != null) {
      return wrapInLabeledStatement(forLoopNode, loopLabelName);
    }

    return forLoopNode;
  }

}
