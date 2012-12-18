package jetbrains.mps.lang.typesystem.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;

public class ConstraintsAspectDescriptor implements jetbrains.mps.smodel.runtime.ConstraintsAspectDescriptor {
  private static String[] stringSwitchCases_2qnle6_a0a0a = new String[]{"jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference", "jetbrains.mps.lang.typesystem.structure.CaretPositionOperation", "jetbrains.mps.lang.typesystem.structure.ChildTypeRestriction", "jetbrains.mps.lang.typesystem.structure.ChildTypeRestrictionReference", "jetbrains.mps.lang.typesystem.structure.ComparisonRule", "jetbrains.mps.lang.typesystem.structure.ConceptClauseLinkInfo", "jetbrains.mps.lang.typesystem.structure.ConceptReference", "jetbrains.mps.lang.typesystem.structure.ConceptTypeClause", "jetbrains.mps.lang.typesystem.structure.InequationReference", "jetbrains.mps.lang.typesystem.structure.InequationReplacementRule", "jetbrains.mps.lang.typesystem.structure.InferenceRule", "jetbrains.mps.lang.typesystem.structure.LinkPatternVariableReference", "jetbrains.mps.lang.typesystem.structure.MessageStatement", "jetbrains.mps.lang.typesystem.structure.NonTypesystemRule", "jetbrains.mps.lang.typesystem.structure.OperationContextExpression", "jetbrains.mps.lang.typesystem.structure.PatternVariableReference", "jetbrains.mps.lang.typesystem.structure.PropertyMessageTarget", "jetbrains.mps.lang.typesystem.structure.PropertyPatternVariableReference", "jetbrains.mps.lang.typesystem.structure.QuickFixArgumentReference", "jetbrains.mps.lang.typesystem.structure.QuickFixFieldReference", "jetbrains.mps.lang.typesystem.structure.ReferenceMessageTarget", "jetbrains.mps.lang.typesystem.structure.SubtypingRule", "jetbrains.mps.lang.typesystem.structure.TypeVarReference", "jetbrains.mps.lang.typesystem.structure.TypesystemIntentionArgument", "jetbrains.mps.lang.typesystem.structure.TypesystemQuickFix", "jetbrains.mps.lang.typesystem.structure.WasSelectedNodeOperation", "jetbrains.mps.lang.typesystem.structure.WhenConcreteVariableReference"};

  public ConstraintsAspectDescriptor() {
  }

  public ConstraintsDescriptor getDescriptor(String fqName) {
    switch (Arrays.binarySearch(stringSwitchCases_2qnle6_a0a0a, fqName)) {
      case 3:
        return new ChildTypeRestrictionReference_Constraints();
      case 26:
        return new WhenConcreteVariableReference_Constraints();
      case 17:
        return new PropertyPatternVariableReference_Constraints();
      case 11:
        return new LinkPatternVariableReference_Constraints();
      case 15:
        return new PatternVariableReference_Constraints();
      case 22:
        return new TypeVarReference_Constraints();
      case 2:
        return new ChildTypeRestriction_Constraints();
      case 6:
        return new ConceptReference_Constraints();
      case 0:
        return new ApplicableNodeReference_Constraints();
      case 23:
        return new TypesystemIntentionArgument_Constraints();
      case 18:
        return new QuickFixArgumentReference_Constraints();
      case 10:
        return new InferenceRule_Constraints();
      case 4:
        return new ComparisonRule_Constraints();
      case 24:
        return new TypesystemQuickFix_Constraints();
      case 9:
        return new InequationReplacementRule_Constraints();
      case 13:
        return new NonTypesystemRule_Constraints();
      case 21:
        return new SubtypingRule_Constraints();
      case 16:
        return new PropertyMessageTarget_Constraints();
      case 20:
        return new ReferenceMessageTarget_Constraints();
      case 7:
        return new ConceptTypeClause_Constraints();
      case 5:
        return new ConceptClauseLinkInfo_Constraints();
      case 12:
        return new MessageStatement_Constraints();
      case 14:
        return new OperationContextExpression_Constraints();
      case 8:
        return new InequationReference_Constraints();
      case 19:
        return new QuickFixFieldReference_Constraints();
      case 25:
        return new WasSelectedNodeOperation_Constraints();
      case 1:
        return new CaretPositionOperation_Constraints();
      default:
        // todo: illegal in some cases? 
        return new BaseConstraintsDescriptor(fqName);
    }
  }
}
