package codeOrchestra.flex.processors.excludedNode;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class CommentedStatementsBlockProcessor extends ExcludedNodeProcessor {

  public CommentedStatementsBlockProcessor(SNode node) {
    super(node);
    childOrPropertyName = "statement";
  }

}
