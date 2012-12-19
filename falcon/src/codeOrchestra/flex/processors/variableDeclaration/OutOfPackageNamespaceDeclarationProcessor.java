package codeOrchestra.flex.processors.variableDeclaration;

import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class OutOfPackageNamespaceDeclarationProcessor extends NamespaceDeclarationProcessor {

  public OutOfPackageNamespaceDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean addNamespace() {
    return false;
  }

}
