package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class BooleanConstantProcessor extends LiteralProcessor {

  public BooleanConstantProcessor(SNode node) {
    super(node);
    myType = LiteralType.BOOLEAN;
  }

  @Override
  protected void check() throws SNodeProcessorException {
    if (literalValue == null) {
      literalValue = "false";
    }
  }

}
