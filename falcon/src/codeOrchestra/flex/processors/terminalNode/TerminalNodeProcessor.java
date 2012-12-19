package codeOrchestra.flex.processors.terminalNode;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.internal.tree.as.TerminalNode;
import org.apache.flex.compiler.parsing.IASToken;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class TerminalNodeProcessor extends SNodeProcessor {

  protected String bodyName;
  protected IASToken myToken;

  protected List<NodeBase> statements;

  public TerminalNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (bodyName == null) {
      throw new RuntimeException();
    }
    String childRole = child.getRole_();
    if (childRole.equals(bodyName)) {
      if (statements != null) {
        throw new SNodeProcessorException();
      }
      statements = processStatementList(child);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (myToken == null) {
      throw new RuntimeException();
    }
    if (statements == null) {
      throw new SNodeProcessorException();
    }

    TerminalNode result = new TerminalNode(myToken);

    fillStatementList(result.getContentsNode(), statements);

    return result;
  }

}
