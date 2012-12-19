package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class TryStatementProcessor extends SNodeProcessor {

  private String loopLabelName;

  private List<NodeBase> tryStatements;
  private List<CatchNode> catchClauses = new ArrayList<CatchNode>();
  private TerminalNode finallyBlock;

  public TryStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("statementBody")) {
      if (tryStatements != null) {
        throw new SNodeProcessorException();
      }
      tryStatements = processStatementList(child);
    } else if (childRole.equals("catchClause")) {
      catchClauses.add(processChild(child, CatchNode.class));
    } else if (childRole.equals("finallyBlock")) {
      if (finallyBlock != null) {
        throw new SNodeProcessorException();
      }
      finallyBlock = processChild(child, TerminalNode.class);
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
    if (tryStatements == null) {
      throw new SNodeProcessorException();
    }

    TryNode tryNode = new TryNode(new ASToken(ASTokenTypes.TOKEN_KEYWORD_TRY, -1, -1, -1, -1, "try"));

    fillStatementList(tryNode.getContentsNode(), tryStatements);

    for (CatchNode catchClause : catchClauses) {
      tryNode.addCatchClause(catchClause);
      catchClause.setParent(tryNode);
    }

    if (finallyBlock != null) {
      tryNode.addFinallyBlock(finallyBlock);
      finallyBlock.setParent(tryNode);
    }

    if (loopLabelName != null) {
      return wrapInLabeledStatement(tryNode, loopLabelName);
    }

    return tryNode;
  }

}
