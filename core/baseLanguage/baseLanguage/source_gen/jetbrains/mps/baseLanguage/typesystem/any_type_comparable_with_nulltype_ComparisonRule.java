package jetbrains.mps.baseLanguage.typesystem;

/*Generated by MPS */

import jetbrains.mps.lang.typesystem.runtime.ComparisonRule_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.typesystem.runtime.IsApplicable2Status;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.smodel.SModelUtil_new;

public class any_type_comparable_with_nulltype_ComparisonRule extends ComparisonRule_Runtime {
  public any_type_comparable_with_nulltype_ComparisonRule() {
  }

  public boolean areComparable(SNode node1, SNode node2, IsApplicable2Status status) {
    if (SNodeOperations.isInstanceOf(node1, "jetbrains.mps.baseLanguage.structure.PrimitiveType") || SNodeOperations.isInstanceOf(node1, "jetbrains.mps.baseLanguage.blTypes.structure.PrimitiveTypeDescriptor")) {
      return false;
    }
    return true;
  }

  public boolean isWeak() {
    return true;
  }

  public IsApplicableStatus isApplicableFirst(SNode node) {
    {
      boolean b = SModelUtil_new.isAssignableConcept(node.getConceptFqName(), this.getApplicableConceptFQName1());
      return new IsApplicableStatus(b, null);
    }
  }

  public IsApplicableStatus isApplicableSecond(SNode node) {
    {
      boolean b = SModelUtil_new.isAssignableConcept(node.getConceptFqName(), this.getApplicableConceptFQName2());
      return new IsApplicableStatus(b, null);
    }
  }

  public String getApplicableConceptFQName1() {
    return "jetbrains.mps.lang.core.structure.BaseConcept";
  }

  public String getApplicableConceptFQName2() {
    return "jetbrains.mps.baseLanguage.structure.NullType";
  }
}
