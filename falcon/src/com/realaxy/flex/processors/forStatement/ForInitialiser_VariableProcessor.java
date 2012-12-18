package codeOrchestra.flex.processors.forStatement;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.NilNode;
import org.apache.flex.compiler.internal.tree.as.VariableExpressionNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ForInitialiser_VariableProcessor extends SNodeProcessor {

  private List<VariableNode> declarations = new ArrayList<VariableNode>();

  public ForInitialiser_VariableProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("variableDeclaration")) {
      declarations.add(processChild(child, VariableNode.class));
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (declarations.isEmpty()) {
      return new NilNode();
    }

    if (declarations.size() == 1) {
      return new VariableExpressionNode(declarations.get(0));
    }

    ContainerNode containerNode = new ContainerNode();
    for (VariableNode declaration : declarations) {
      VariableExpressionNode variableExpressionNode = new VariableExpressionNode(declaration);
      containerNode.addItem(variableExpressionNode);
      variableExpressionNode.setParent(containerNode);
    }

    return containerNode;
  }

}
