package codeOrchestra.flex.processors.excludedNode;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class StatementProcessor extends ExcludedNodeProcessor {

  public StatementProcessor(SNode node) {
    super(node);
    childOrPropertyName = ""; // Statement has no children, so it is just to pass `!= null` check in handleChild()
  }

}
