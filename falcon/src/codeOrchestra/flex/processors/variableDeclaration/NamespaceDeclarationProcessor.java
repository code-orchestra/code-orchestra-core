package codeOrchestra.flex.processors.variableDeclaration;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.NamespaceNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class NamespaceDeclarationProcessor extends VariableDeclarationProcessor {

  public NamespaceDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseVariableNode createVariableNode() {
    return null; // This method is not used
  }

  protected boolean addNamespace() {
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (nameNode == null) {
      throw new SNodeProcessorException();
    }

    NamespaceNode myNamespaceNode = new NamespaceNode(nameNode);
    nameNode.setParent(myNamespaceNode);

    myNamespaceNode.setAssignedValue(null, initializer);
    initializer.setParent(myNamespaceNode);

    if (addNamespace()) {
      // We MUST NOT add visibility modifier to out of package namespace!
      myNamespaceNode.setNamespace(namespaceNode);
    }

    return myNamespaceNode;
  }

}
