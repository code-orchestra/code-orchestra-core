package jetbrains.mps.lang.actions.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class CopyPreProcessor_Behavior {
  public static void init(SNode thisNode) {
  }

  public static String call_getClassName_5948027493682347861(SNode thisNode) {
    SNode parent = (SNode) SNodeOperations.getParent(thisNode);
    return SPropertyOperations.getString(parent, "name") + "_CopyPreProcessor_" + SNodeOperations.getIndexInParent(thisNode);
  }
}
