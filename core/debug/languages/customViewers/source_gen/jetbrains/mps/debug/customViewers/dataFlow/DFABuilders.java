package jetbrains.mps.debug.customViewers.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilders;
import jetbrains.mps.lang.dataFlow.DataFlowManager;

public class DFABuilders extends DataFlowBuilders {
  public void install(DataFlowManager manager) {
    manager.register("jetbrains.mps.debug.customViewers.structure.HighLevelWatchableCreator", new HighLevelWatchableCreator_DataFlow());
  }
}
