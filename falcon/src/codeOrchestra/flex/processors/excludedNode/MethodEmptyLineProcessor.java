package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyMethodNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class MethodEmptyLineProcessor extends ExcludedNodeProcessor {

  public MethodEmptyLineProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new EmptyMethodNode(null, null);
  }

}
