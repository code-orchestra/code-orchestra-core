package jetbrains.mps.lang.actions.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class ConceptFunctionParameter_nodeToPastePostProcess_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode call_getPostProcessor_6026743057587447970(SNode thisNode) {
    return SNodeOperations.getAncestor(thisNode, "jetbrains.mps.lang.actions.structure.PastePostProcessor", false, false);
  }
}
