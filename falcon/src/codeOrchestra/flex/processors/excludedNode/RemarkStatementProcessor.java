package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyStatementNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class RemarkStatementProcessor extends ExcludedNodeProcessor {

  public RemarkStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new EmptyStatementNode();
  }

}
