package codeOrchestra.flex.processors.variableDeclaration;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyIdentifierNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseVariableNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.INamespaceDecorationNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class VariableDeclarationProcessor extends SNodeProcessor {

  protected IdentifierNode nameNode;
  protected ExpressionNodeBase typeNode;
  protected ExpressionNodeBase initializer;
  protected INamespaceDecorationNode namespaceNode;
  protected boolean isConst;
  protected List<MetaTagNode> annotations = new ArrayList<MetaTagNode>();

  public VariableDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      nameNode = new IdentifierNode(value);
    } else if (name.equals("isFinal")) {
      isConst = value.equals("true");
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("type")) {
      if (typeNode != null) {
        throw new SNodeProcessorException();
      }
      typeNode = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals("visibility")) {
      if (namespaceNode != null) {
        throw new SNodeProcessorException();
      }
      namespaceNode = createNamespaceNode(child);
    } else if (childRole.equals("initializer")) {
      if (initializer != null) {
        throw new SNodeProcessorException();
      }
      initializer = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals("annotation")) {
      annotations.add(processChild(child, MetaTagNode.class));
    } else {
      return false;
    }
    return true;
  }

  protected abstract BaseVariableNode createVariableNode();

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (nameNode == null || typeNode == null) {
      throw new SNodeProcessorException();
    }

    BaseVariableNode variableNode = createVariableNode();
    nameNode.setParent(variableNode);

    if (!(typeNode instanceof EmptyIdentifierNode)) { // In case of VarargsParameter type is set in createVariableNode()
      variableNode.setType(null, typeNode);
      typeNode.setParent(variableNode);
    }

    // TODO: mega hack
    // Fixes type resolving in org.apache.flex.compiler.internal.tree.as.BaseVariableNode.fillinDefinition()
    typeNode.setEnd(0);

    variableNode.setIsConst(isConst);

    if (initializer != null) {
      variableNode.setAssignedValue(null, initializer);
      initializer.setParent(variableNode);
    }

    if (namespaceNode != null) { // TODO: Could it affect local variables?
      variableNode.setNamespace(namespaceNode);
    }

    addAnnotations(variableNode, annotations);

    return variableNode;
  }
}
