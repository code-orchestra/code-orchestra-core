package jetbrains.mps.lang.actions.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class SideTransformHintSubstituteActionsBuilder_Behavior {
  public static void init(SNode thisNode) {
  }

  public static String call_getBuilderQueryMethodName_1220279234749(SNode thisNode) {
    String conceptName = SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "applicableConcept", false), "name");
    return "sideTransform_ActionsFactory_" + conceptName + "_" + thisNode.getId();
  }

  public static String call_getPreconditionQueryMethodName_1220279571415(SNode thisNode) {
    String conceptName = SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "applicableConcept", false), "name");
    SNode precondtion = SLinkOperations.getTarget(thisNode, "precondition", true);
    return "sideTransformHintSubstituteActionsBuilder_Precondition_" + conceptName + "_" + precondtion.getId();
  }
}
