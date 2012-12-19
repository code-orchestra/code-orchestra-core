package codeOrchestra.flex.processors;

import codeOrchestra.flex.tree.EmptyStatementNode;
import com.sun.istack.internal.NotNull;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import org.apache.flex.compiler.constants.IASKeywordConstants;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagNode;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagsNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;
import org.apache.flex.compiler.tree.as.INamespaceDecorationNode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class SNodeProcessor {

  protected SNode myNode;

  protected abstract boolean handleProperty(String name, String value) throws SNodeProcessorException;

  protected abstract boolean handleChild(SNode child) throws SNodeProcessorException;

  protected abstract IASNode createNode() throws SNodeProcessorException;

  public SNodeProcessor(SNode node) {
    myNode = node;
  }

  public IASNode process() throws SNodeProcessorException {
    for (String propertyName: myNode.getProperties().keySet()) {
      String propertyValue = myNode.getProperties().get(propertyName);
      if (!handleProperty(propertyName, propertyValue)) {
        throw new SNodeProcessorException("Unhandled property " + propertyName + ", processor: " + getClass().getName());
      }
    }
    for (SNode child : myNode.getChildren()) {
      if (!handleChild(child)) {
        throw new SNodeProcessorException("Unhandled child " + child.getRole_() + ", processor: " + getClass().getName());
      }
    }
    return createNode();
  }

  protected <T extends IASNode> T processChild(SNode child, @NotNull Class<T> expectedClass) throws SNodeProcessorException {
    SNodeProcessor processor = SNodeProcessorProvider.getInstance().getProcessor(child);
    IASNode result = processor.process();
    if (result == null) {
      throw new RuntimeException();
    }
    if (!expectedClass.isInstance(result)) {
      throw new SNodeProcessorException("Processor " + processor.getClass().getName() + " returned instance of " + result.getClass().getName() + ". Expected class is " + expectedClass.getName());
    }
    return (T) result;
  }

  protected INamespaceDecorationNode createNamespaceNode(SNode node) throws SNodeProcessorException {
    if (nodeIsInstanceOfConcept(node, Concept.PublicVisibility)) {
      return new NamespaceIdentifierNode(IASKeywordConstants.PUBLIC);
    } else if (nodeIsInstanceOfConcept(node, Concept.ProtectedVisibility)) {
      return new NamespaceIdentifierNode(IASKeywordConstants.PROTECTED);
    } else if (nodeIsInstanceOfConcept(node, Concept.PrivateVisibility)) {
      return new NamespaceIdentifierNode(IASKeywordConstants.PRIVATE);
    } else if (nodeIsInstanceOfConcept(node, Concept.InternalVisibility)) {
      return new NamespaceIdentifierNode(IASKeywordConstants.INTERNAL);
    } else if (nodeIsInstanceOfConcept(node, Concept.NamespaceVisibility)) {
      String targetNodeName = getNameByReference(node, "reference");
      return new NamespaceIdentifierNode(targetNodeName);
    } else if (nodeIsInstanceOfConcept(node, Concept.DynamicNamespaceVisibility)) {
      String name = node.getProperty("name");
      if (name == null) {
        throw new SNodeProcessorException();
      }
      return new NamespaceIdentifierNode(name);
    } else if (nodeIsInstanceOfConcept(node, Concept.ConfigVisibility)) {
      return new NamespaceIdentifierNode("config");
    } else {
      throw new SNodeProcessorException();
    }
  }

  protected String getNameByReference(SNode node, String referenceName) throws SNodeProcessorException {
    SReference reference = node.getReference(referenceName);
    if (reference == null) {
      throw new SNodeProcessorException();
    }
    SNode targetNode = reference.getTargetNode();
    if (targetNode == null) {
      throw new SNodeProcessorException();
    }
    String targetNodeName = targetNode.getName();
    if (targetNodeName == null) {
      throw new SNodeProcessorException();
    }
    return targetNodeName;
  }

  protected List<NodeBase> processStatementList(SNode node) throws SNodeProcessorException {
    if (nodeIsInstanceOfConcept(node, Concept.StatementList)) {
      List<NodeBase> result = new ArrayList<NodeBase>();
      for (SNode statement : node.getChildren()) {
        if (nodeIsInstanceOfConcept(statement, Concept.BlockStatement) && statement.getChild("loopLabel") == null) {
          // Our statement is a block without label, it should be processed not as single statement, but as list of its contents
          SNode statementList = statement.getChild("statementBody");
          if (statementList == null) {
            throw new SNodeProcessorException();
          }
          result.addAll(processStatementList(statementList));
        } else {
          result.add(processChild(statement, NodeBase.class));
        }
      }
      return result;
    } else {
      throw new SNodeProcessorException();
    }
  }

  protected void fillStatementList(ContainerNode container, List<NodeBase> statements) {
    container.setContainerType(ContainerType.BRACES);
    for (NodeBase statement : statements) {
      if (!(statement instanceof EmptyStatementNode)) {
        container.addItem(statement);
        statement.setParent(container);
      }
    }
  }

  protected String getStatementLabelName(SNode node) throws SNodeProcessorException {
    if (nodeIsInstanceOfConcept(node, Concept.StatementLabel)) {
      String label = node.getProperty("label");
      if (label == null) {
        throw new SNodeProcessorException();
      }
      return label;
    } else {
      throw new SNodeProcessorException();
    }
  }

  protected LabeledStatementNode wrapInLabeledStatement(NodeBase statement, String label) throws SNodeProcessorException {
    return wrapInLabeledStatement(Collections.singletonList(statement), label);
  }

  protected LabeledStatementNode wrapInLabeledStatement(List<NodeBase> statements, String label) throws SNodeProcessorException {
    NonResolvingIdentifierNode identifierNode = new NonResolvingIdentifierNode(label);
    LabeledStatementNode labeledStatementNode = new LabeledStatementNode(identifierNode);
    identifierNode.setParent(labeledStatementNode);
    BlockNode labeledStatement = labeledStatementNode.getLabeledStatement();
    for (NodeBase statement : statements) {
      labeledStatement.addItem(statement);
      statement.setParent(labeledStatement);
    }
    return labeledStatementNode;
  }

  protected void addAnnotations(BaseDefinitionNode baseDefinitionNode, List<MetaTagNode> annotations) {
    if (annotations.isEmpty()) {
      return; // This protects local functions and variables from adding MetaTagsNode child
    }
    MetaTagsNode metaTags = new MetaTagsNode();
    metaTags.setDecorationTarget(baseDefinitionNode);
    baseDefinitionNode.setMetaTags(metaTags);
    for (MetaTagNode annotation : annotations) {
      metaTags.addTag(annotation);
      annotation.setParent(metaTags);
    }
  }

  protected boolean nodeIsInstanceOfConcept(SNode node, Concept concept) {
    return nodeIsInstanceOfConcept(node, Collections.singletonList(concept));
  }

  protected boolean nodeIsInstanceOfConcept(SNode node, List<Concept> concepts) {
    for (Concept concept : concepts) {
      if (node.getConceptFqName().equals(concept.getName())) {
        return true;
      }
    }

    return false;
  }
}
