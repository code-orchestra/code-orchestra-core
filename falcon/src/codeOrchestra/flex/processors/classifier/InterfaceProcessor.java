package codeOrchestra.flex.processors.classifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyIdentifierNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;

/**
 * @author Anton.I.Neverov
 */
public class InterfaceProcessor extends ClassifierProcessor {

  public InterfaceProcessor(SNode node) {
    super(node);
    interfaceChildName = "extendedInterface";
  }

  @Override
  protected MemberedNode createMemberedNode() throws SNodeProcessorException {
    check();

    InterfaceNode myInterface = new InterfaceNode(new IdentifierNode(classifierName));
    myInterface.setNamespace(namespaceNode);

    for (ExpressionNodeBase interfaceNode : interfaceNodes) {
      if (!(interfaceNode instanceof EmptyIdentifierNode)) {
        myInterface.addBaseInterface(interfaceNode);
      }
    }

    ScopedBlockNode interfaceScopedNode = myInterface.getScopedNode();
    interfaceScopedNode.setContainerType(ContainerType.BRACES);

    return myInterface;
  }

}
