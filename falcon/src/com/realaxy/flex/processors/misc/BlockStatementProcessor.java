package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class BlockStatementProcessor extends SNodeProcessor {

  private String loopLabelName;

  private List<NodeBase> statements;

  public BlockStatementProcessor(SNode node) {
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

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (statements == null || loopLabelName == null) { // BlockStatement without label should be handled in processStatementList()
      throw new SNodeProcessorException();
    }

    return wrapInLabeledStatement(statements, loopLabelName);
  }

}
