package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class StringLiteralProcessor extends LiteralProcessor {

  public StringLiteralProcessor(SNode node) {
    super(node);
    myType = LiteralType.STRING;
  }

  @Override
  protected void check() throws SNodeProcessorException {
    if (literalValue == null) {
      literalValue = "";
    }
  }

}
