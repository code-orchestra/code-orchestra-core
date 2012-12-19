package codeOrchestra.flex.processors.binary;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class BinaryExpressionProcessor extends SNodeProcessor {

  protected String leftOperandName = "leftOperand";
  protected String rightOperandName = "rightOperand";

  protected ExpressionNodeBase leftOperand;
  protected ExpressionNodeBase rightOperand;

  public BinaryExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals(leftOperandName)) {
      if (leftOperand != null) {
        throw new SNodeProcessorException();
      }
      leftOperand = processChild(child, ExpressionNodeBase.class);
    } else if (childRole.equals(rightOperandName)) {
      if (rightOperand != null) {
        throw new SNodeProcessorException();
      }
      rightOperand = processChild(child, ExpressionNodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  protected abstract ExpressionNodeBase createOperator();

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (leftOperand == null || rightOperand == null) {
      throw new SNodeProcessorException();
    }

    NodeBase result = createOperator();
    leftOperand.setParent(result);
    rightOperand.setParent(result);

    return result;
  }

}
