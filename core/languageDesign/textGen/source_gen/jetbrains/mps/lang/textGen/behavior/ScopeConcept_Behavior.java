package jetbrains.mps.lang.textGen.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.List;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class ScopeConcept_Behavior {
  private static Class[] PARAMETERS_3822000666564591100 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  public static List<SNode> call_getScopeVariables_3822000666564591100(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (List<SNode>) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.lang.textGen.structure.ScopeConcept"), "virtual_getScopeVariables_3822000666564591100", PARAMETERS_3822000666564591100);
  }

  public static List<SNode> callSuper_getScopeVariables_3822000666564591100(SNode thisNode, String callerConceptFqName) {
    return (List<SNode>) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.lang.textGen.structure.ScopeConcept"), callerConceptFqName, "virtual_getScopeVariables_3822000666564591100", PARAMETERS_3822000666564591100);
  }
}
