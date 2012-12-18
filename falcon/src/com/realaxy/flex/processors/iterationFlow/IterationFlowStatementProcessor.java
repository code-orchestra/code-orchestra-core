package codeOrchestra.flex.processors.iterationFlow;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.IterationFlowNode;
import org.apache.flex.compiler.parsing.IASToken;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class IterationFlowStatementProcessor extends SNodeProcessor {

  protected IASToken myToken;
  protected IdentifierNode labelReference;

  public IterationFlowStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("labelReference")) {
      if (labelReference != null) {
        throw new SNodeProcessorException();
      }
      labelReference = processChild(child, IdentifierNode.class);
    } else if (childRole.equals("remark")) {
      // Ignore
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

    IterationFlowNode iterationFlowNode = new IterationFlowNode(myToken);

    if (labelReference != null) {
      iterationFlowNode.setLabel(labelReference);
    }

    return iterationFlowNode;
  }
}
