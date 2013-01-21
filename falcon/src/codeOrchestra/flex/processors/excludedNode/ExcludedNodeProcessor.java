package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyStatementNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class ExcludedNodeProcessor extends SNodeProcessor {

  public ExcludedNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return true; // Ignore
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return true; // Ignore
  }

}
