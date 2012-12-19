package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class ForInBinding_VariableReferenceProcessor extends TransparentNodeProcessor {

  public ForInBinding_VariableReferenceProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

}
