package jetbrains.mps.lang.editor.typesystem;

/*Generated by MPS */

import jetbrains.mps.lang.typesystem.runtime.AbstractInferenceRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.InferenceRule_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.lang.structure.behavior.LinkDeclaration_Behavior;
import jetbrains.mps.smodel.SModelUtil_new;

public class check_CellModel_RefNode_InferenceRule extends AbstractInferenceRule_Runtime implements InferenceRule_Runtime {
  public check_CellModel_RefNode_InferenceRule() {
  }

  public void applyRule(final SNode refNode, final TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    SNode lnk = SLinkOperations.getTarget(refNode, "relationDeclaration", false);
    if (!(SPropertyOperations.hasValue(lnk, "metaClass", "aggregation", "reference"))) {
      MessageTarget errorTarget = new NodeMessageTarget();
      IErrorReporter _reporter_2309309498 = typeCheckingContext.reportTypeError(refNode, "aggregation link expected", "r:00000000-0000-4000-0000-011c8959029a(jetbrains.mps.lang.editor.typesystem)", "1180280667546", null, errorTarget);
    }
    if (!(LinkDeclaration_Behavior.call_isSingular_1213877254557(lnk))) {
      MessageTarget errorTarget = new NodeMessageTarget();
      IErrorReporter _reporter_2309309498 = typeCheckingContext.reportTypeError(refNode, "single cardinality expected", "r:00000000-0000-4000-0000-011c8959029a(jetbrains.mps.lang.editor.typesystem)", "1180280735244", null, errorTarget);
    }
  }

  public String getApplicableConceptFQName() {
    return "jetbrains.mps.lang.editor.structure.CellModel_RefNode";
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
