package jetbrains.mps.baseLanguage.closures.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilders;
import jetbrains.mps.lang.dataFlow.DataFlowManager;

public class DFABuilders extends DataFlowBuilders {
  public void install(DataFlowManager manager) {
    manager.register("jetbrains.mps.baseLanguage.closures.structure.ClosureControlStatement", new ClosureControlStatement_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral", new ClosureLiteral_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.closures.structure.CompactInvokeFunctionExpression", new CompactInvokeFunctionExpression_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.closures.structure.InvokeFunctionOperation", new InvokeFunctionOperation_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.closures.structure.YieldAllStatement", new YieldAllStatement_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.closures.structure.YieldStatement", new YieldStatement_DataFlow());
  }
}
