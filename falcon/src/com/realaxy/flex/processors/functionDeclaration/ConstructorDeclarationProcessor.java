package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ConstructorDeclarationProcessor extends FunctionDeclarationProcessor {

  private static List<Concept> classConcepts = new ArrayList<Concept>() {{ add(Concept.ClassConcept); add(Concept.OutOfPackageClassConcept); }};

  public ConstructorDeclarationProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    SNode parent = myNode.getParent();
    if (!nodeIsInstanceOfConcept(parent, classConcepts)) {
      throw new SNodeProcessorException();
    }
    functionName = parent.getProperty("name");

    if (functionName == null || statements == null) {
      throw new SNodeProcessorException();
    }

    IdentifierNode nameNode = new IdentifierNode(functionName);
    FunctionNode constructorNode = new FunctionNode(null, nameNode);
    nameNode.setParent(constructorNode);

    ContainerNode parametersContainerNode = constructorNode.getParametersContainerNode();
    parametersContainerNode.setContainerType(ContainerType.PARENTHESIS);
    for (ParameterNode parameter : parameters) {
      parametersContainerNode.addItem(parameter);
      parameter.setParent(parametersContainerNode);
    }

    fillStatementList(constructorNode.getScopedNode(), statements);

    return constructorNode;
  }

}
