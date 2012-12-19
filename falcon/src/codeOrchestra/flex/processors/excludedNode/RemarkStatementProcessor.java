package codeOrchestra.flex.processors.excludedNode;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class RemarkStatementProcessor extends ExcludedNodeProcessor {

  public RemarkStatementProcessor(SNode node) {
    super(node);
    childOrPropertyName = "value";
  }

}
