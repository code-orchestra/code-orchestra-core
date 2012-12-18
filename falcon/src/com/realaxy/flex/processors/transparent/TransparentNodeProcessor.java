package codeOrchestra.flex.processors.transparent;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public abstract class TransparentNodeProcessor extends SNodeProcessor {

  protected IASNode result;
  protected String childName;

  public TransparentNodeProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (childName == null) {
      throw new SNodeProcessorException();
    }
    String childRole = child.getRole_();
    if (childRole.equals(childName)) {
      if (result != null) {
        throw new SNodeProcessorException();
      }
      result = processChild(child, IASNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (result == null) {
      throw new SNodeProcessorException();
    }

    return result;
  }

}
