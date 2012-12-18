package codeOrchestra.flex.processors.containerLiteral;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ArrayLiteralNode;
import org.apache.flex.compiler.internal.tree.as.BaseLiteralContainerNode;

/**
 * @author Anton.I.Neverov
 */
public class ArrayLiteralProcessor extends ContainerLiteralProcessor {

  public ArrayLiteralProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseLiteralContainerNode createContainerNode() throws SNodeProcessorException {
    return new ArrayLiteralNode();
  }

}
