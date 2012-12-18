package codeOrchestra.flex.processors.excludedNode;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.EmptyStatementNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class ExcludedNodeProcessor extends SNodeProcessor {

  protected String childOrPropertyName;

  public ExcludedNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (childOrPropertyName == null) {
      throw new RuntimeException();
    }
    if (name.equals(childOrPropertyName)) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (childOrPropertyName == null) {
      throw new RuntimeException();
    }
    String childRole = child.getRole_();
    if (childRole.equals(childOrPropertyName)) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return new EmptyStatementNode();
  }

}
