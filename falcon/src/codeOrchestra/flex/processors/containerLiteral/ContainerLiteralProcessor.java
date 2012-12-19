package codeOrchestra.flex.processors.containerLiteral;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BaseLiteralContainerNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class ContainerLiteralProcessor extends SNodeProcessor{

  protected String itemName = "item";
  protected List<NodeBase> values = new ArrayList<NodeBase>();

  public ContainerLiteralProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("useHorizontalLayout")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals(itemName)) {
      values.add(processChild(child, NodeBase.class));
    } else {
      return false;
    }
    return true;
  }

  protected abstract BaseLiteralContainerNode createContainerNode() throws SNodeProcessorException;

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    BaseLiteralContainerNode baseLiteralContainerNode = createContainerNode();

    ContainerNode contentsNode = baseLiteralContainerNode.getContentsNode();
    for (NodeBase value : values) {
      contentsNode.addItem(value);
      value.setParent(contentsNode);
    }

    return baseLiteralContainerNode;
  }

}
