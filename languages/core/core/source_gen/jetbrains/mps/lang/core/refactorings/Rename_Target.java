package jetbrains.mps.lang.core.refactorings;

/*Generated by MPS */

import jetbrains.mps.refactoring.framework.IRefactoringTarget;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.SNode;

public class Rename_Target implements IRefactoringTarget {
  public Rename_Target() {
  }

  public IRefactoringTarget.TargetType getTarget() {
    return IRefactoringTarget.TargetType.NODE;
  }

  public boolean allowMultipleTargets() {
    return false;
  }

  public boolean isApplicableToEntityType(final Object entity) {
    // RE-772
    if (SNodeOperations.getModel(((SNode) entity)).isNotEditable()) {
      return false;
    }

    return SNodeOperations.isInstanceOf(((SNode) entity), "jetbrains.mps.lang.core.structure.INamedConcept");
  }

  public boolean isApplicable(final Object entity) {
    if (!(this.isApplicableToEntityType(entity))) {
      return false;
    }
    return true;
  }
}
