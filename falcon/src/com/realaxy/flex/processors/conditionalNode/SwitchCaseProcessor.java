package codeOrchestra.flex.processors.conditionalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;

/**
 * @author Anton.I.Neverov
 */
public class SwitchCaseProcessor extends ConditionalNodeProcessor {

  public SwitchCaseProcessor(SNode node) {
    super(node);
    conditionName = "expression";
    statementBodyName = "body";
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return new ConditionalNode(null);
  }

}
