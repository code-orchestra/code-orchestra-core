package jetbrains.mps.lang.plugin.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class RunModelConfigCreator_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode virtual_getCreatorTypeParameter_5528847031674330314(SNode thisNode) {
    return SNodeOperations.getNode("f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(MPS.Classpath/jetbrains.mps.smodel@java_stub)", "~SModel");
  }

  public static SNode virtual_getFunction_5528847031674340387(SNode thisNode) {
    return SLinkOperations.getTarget(thisNode, "createModelRunConfigBlock", true);
  }
}
