package jetbrains.mps.lang.constraints.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.baseLanguage.typesystem.RulesFunctions_BaseLanguage;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.baseLanguage.behavior.IMethodLike_Behavior;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;

public class ConstraintFunction_ReferentSearchScope_Factory_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode virtual_getExpectedReturnType_1213877374441(SNode thisNode) {
    SNode target = SLinkOperations.getTarget(SLinkOperations.getTarget(SNodeOperations.getAncestor(thisNode, "jetbrains.mps.lang.constraints.structure.NodeReferentConstraint", false, false), "applicableLink", false), "target", false);
    if ((target == null)) {
      target = SLinkOperations.getTarget(SNodeOperations.getAncestor(thisNode, "jetbrains.mps.lang.constraints.structure.ConceptConstraints", false, false), "concept", false);
    }
    return new ConstraintFunction_ReferentSearchScope_Factory_Behavior.QuotationClass_q6xvx3_a0c0b().createNode(target);
  }

  public static boolean call_isNodeSequenceReturned_2990203945683056978(SNode thisNode) {
    if ((SLinkOperations.getTarget(thisNode, "body", true) == null)) {
      return false;
    }
    SNode sequenceType = new ConstraintFunction_ReferentSearchScope_Factory_Behavior.QuotationClass_q6xvx3_a0a1a2().createNode();
    for (SNode returnStatement : Sequence.fromIterable(RulesFunctions_BaseLanguage.collectReturnStatements(SLinkOperations.getTarget(thisNode, "body", true)))) {
      if (!(TypeChecker.getInstance().getSubtypingManager().isSubtype(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(returnStatement, "expression", true)), sequenceType))) {
        return false;
      }
    }
    SNode lastStmt = IMethodLike_Behavior.call_getLastStatement_1239354409446(thisNode);
    if (SNodeOperations.isInstanceOf(lastStmt, "jetbrains.mps.baseLanguage.structure.ExpressionStatement")) {
      return TypeChecker.getInstance().getSubtypingManager().isSubtype(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(SNodeOperations.cast(lastStmt, "jetbrains.mps.baseLanguage.structure.ExpressionStatement"), "expression", true)), sequenceType);
    }
    return true;
  }

  public static boolean call_isValidatorGenerated_522233044824082130(SNode thisNode) {
    return (ConstraintFunction_ReferentSearchScope_Factory_Behavior.call_getValidator_2990203945683058946(thisNode) != null) && ConstraintFunction_ReferentSearchScope_Factory_Behavior.call_isNodeSequenceReturned_2990203945683056978(thisNode);
  }

  public static SNode call_getValidator_2990203945683058946(SNode thisNode) {
    return (SNodeOperations.isInstanceOf(SNodeOperations.getParent(thisNode), "jetbrains.mps.lang.constraints.structure.NodeDefaultSearchScope") ?
      SLinkOperations.getTarget(SNodeOperations.cast(SNodeOperations.getParent(thisNode), "jetbrains.mps.lang.constraints.structure.NodeDefaultSearchScope"), "validator", true) :
      (SNodeOperations.isInstanceOf(SNodeOperations.getParent(thisNode), "jetbrains.mps.lang.constraints.structure.NodeReferentConstraint") ?
        SLinkOperations.getTarget(SNodeOperations.cast(SNodeOperations.getParent(thisNode), "jetbrains.mps.lang.constraints.structure.NodeReferentConstraint"), "validator", true) :
        null
      )
    );
  }

  public static class QuotationClass_q6xvx3_a0c0b {
    public QuotationClass_q6xvx3_a0c0b() {
    }

    public SNode createNode(Object parameter_9) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      SNode quotedNode_3 = null;
      SNode quotedNode_4 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.JoinType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_5 = quotedNode_1;
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ClassifierType", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_6 = quotedNode_2;
          quotedNode1_6.addReference(SReference.create("classifier", quotedNode1_6, SModelReference.fromString("r:22db907b-8239-4180-8797-e91cea0b9573(jetbrains.mps.smodel.search)"), SNodeId.fromString("4642948870877889221")));
          quotedNode_1.addChild("argument", quotedNode1_6);
        }
        {
          quotedNode_3 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SequenceType", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_7 = quotedNode_3;
          {
            quotedNode_4 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.SNodeType", null, GlobalScope.getInstance(), false);
            SNode quotedNode1_8 = quotedNode_4;
            quotedNode1_8.setReferent("concept", (SNode) parameter_9);
            quotedNode_3.addChild("elementType", quotedNode1_8);
          }
          quotedNode_1.addChild("argument", quotedNode1_7);
        }
        result = quotedNode1_5;
      }
      return result;
    }
  }

  public static class QuotationClass_q6xvx3_a0a1a2 {
    public QuotationClass_q6xvx3_a0a1a2() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SequenceType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.SNodeType", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_4 = quotedNode_2;
          quotedNode_1.addChild("elementType", quotedNode1_4);
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }
}
