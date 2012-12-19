package codeOrchestra.flex.processors.conditionalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;
import org.apache.flex.compiler.internal.tree.as.WithNode;

/**
 * @author Anton.I.Neverov
 */
public class WithStatementProcessor extends ConditionalNodeProcessor {

  public WithStatementProcessor(SNode node) {
    super(node);
    conditionName = "scope";
    statementBodyName = "statementBody";
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return new WithNode(null);
  }

}
