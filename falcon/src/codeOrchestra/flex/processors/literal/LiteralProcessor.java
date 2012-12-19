package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.LiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public abstract class LiteralProcessor extends SNodeProcessor {

  protected LiteralType myType;
  protected String literalValue;

  public LiteralProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("value")) {
      literalValue = value;
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  protected void check() throws SNodeProcessorException {
    if (literalValue == null) {
      throw new SNodeProcessorException();
    }
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (myType == null) {
      throw new RuntimeException();
    }

    check();

    return new LiteralNode(myType, literalValue);
  }

}
