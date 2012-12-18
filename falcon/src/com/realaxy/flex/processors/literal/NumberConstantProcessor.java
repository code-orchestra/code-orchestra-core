package codeOrchestra.flex.processors.literal;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.NumericLiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.ILiteralNode.LiteralType;

/**
 * @author Anton.I.Neverov
 */
public class NumberConstantProcessor extends LiteralProcessor {

  public NumberConstantProcessor(SNode node) {
    super(node);
    myType = LiteralType.NUMBER; // Not used actually
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    check();

    return new NumericLiteralNode(literalValue);
  }

}
