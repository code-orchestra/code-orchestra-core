package codeOrchestra.flex.processors.identifier;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorMinusNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class NegativeInfinityProcessor extends PositiveInfinityProcessor {

  public NegativeInfinityProcessor(SNode node) {
    super(node);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    IdentifierNode node = (IdentifierNode) super.createNode();
    UnaryOperatorMinusNode unaryOperatorMinusNode = new UnaryOperatorMinusNode(null, node);
    node.setParent(unaryOperatorMinusNode);
    return unaryOperatorMinusNode;
  }

}
