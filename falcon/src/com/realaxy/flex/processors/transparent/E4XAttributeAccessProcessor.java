package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class E4XAttributeAccessProcessor extends TransparentNodeProcessor {

  public E4XAttributeAccessProcessor(SNode node) {
    super(node);
    childName = "access";
  }

}
