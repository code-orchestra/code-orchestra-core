package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ChainedVariableNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IExpressionNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class LocalVariableDeclarationStatementProcessor extends SNodeProcessor {

  List<VariableNode> declarations = new ArrayList<VariableNode>();

  public LocalVariableDeclarationStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("isVerticalLayout")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("localVariableDeclaration")) {
      declarations.add(processChild(child, VariableNode.class));
    } else if (childRole.equals("remark")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (declarations.isEmpty()) {
      throw new SNodeProcessorException();
    }

    VariableNode result = declarations.get(0);
    for (int i = 1; i < declarations.size(); i++) {
      result.addChainedVariableNode(morphToChainedVariable(declarations.get(i)));
    }

    return result;
  }

  private ChainedVariableNode morphToChainedVariable(VariableNode node) throws SNodeProcessorException {
    IExpressionNode nameExpressionNode = node.getNameExpressionNode();
    if (!(nameExpressionNode instanceof IdentifierNode)) {
      throw new SNodeProcessorException();
    }
    IdentifierNode nameNode = (IdentifierNode) nameExpressionNode;
    ExpressionNodeBase typeNode = node.getTypeNode();
    ExpressionNodeBase initializerNode = node.getAssignedValueNode();

    ChainedVariableNode result = new ChainedVariableNode(nameNode);
    nameNode.setParent(result);
    result.setType(null, typeNode);
    typeNode.setParent(result);

    if (initializerNode != null) {
      result.setAssignedValue(null, initializerNode);
      initializerNode.setParent(result);
    }

    return result;
  }
}
