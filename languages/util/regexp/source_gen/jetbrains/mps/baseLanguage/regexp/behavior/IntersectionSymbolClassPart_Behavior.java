package jetbrains.mps.baseLanguage.regexp.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class IntersectionSymbolClassPart_Behavior {
  private static Class[] PARAMETERS_8173814113624650585 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  public static String virtual_getRepresentation_8173814113624650482(SNode thisNode) {
    return SymbolClassRegexpAndPart_Behavior.call_getRepresentation_8173814113624650482(SLinkOperations.getTarget(thisNode, "left", true)) + "&&" + SymbolClassRegexpAndPart_Behavior.call_getRepresentation_8173814113624650482(SLinkOperations.getTarget(thisNode, "right", true));
  }

  public static String call_getRepresentation_8173814113624650585(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (String) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.regexp.structure.IntersectionSymbolClassPart"), "virtual_getRepresentation_8173814113624650482", PARAMETERS_8173814113624650585);
  }

  public static String callSuper_getRepresentation_8173814113624650585(SNode thisNode, String callerConceptFqName) {
    return (String) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.regexp.structure.IntersectionSymbolClassPart"), callerConceptFqName, "virtual_getRepresentation_8173814113624650482", PARAMETERS_8173814113624650585);
  }
}
