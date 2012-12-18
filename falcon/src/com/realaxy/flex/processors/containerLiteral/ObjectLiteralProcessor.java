package codeOrchestra.flex.processors.containerLiteral;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseLiteralContainerNode;
import org.apache.flex.compiler.internal.tree.as.ObjectLiteralNode;

/**
 * @author Anton.I.Neverov
 */
public class ObjectLiteralProcessor extends ContainerLiteralProcessor {

  public ObjectLiteralProcessor(SNode node) {
    super(node);
  }

  @Override
  protected BaseLiteralContainerNode createContainerNode() throws SNodeProcessorException {
    return new ObjectLiteralNode();
  }

}
