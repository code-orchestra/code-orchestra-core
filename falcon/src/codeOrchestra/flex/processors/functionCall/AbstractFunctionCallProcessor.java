package codeOrchestra.flex.processors.functionCall;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import codeOrchestra.flex.tree.ActualArgumentInfoNode;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.FunctionCallNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IContainerNode.ContainerType;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class AbstractFunctionCallProcessor extends SNodeProcessor {

  protected String actualArgumentsName = "actualArgument";
  protected String referenceName = "reference";

  protected List<NodeBase> actualArguments = new ArrayList<NodeBase>();

  public AbstractFunctionCallProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("isSelectableHackInited")) {
      // Ignore
    } else if (name.equals("name")) {
      // TODO: Looks like node with reference to INamedConcept creates "name" property during generation
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals(actualArgumentsName)) {
      actualArguments.add(processChild(child, NodeBase.class));
    } else {
      return false;
    }
    return true;
  }

  protected FunctionCallNode createFunctionCall() throws SNodeProcessorException {
    String targetNodeName = getNameByReference(myNode, referenceName);
    IdentifierNode nameNode = new IdentifierNode(targetNodeName);
    FunctionCallNode functionCallNode = new FunctionCallNode(nameNode);
    nameNode.setParent(functionCallNode);

    return functionCallNode;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    FunctionCallNode functionCallNode = createFunctionCall();

    ContainerNode argumentsNode = functionCallNode.getArgumentsNode();
    argumentsNode.setContainerType(ContainerType.PARENTHESIS);
    for (NodeBase actualArgument : actualArguments) {
      if (!(actualArgument instanceof ActualArgumentInfoNode)) {
        argumentsNode.addItem(actualArgument);
        actualArgument.setParent(argumentsNode);
      }
    }

    return functionCallNode;
  }

}
