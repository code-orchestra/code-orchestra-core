package jetbrains.mps.lang.traceable.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class TraceableConcept_Behavior {
  private static Class[] PARAMETERS_5067982036267369901 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  @Nullable
  public static String virtual_getTraceableProperty_5067982036267369901(SNode thisNode) {
    return null;
  }

  public static String call_getTraceableProperty_5067982036267369901(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (String) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.lang.traceable.structure.TraceableConcept"), "virtual_getTraceableProperty_5067982036267369901", PARAMETERS_5067982036267369901);
  }

  public static String callSuper_getTraceableProperty_5067982036267369901(SNode thisNode, String callerConceptFqName) {
    return (String) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.lang.traceable.structure.TraceableConcept"), callerConceptFqName, "virtual_getTraceableProperty_5067982036267369901", PARAMETERS_5067982036267369901);
  }
}
