package jetbrains.mps.lang.plugin.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilder;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.dataFlow.DataFlowBuilderContext;

public class ActionParameterDeclaration_DataFlow extends DataFlowBuilder {
  public ActionParameterDeclaration_DataFlow() {
  }

  public void build(final IOperationContext operationContext, final DataFlowBuilderContext _context) {
    _context.getBuilder().emitWrite(_context.getNode());
  }
}
