package jetbrains.mps.ui.modeling.typesystem;

/*Generated by MPS */

import jetbrains.mps.lang.typesystem.runtime.AbstractNonTypesystemRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.NonTypesystemRule_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.smodel.SModelUtil_new;

public class check_IAspectParameterHolder_NonTypesystemRule extends AbstractNonTypesystemRule_Runtime implements NonTypesystemRule_Runtime {
  public check_IAspectParameterHolder_NonTypesystemRule() {
  }

  public void applyRule(final SNode hld, final TypeCheckingContext typeCheckingContext, IsApplicableStatus status) {
    if (!(ListSequence.fromList(SLinkOperations.getTargets(SLinkOperations.getTarget(SNodeOperations.getAncestor(hld, "jetbrains.mps.ui.modeling.structure.ContainerTemplate", false, false), "container", false), "requiredAspect", true)).disjunction(ListSequence.fromList(SLinkOperations.getTargets(hld, "aspectParameter", true)).select(new ISelector<SNode, SNode>() {
      public SNode select(SNode it) {
        return SLinkOperations.getTarget(it, "aspectDef", false);
      }
    })).isEmpty())) {
      MessageTarget errorTarget = new NodeMessageTarget();
      IErrorReporter _reporter_2309309498 = typeCheckingContext.reportTypeError(hld, "Wrong aspect parameters", "r:a301270c-6f4f-43ab-84f3-d9145aa32bc7(jetbrains.mps.ui.modeling.typesystem)", "5572604531249544236", null, errorTarget);
    }
  }

  public String getApplicableConceptFQName() {
    return "jetbrains.mps.ui.modeling.structure.IAspectParameterHolder";
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
