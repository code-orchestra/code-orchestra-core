package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.UseNamespaceNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class UseNamespaceStatementProcessor extends SNodeProcessor {

  private ExpressionNodeBase namespace;

  public UseNamespaceStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("namespace")) {
      if (namespace != null) {
        throw new SNodeProcessorException();
      }
      namespace = processChild(child, ExpressionNodeBase.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (namespace == null) {
      throw new SNodeProcessorException();
    }
    return new UseNamespaceNode(namespace);
  }

}
