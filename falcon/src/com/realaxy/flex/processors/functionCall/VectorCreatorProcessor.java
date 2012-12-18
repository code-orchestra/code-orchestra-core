package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.internal.tree.as.VectorLiteralNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class VectorCreatorProcessor extends FunctionCallProcessor {

  public VectorCreatorProcessor(SNode node) {
    super(node);
    actualArgumentsName = "value";
    nameExpressionName = "type";
  }

  @Override
  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    VectorLiteralNode vectorLiteralNode = new VectorLiteralNode();
    vectorLiteralNode.setCollectionTypeNode(nameExpression);
    nameExpression.setParent(vectorLiteralNode);

    ContainerNode contentsNode = vectorLiteralNode.getContentsNode();
    for (NodeBase value : actualArguments) {
      contentsNode.addItem(value);
      value.setParent(contentsNode);
    }

    nameExpression = vectorLiteralNode;

    return super.createFunctionCall();
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    return createFunctionCall();
  }

}
