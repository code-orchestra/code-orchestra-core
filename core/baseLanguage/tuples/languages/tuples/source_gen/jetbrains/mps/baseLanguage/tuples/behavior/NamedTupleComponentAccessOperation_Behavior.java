package jetbrains.mps.baseLanguage.tuples.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class NamedTupleComponentAccessOperation_Behavior {
  public static void init(SNode thisNode) {
  }

  public static boolean virtual_isLValue_1213877410080(SNode thisNode) {
    return !(SPropertyOperations.getBoolean(SLinkOperations.getTarget(thisNode, "component", false), "final"));
  }
}
