package jetbrains.mps.xmlSchema.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Set;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class ElementReference_Behavior {
  public static void init(SNode thisNode) {
  }

  public static void virtual_checkElements_1213877382378(SNode thisNode, Set<SNode> elementDeclarations) {
    SetSequence.fromSet(elementDeclarations).addElement(SLinkOperations.getTarget(thisNode, "elementDeclaration", false));
  }
}
