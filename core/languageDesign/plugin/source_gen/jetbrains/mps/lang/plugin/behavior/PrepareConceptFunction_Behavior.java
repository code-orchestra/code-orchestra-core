package jetbrains.mps.lang.plugin.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;

public class PrepareConceptFunction_Behavior {
  public static void init(SNode thisNode) {
    SLinkOperations.setTarget(thisNode, "retrunTypeParameter", SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.VoidType", null), true);
  }

  public static SNode virtual_getExpectedReturnType_1213877374441(SNode thisNode) {
    return SLinkOperations.getTarget(thisNode, "retrunTypeParameter", true);
  }
}
