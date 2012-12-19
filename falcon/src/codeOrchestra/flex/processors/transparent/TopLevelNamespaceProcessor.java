package codeOrchestra.flex.processors.transparent;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class TopLevelNamespaceProcessor extends TopLevelConstantProcessor {

  public TopLevelNamespaceProcessor(SNode node) {
    super(node);
    childName = "namespace";
  }

}
