package jetbrains.mps.baseLanguage.dates.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilder;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.dataFlow.DataFlowBuilderContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class ConditionalFormatToken_DataFlow extends DataFlowBuilder {
  public ConditionalFormatToken_DataFlow() {
  }

  public void build(final IOperationContext operationContext, final DataFlowBuilderContext _context) {
    for (SNode pair : SLinkOperations.getTargets(_context.getNode(), "conditionPair", true)) {
      _context.getBuilder().build((SNode) pair);
    }
  }
}
