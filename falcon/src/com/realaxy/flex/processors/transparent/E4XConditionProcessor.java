package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class E4XConditionProcessor extends ParenthesizedExpressionProcessor {

  public E4XConditionProcessor(SNode node) {
    super(node);
    childName = "condition";
  }

}
