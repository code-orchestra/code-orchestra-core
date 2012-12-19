package codeOrchestra.flex.processors.conditionalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ConditionalNode;
import org.apache.flex.compiler.internal.tree.as.DoWhileLoopNode;

/**
 * @author Anton.I.Neverov
 */
public class DoWhileStatementProcessor extends WhileStatementProcessor {

  public DoWhileStatementProcessor(SNode node) {
    super(node);
  }

  @Override
  protected ConditionalNode createConditionalNode() {
    return new DoWhileLoopNode(null);
  }

}
