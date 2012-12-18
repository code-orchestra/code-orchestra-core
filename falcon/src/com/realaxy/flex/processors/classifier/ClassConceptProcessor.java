package codeOrchestra.flex.processors.classifier;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyIdentifierNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ClassConceptProcessor extends ClassifierProcessor {

  private ExpressionNodeBase baseClassNode;
  private FunctionNode constructorNode;
  private List<VariableNode> fields = new ArrayList<VariableNode>();
  private List<NodeBase> initializerStatements;
  private boolean isDynamic = false;

  public ClassConceptProcessor(SNode node) {
    super(node);
    interfaceChildName = "implementedInterface";
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (!super.handleProperty(name, value)) {
      if (name.equals("isDynamic")) {
        isDynamic = value.equals("true");
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("superclass")) {
        if (baseClassNode != null) {
          throw new SNodeProcessorException();
        }
        baseClassNode = processChild(child, ExpressionNodeBase.class);
      } else if (childRole.equals("constructor")) {
        if (constructorNode != null) {
          throw new SNodeProcessorException();
        }
        constructorNode = processChild(child, FunctionNode.class);
      } else if (childRole.equals("staticMethod")) {
        methods.add(processChild(child, FunctionNode.class));
      } else if (childRole.equals("field") || childRole.equals("staticField")) {
        fields.add(processChild(child, VariableNode.class));
      } else if (childRole.equals("initializer")) {
        if (initializerStatements != null) {
          throw new SNodeProcessorException();
        }
        if (!nodeIsInstanceOfConcept(child, Concept.ClassStaticInitializer)) {
          throw new SNodeProcessorException();
        }
        SNode initializerBody = child.getChild("body");
        if (initializerBody == null) {
          throw new SNodeProcessorException();
        }
        initializerStatements = processStatementList(initializerBody);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected MemberedNode createMemberedNode() throws SNodeProcessorException {
    check();

    ClassNode clazz = new ClassNode(new IdentifierNode(classifierName));
    clazz.setNamespace(namespaceNode);
    if (isDynamic) {
      clazz.addModifier(new ModifierNode("dynamic"));
    }
    if (baseClassNode != null && !(baseClassNode instanceof EmptyIdentifierNode)) {
      clazz.setBaseClass(baseClassNode);
    }
    for (ExpressionNodeBase interfaceNode : interfaceNodes) {
     if (!(interfaceNode instanceof EmptyIdentifierNode)) {
       clazz.addInterface(interfaceNode);
     }
    }
    ScopedBlockNode clazzScopedNode = clazz.getScopedNode();
    clazzScopedNode.setContainerType(ContainerType.BRACES);
    if (initializerStatements != null) {
      for (NodeBase initializerStatement : initializerStatements) {
        clazzScopedNode.addItem(initializerStatement);
        initializerStatement.setParent(clazzScopedNode);
      }
    }
    if (constructorNode != null) {
      clazz.setupConstructor(constructorNode);
      clazzScopedNode.addItem(clazz.getConstructorNode()); // TODO: hack?
    }
    for (VariableNode variableNode : fields) {
      clazzScopedNode.addItem(variableNode);
    }

    return clazz;
  }

}
