package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyIdentifierNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class DynamicClassifierTypeProcessor extends DynamicAccessOperationProcessor {

  public DynamicClassifierTypeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("isAllowEmpty")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (identifierName == null) {
      return new EmptyIdentifierNode();
    }

    return new IdentifierNode(identifierName);
  }

}
