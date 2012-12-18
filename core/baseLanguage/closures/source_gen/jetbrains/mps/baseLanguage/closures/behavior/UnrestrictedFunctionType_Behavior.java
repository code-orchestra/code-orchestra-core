package jetbrains.mps.baseLanguage.closures.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.core.behavior.BaseConcept_Behavior;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import java.util.List;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class UnrestrictedFunctionType_Behavior {
  private static Class[] PARAMETERS_3841277577642912754 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  public static String virtual_getPresentation_1213877396640(SNode thisNode) {
    StringBuffer sb = new StringBuffer("{");
    String sep = "";
    for (SNode pt : SLinkOperations.getTargets(thisNode, "parameterType", true)) {
      sb.append(sep).append(BaseConcept_Behavior.call_getPresentation_1213877396640(pt));
      sep = ",";
    }
    sb.append("==>").append(BaseConcept_Behavior.call_getPresentation_1213877396640(SLinkOperations.getTarget(thisNode, "terminateType", true)));
    return sb.append("}").toString();
  }

  public static String virtual_getRuntimeClassName_1230472987259(SNode thisNode) {
    return "_UnrestrictedFunctionTypes";
  }

  public static String virtual_getRuntimeSignature_1213877404927(SNode thisNode) {
    StringBuilder sb = new StringBuilder();
    if ((FunctionType_Behavior.call_getResultType_1230475757059(thisNode) != null)) {
      sb.append("_return");
    } else {
      sb.append("_void");
    }
    if ((FunctionType_Behavior.call_getTerminateType_1232032188607(thisNode) != null)) {
      sb.append("_terminate");
    } else {
      sb.append("_void");
    }
    sb.append("_P").append(ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameterType", true)).count());
    sb.append("_E").append(ListSequence.fromList(FunctionType_Behavior.call_getNormalizedThrowsTypes_3448422702164385781(thisNode)).count());
    return sb.toString();
  }

  public static String call_getRuntimeAdapterClassName_1231423631922(SNode thisNode) {
    return "_UnrestrictedClosures";
  }

  public static SNode virtual_getTerminateType_1232032188607(SNode thisNode) {
    SNode tt = SLinkOperations.getTarget(thisNode, "terminateType", true);
    if (SNodeOperations.isInstanceOf(tt, "jetbrains.mps.lang.typesystem.structure.MeetType")) {
      List<SNode> args = SLinkOperations.getTargets(SNodeOperations.cast(tt, "jetbrains.mps.lang.typesystem.structure.MeetType"), "argument", true);
      tt = ListSequence.fromList(args).getElement(0);
    }
    return ((tt != null) && !(SNodeOperations.isInstanceOf(tt, "jetbrains.mps.baseLanguage.structure.VoidType")) ?
      tt :
      null
    );
  }

  public static String call_getRuntimeSignature_3841277577642912754(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (String) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.closures.structure.UnrestrictedFunctionType"), "virtual_getRuntimeSignature_1213877404927", PARAMETERS_3841277577642912754);
  }

  public static String callSuper_getRuntimeSignature_3841277577642912754(SNode thisNode, String callerConceptFqName) {
    return (String) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.closures.structure.UnrestrictedFunctionType"), callerConceptFqName, "virtual_getRuntimeSignature_1213877404927", PARAMETERS_3841277577642912754);
  }
}
