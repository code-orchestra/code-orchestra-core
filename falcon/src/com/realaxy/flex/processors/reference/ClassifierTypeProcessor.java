package codeOrchestra.flex.processors.reference;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.TypedExpressionNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ClassifierTypeProcessor extends ReferenceNodeProcessor {

  private ExpressionNodeBase parameter;

  public ClassifierTypeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("parameter")) {
      if (parameter != null) { // Our AST permits multiple parameters, but Falcon AST does not
        throw new SNodeProcessorException();
      }
      parameter = processChild(child, ExpressionNodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    IdentifierNode node = (IdentifierNode) super.createNode();

    if (parameter == null) {
      return node;
    }

    TypedExpressionNode typedExpressionNode = new TypedExpressionNode(node, parameter);
    node.setParent(typedExpressionNode);
    parameter.setParent(typedExpressionNode);

    return typedExpressionNode;
  }

}
