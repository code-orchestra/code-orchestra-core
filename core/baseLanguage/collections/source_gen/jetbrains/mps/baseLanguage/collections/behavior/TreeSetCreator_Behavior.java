package jetbrains.mps.baseLanguage.collections.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class TreeSetCreator_Behavior {
  private static Class[] PARAMETERS_2261417478150191164 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  public static SNode virtual_createType_1237722437229(SNode thisNode) {
    return new TreeSetCreator_Behavior.QuotationClass_529210_a0a0b().createNode(SLinkOperations.getTarget(thisNode, "elementType", true));
  }

  public static boolean virtual_canHaveParameter_2261417478150191157(SNode thisNode) {
    return AbstractContainerCreator_Behavior.callSuper_canHaveParameter_2261417478150191157(thisNode, "jetbrains.mps.baseLanguage.collections.structure.TreeSetCreator") && (SLinkOperations.getTarget(thisNode, "comparator", true) == null);
  }

  public static boolean call_canHaveParameter_2261417478150191164(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (Boolean) descriptor.invoke(Boolean.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.collections.structure.TreeSetCreator"), "virtual_canHaveParameter_2261417478150191157", PARAMETERS_2261417478150191164);
  }

  public static boolean callSuper_canHaveParameter_2261417478150191164(SNode thisNode, String callerConceptFqName) {
    return (Boolean) BehaviorManager.getInstance().invokeSuper(Boolean.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.collections.structure.TreeSetCreator"), callerConceptFqName, "virtual_canHaveParameter_2261417478150191157", PARAMETERS_2261417478150191164);
  }

  public static class QuotationClass_529210_a0a0b {
    public QuotationClass_529210_a0a0b() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SortedSetType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        {
          quotedNode_2 = (SNode) parameter_5;
          SNode quotedNode1_4;
          if (_parameterValues_129834374.contains(quotedNode_2)) {
            quotedNode1_4 = HUtil.copyIfNecessary(quotedNode_2);
          } else {
            _parameterValues_129834374.add(quotedNode_2);
            quotedNode1_4 = quotedNode_2;
          }
          if (quotedNode1_4 != null) {
            quotedNode_1.addChild("elementType", HUtil.copyIfNecessary(quotedNode1_4));
          }
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }
}
