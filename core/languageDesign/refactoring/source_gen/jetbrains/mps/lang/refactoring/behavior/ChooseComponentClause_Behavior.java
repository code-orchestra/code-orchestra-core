package jetbrains.mps.lang.refactoring.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class ChooseComponentClause_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode virtual_getExpectedReturnType_1213877374441(SNode thisNode) {
    SNode elementType = SLinkOperations.getTarget(SNodeOperations.cast(SNodeOperations.getParent(thisNode), "jetbrains.mps.lang.refactoring.structure.RequiredUserEnteredArgument"), "argumentType", true);
    return new ChooseComponentClause_Behavior.QuotationClass_oxr3se_a0b0b().createNode(elementType);
  }

  public static class QuotationClass_oxr3se_a0b0b {
    public QuotationClass_oxr3se_a0b0b() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ClassifierType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.addReference(SReference.create("classifier", quotedNode1_3, SModelReference.fromString("f:java_stub#jetbrains.mps.refactoring.framework(jetbrains.mps.refactoring.framework@java_stub)"), SNodeId.fromString("~IChooseComponent")));
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
            quotedNode_1.addChild("parameter", HUtil.copyIfNecessary(quotedNode1_4));
          }
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }
}
