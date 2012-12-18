package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class XmlTemplateProcessor extends TransparentNodeProcessor {

  public XmlTemplateProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

}
