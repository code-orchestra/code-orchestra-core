package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.NonResolvingIdentifierNode;
import org.apache.flex.compiler.internal.tree.as.ObjectLiteralValuePairNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ObjectLiteralParameterProcessor extends SNodeProcessor {

  private NonResolvingIdentifierNode nameNode;
  private ExpressionNodeBase valueNode;

  public ObjectLiteralParameterProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      nameNode = new NonResolvingIdentifierNode(value);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("value")) {
      if (valueNode != null) {
        throw new SNodeProcessorException();
      }
      valueNode = processChild(child, ExpressionNodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new ObjectLiteralValuePairNode(null, nameNode, valueNode);
  }

}
