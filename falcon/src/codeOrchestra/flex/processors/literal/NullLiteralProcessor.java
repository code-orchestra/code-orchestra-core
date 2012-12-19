package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class NullLiteralProcessor extends LiteralProcessor {

  public NullLiteralProcessor(SNode node) {
    super(node);
    myType = LiteralType.NULL;
  }

  @Override
  protected void check() throws SNodeProcessorException {
    // No value - no check
  }

}
