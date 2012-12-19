package codeOrchestra.flex.processors.conditionalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;

/**
 * @author Anton.I.Neverov
 */
public class ElsifClauseProcessor extends ConditionalNodeProcessor {

  public ElsifClauseProcessor(SNode node) {
    super(node);
    conditionName = "condition";
    statementBodyName = "statementList";
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return new ConditionalNode(null);
  }

}
