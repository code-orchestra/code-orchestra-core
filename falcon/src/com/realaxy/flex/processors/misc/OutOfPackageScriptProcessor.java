package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.OutOfPackageScriptNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class OutOfPackageScriptProcessor extends SNodeProcessor {

  private List<NodeBase> statements;

  public OutOfPackageScriptProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("body")) {
      if (statements != null) {
        throw new SNodeProcessorException();
      }
      statements = processStatementList(child);
    } else if (childRole.equals("returnType")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (statements == null) {
      throw new SNodeProcessorException();
    }

    return new OutOfPackageScriptNode(statements);
  }

}
