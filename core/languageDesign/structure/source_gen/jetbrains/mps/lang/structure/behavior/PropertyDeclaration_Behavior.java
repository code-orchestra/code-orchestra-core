package jetbrains.mps.lang.structure.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class PropertyDeclaration_Behavior {
  public static void init(SNode thisNode) {
  }

  public static String call_getCellId_1216822951265(SNode thisNode) {
    return "property_" + SPropertyOperations.getString(thisNode, "name");
  }

  public static boolean call_isPrimitiveString_1229468583974(SNode thisNode) {
    return SLinkOperations.getTarget(thisNode, "dataType", false) == SNodeOperations.getNode("r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)", "1082983041843");
  }

  public static boolean call_isPrimitiveInteger_1229468978693(SNode thisNode) {
    return SLinkOperations.getTarget(thisNode, "dataType", false) == SNodeOperations.getNode("r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)", "1082983657062");
  }

  public static boolean call_isPrimitiveBoolean_1229468962965(SNode thisNode) {
    return SLinkOperations.getTarget(thisNode, "dataType", false) == SNodeOperations.getNode("r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)", "1082983657063");
  }

  public static SNode call_getConceptDeclaration_3254710223377139385(SNode thisNode) {
    return SNodeOperations.getAncestor(thisNode, "jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration", false, false);
  }
}
