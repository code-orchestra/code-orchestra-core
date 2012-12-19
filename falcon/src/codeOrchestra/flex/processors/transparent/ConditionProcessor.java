package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class ConditionProcessor extends TransparentNodeProcessor {

  public ConditionProcessor(SNode node) {
    super(node);
    childName = "expressionList";
  }

}
