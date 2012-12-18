package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagNode;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagsNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;
import org.apache.flex.compiler.tree.as.INamespaceDecorationNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class FunctionDeclarationProcessor extends SNodeProcessor {

  protected String functionName;
  protected List<NodeBase> statements;
  protected List<ParameterNode> parameters = new ArrayList<ParameterNode>();
  protected INamespaceDecorationNode namespace;
  protected ExpressionNodeBase returnType;
  protected boolean isFinal;
  protected boolean isNative;
  protected List<MetaTagNode> annotations = new ArrayList<MetaTagNode>();

  public FunctionDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      functionName = value;
    } else if (name.equals("isFinal")) {
      isFinal = value.equals("true");
    } else if (name.equals("isNative")) {
      isNative = value.equals("true");
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("body")) {
      if (statements != null) {
        throw new SNodeProcessorException();
      }
      statements = processStatementList(child);
    } else if (childRole.equals("visibility")) {
      if (namespace != null) {
        throw new SNodeProcessorException();
      }
      namespace = createNamespaceNode(child);
    } else if (childRole.equals("parameter")) {
      parameters.add(processChild(child, ParameterNode.class));
    } else if (childRole.equals("returnType")) {
      if (returnType != null) {
        throw new SNodeProcessorException();
      }
      returnType = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals("annotation")) {
      annotations.add(processChild(child, MetaTagNode.class));
    } else if (childRole.equals("asDoc")) { // Impossible for AnonymousFunction and LocalFunctionDeclaration, but who cares?
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  protected FunctionNode createFunctionNode(IdentifierNode nameNode) {
    return new FunctionNode(null, nameNode);
  }

  protected void check() throws SNodeProcessorException {
    if (functionName == null || namespace == null || returnType == null) {
      // isInterfaceMethod check is not needed here because interface method is simply a instance method
      throw new SNodeProcessorException();
    }
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    check();

    IdentifierNode nameNode = new IdentifierNode(functionName);
    FunctionNode functionNode = createFunctionNode(nameNode);
    nameNode.setParent(functionNode);
    functionNode.setType(null, returnType);
    returnType.setParent(functionNode);

    ContainerNode parametersContainerNode = functionNode.getParametersContainerNode();
    parametersContainerNode.setContainerType(ContainerType.PARENTHESIS);
    for (ParameterNode parameter : parameters) {
      parametersContainerNode.addItem(parameter);
      parameter.setParent(parametersContainerNode);
    }

    if (!isInterfaceMethod()) {
      if (namespace != null) { // It is null for LocalFunctionDeclaration and AnonymousFunction
        functionNode.setNamespace(namespace);
      }
      if (isFinal) {
        functionNode.addModifier(new ModifierNode("final"));
      }
      if (isNative) {
        functionNode.addModifier(new ModifierNode("native"));
      }
      if (statements != null) {
        fillStatementList(functionNode.getScopedNode(), statements);
      }
    }

    addAnnotations(functionNode, annotations);

    return functionNode;
  }

  private boolean isInterfaceMethod() {
    SNode parent = myNode.getParent();
    return parent != null && nodeIsInstanceOfConcept(parent, Concept.Interface); // Parent is null for GlobalFunction
  }

}
