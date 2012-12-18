package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.identifier.DynamicAccessOperationProcessor;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class DynamicNamespaceReferenceProcessor extends DynamicAccessOperationProcessor {

  public DynamicNamespaceReferenceProcessor(SNode node) {
    super(node);
  }

}
