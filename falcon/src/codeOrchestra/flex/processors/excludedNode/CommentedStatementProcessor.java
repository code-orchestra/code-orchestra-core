package codeOrchestra.flex.processors.excludedNode;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class CommentedStatementProcessor extends ExcludedNodeProcessor {

  public CommentedStatementProcessor(SNode node) {
    super(node);
    childOrPropertyName = "statement";
  }

}
