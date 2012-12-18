package codeOrchestra.flex.processors.conditionalNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Anton.I.Neverov
 *
 * TODO: We override almost everything from ConditionalNodeProcessor, so why SwitchStatementProcessor is a subclass of it?
 */
public class SwitchStatementProcessor extends ConditionalNodeProcessor {

  private String loopLabelName;

  private List<NodeBase> caseNodes = new ArrayList<NodeBase>();

  public SwitchStatementProcessor(SNode node) {
    super(node);
    conditionName = "expression";
    statementBodyName = "defaultBlock"; // Deprecated in the SwitchStatement concept, but is initialized to pass `statementBodyName != null` check
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("case")) {
        caseNodes.add(processChild(child, NodeBase.class));
      } else if (childRole.equals("loopLabel")) {
        if (loopLabelName != null) {
          throw new SNodeProcessorException();
        }
        loopLabelName = getStatementLabelName(child);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return null; // Is not used because createNode does not call super()
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (condition == null) { // We do not check body, because it is deprecated in the SwitchStatement concept
      throw new SNodeProcessorException();
    }

    SwitchNode result = new SwitchNode(null);
    result.setConditionalExpression(condition);
    condition.setParent(result);

    TerminalNode defaultBlock = null;
    Iterator<NodeBase> iterator = caseNodes.iterator();
    while (iterator.hasNext()) {
      NodeBase node = iterator.next();
      if (node instanceof TerminalNode) {
        // Check that we have only one default block
        if (defaultBlock == null) {
          defaultBlock = (TerminalNode) node;
          iterator.remove();
        } else {
          throw new SNodeProcessorException();
        }
      }
    }

    BlockNode contentsNode = result.getContentsNode();
    for (NodeBase caseNode : caseNodes) {
      contentsNode.addItem(caseNode);
      caseNode.setParent(contentsNode);
    }

    if (defaultBlock != null) {
      contentsNode.addItem(defaultBlock);
      defaultBlock.setParent(contentsNode);
    }

    if (loopLabelName != null) {
      return wrapInLabeledStatement(result, loopLabelName);
    }

    return result;
  }

}
