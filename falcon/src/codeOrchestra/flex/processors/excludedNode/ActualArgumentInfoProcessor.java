package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.ActualArgumentInfoNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ActualArgumentInfoProcessor extends ExcludedNodeProcessor {

  public ActualArgumentInfoProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new ActualArgumentInfoNode();
  }

}
