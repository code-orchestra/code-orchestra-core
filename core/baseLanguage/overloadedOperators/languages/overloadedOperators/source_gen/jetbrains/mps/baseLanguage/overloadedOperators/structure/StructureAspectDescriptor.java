package jetbrains.mps.baseLanguage.overloadedOperators.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.impl.CompiledConceptDescriptor;
import jetbrains.mps.smodel.runtime.interpreted.StructureAspectInterpreted;

public class StructureAspectDescriptor implements jetbrains.mps.smodel.runtime.StructureAspectDescriptor {
  private static String[] stringSwitchCases_1htk8d_a0a0a = new String[]{"jetbrains.mps.baseLanguage.overloadedOperators.structure.BinaryOperationReference", "jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperator", "jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperatorDeclaration", "jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperatorUsage", "jetbrains.mps.baseLanguage.overloadedOperators.structure.LeftOperand", "jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator", "jetbrains.mps.baseLanguage.overloadedOperators.structure.OverloadedBinaryOperator", "jetbrains.mps.baseLanguage.overloadedOperators.structure.OverloadedOperatorContainer", "jetbrains.mps.baseLanguage.overloadedOperators.structure.RightOperand"};

  public StructureAspectDescriptor() {
  }

  public ConceptDescriptor getDescriptor(String conceptFqName) {
    switch (Arrays.binarySearch(stringSwitchCases_1htk8d_a0a0a, conceptFqName)) {
      case 0:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.BinaryOperationReference", "jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator", false, new String[]{"jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator"}, new String[]{}, new String[]{"binaryOperation"});
      case 1:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperator", "jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator", false, new String[]{"jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator"}, new String[]{}, new String[]{"declaration"});
      case 2:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperatorDeclaration", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{}, new String[]{});
      case 3:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.CustomOperatorUsage", "jetbrains.mps.baseLanguage.structure.BinaryOperation", false, new String[]{"jetbrains.mps.baseLanguage.structure.BinaryOperation"}, new String[]{}, new String[]{"operator"});
      case 4:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.LeftOperand", "jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter", false, new String[]{"jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{}, new String[]{});
      case 5:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.Operator", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept"}, new String[]{}, new String[]{});
      case 6:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.OverloadedBinaryOperator", "jetbrains.mps.baseLanguage.structure.ConceptFunction", false, new String[]{"jetbrains.mps.baseLanguage.structure.ConceptFunction"}, new String[]{"commutative"}, new String[]{});
      case 7:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.OverloadedOperatorContainer", "jetbrains.mps.lang.core.structure.BaseConcept", false, new String[]{"jetbrains.mps.lang.core.structure.BaseConcept", "jetbrains.mps.lang.core.structure.INamedConcept"}, new String[]{}, new String[]{});
      case 8:
        return new CompiledConceptDescriptor("jetbrains.mps.baseLanguage.overloadedOperators.structure.RightOperand", "jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter", false, new String[]{"jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter"}, new String[]{}, new String[]{});
      default:
        return StructureAspectInterpreted.getInstance().getDescriptor(conceptFqName);
    }
  }
}
