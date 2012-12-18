package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorCommaNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.NilNode;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ExpressionListProcessor extends SNodeProcessor {

  private List<ExpressionNodeBase> expressions = new ArrayList<ExpressionNodeBase>();

  public ExpressionListProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("expression")) {
      expressions.add(processChild(child, ExpressionNodeBase.class));
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (expressions.isEmpty()) {
      return new NilNode();
    }

    ExpressionNodeBase result = expressions.get(0);
    for (int i = 1; i < expressions.size(); i++) {
      ExpressionNodeBase leftPart = result;
      result = new BinaryOperatorCommaNode(null, leftPart, expressions.get(i));
      leftPart.setParent(result);
      expressions.get(i).setParent(result);
    }

    return result;
  }

}
