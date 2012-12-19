package codeOrchestra.flex.processors.forStatement;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ContainerNode;
import org.apache.flex.compiler.internal.tree.as.NodeBase;

/**
 * @author Anton.I.Neverov
 */
public class ForStatementProcessor extends AbstractForStatementProcessor {

  private NodeBase iteration;
  private NodeBase condition;

  public ForStatementProcessor(SNode node) {
    super(node);
    initializerExpectedClass = NodeBase.class;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("iteration")) {
        if (iteration != null) {
          throw new SNodeProcessorException();
        }
        iteration = processChild(child, NodeBase.class);
      } else if (childRole.equals("condition")) {
        if (condition != null) {
          throw new SNodeProcessorException();
        }
        condition = processChild(child, NodeBase.class);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected void check() throws SNodeProcessorException {
    super.check();
    if (iteration == null || condition == null) {
      throw new SNodeProcessorException();
    }
  }

  @Override
  protected void setSpecificConditions(ContainerNode conditionalsContainerNode) {
    conditionalsContainerNode.addItem(condition);
    condition.setParent(conditionalsContainerNode);
    conditionalsContainerNode.addItem(iteration);
    iteration.setParent(conditionalsContainerNode);
  }

}
