package jetbrains.mps.baseLanguage.typesystem;

/*Generated by MPS */

import jetbrains.mps.lang.typesystem.runtime.AbstractInequationReplacementRule_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.lang.typesystem.runtime.IsApplicable2Status;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.smodel.SModelUtil_new;

public class subtypesOfLowerBoundType_InequationReplacementRule extends AbstractInequationReplacementRule_Runtime {
  public subtypesOfLowerBoundType_InequationReplacementRule() {
  }

  public void processInequation(final SNode subtype, final SNode supertype, final EquationInfo equationInfo, final TypeCheckingContext typeCheckingContext, IsApplicable2Status status, final boolean inequalityIsWeak, final boolean inequalityIsLessThan) {
    if (SNodeOperations.isInstanceOf(subtype, "jetbrains.mps.baseLanguage.structure.LowerBoundType")) {
      {
        SNode _nodeToCheck_1029348928467 = equationInfo.getNodeWithError();
        EquationInfo _info_12389875345 = new EquationInfo(_nodeToCheck_1029348928467, null, "r:00000000-0000-4000-0000-011c895902c5(jetbrains.mps.baseLanguage.typesystem)", "4691618959158120669", 0, null);
        _info_12389875345.getOuterRulesIdFromInfo(equationInfo);
        typeCheckingContext.createGreaterThanInequality((SNode) SNodeOperations.cast(subtype, "jetbrains.mps.baseLanguage.structure.LowerBoundType"), (SNode) SLinkOperations.getTarget(supertype, "bound", true), false, true, _info_12389875345);
      }
    } else {
      {
        SNode _nodeToCheck_1029348928467 = equationInfo.getNodeWithError();
        EquationInfo _info_12389875345 = new EquationInfo(_nodeToCheck_1029348928467, null, "r:00000000-0000-4000-0000-011c895902c5(jetbrains.mps.baseLanguage.typesystem)", "4691618959158120638", 0, null);
        _info_12389875345.getOuterRulesIdFromInfo(equationInfo);
        typeCheckingContext.createGreaterThanInequality((SNode) subtype, (SNode) SLinkOperations.getTarget(supertype, "bound", true), false, true, _info_12389875345);
      }
    }
  }

  public boolean checkInequation(final SNode subtype, final SNode supertype, final EquationInfo equationInfo, IsApplicable2Status status, final boolean inequalityIsWeak, final boolean inequalityIsLessThan) {
    boolean result_14532009 = true;
    if (SNodeOperations.isInstanceOf(subtype, "jetbrains.mps.baseLanguage.structure.LowerBoundType")) {
      result_14532009 = result_14532009 && TypeChecker.getInstance().getSubtypingManager().isSubtype((SNode) SLinkOperations.getTarget(supertype, "bound", true), (SNode) SNodeOperations.cast(subtype, "jetbrains.mps.baseLanguage.structure.LowerBoundType"), true);
    } else {
      result_14532009 = result_14532009 && TypeChecker.getInstance().getSubtypingManager().isSubtype((SNode) SLinkOperations.getTarget(supertype, "bound", true), (SNode) subtype, true);
    }
    return result_14532009;
  }

  public boolean isWeak() {
    return true;
  }

  public IsApplicableStatus isApplicableSubtypeAndPattern(SNode node) {
    {
      boolean b = SModelUtil_new.isAssignableConcept(node.getConceptFqName(), this.getApplicableSubtypeConceptFQName());
      return new IsApplicableStatus(b, null);
    }
  }

  public IsApplicableStatus isApplicableSupertypeAndPattern(SNode node) {
    {
      boolean b = SModelUtil_new.isAssignableConcept(node.getConceptFqName(), this.getApplicableSupertypeConceptFQName());
      return new IsApplicableStatus(b, null);
    }
  }

  public String getApplicableSubtypeConceptFQName() {
    return "jetbrains.mps.baseLanguage.structure.Type";
  }

  public String getApplicableSupertypeConceptFQName() {
    return "jetbrains.mps.baseLanguage.structure.LowerBoundType";
  }
}
