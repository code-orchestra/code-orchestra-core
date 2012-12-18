package jetbrains.mps.lang.generator.typesystem;

/*Generated by MPS */

import jetbrains.mps.lang.typesystem.runtime.AbstractNonTypesystemRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.NonTypesystemRule_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.smodel.SModelUtil_new;

public class check_NodeMacro_NonTypesystemRule extends AbstractNonTypesystemRule_Runtime implements NonTypesystemRule_Runtime {
  public check_NodeMacro_NonTypesystemRule() {
  }

  public void applyRule(final SNode macro, final TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    if (SNodeOperations.getAncestor(macro, "jetbrains.mps.lang.generator.structure.TemplateDeclaration", false, false) != null) {
      if (QueriesUtil.getEnclosing_TemplateFragment(SNodeOperations.getParent(macro)) == null) {
        {
          MessageTarget errorTarget = new NodeMessageTarget();
          IErrorReporter _reporter_2309309498 = typeCheckingContext.reportTypeError(macro, "Macro is outside a Template Fragment", "r:00000000-0000-4000-0000-011c895902e4(jetbrains.mps.lang.generator.typesystem)", "1226346325150", null, errorTarget);
        }
      }
    }
  }

  public String getApplicableConceptFQName() {
    return "jetbrains.mps.lang.generator.structure.NodeMacro";
  }

  public IsApplicableStatus isApplicableAndPattern(SNode argument) {
    {
      boolean b = SModelUtil_new.isAssignableConcept(argument.getConceptFqName(), this.getApplicableConceptFQName());
      return new IsApplicableStatus(b, null);
    }
  }

  public boolean overrides() {
    return false;
  }
}
