package jetbrains.mps.lang.refactoring.behavior;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.behavior.Expression_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;

public abstract class AbstractMoveExpression_BehaviorDescriptor extends Expression_BehaviorDescriptor implements RefactoringAction_BehaviorDescriptor {
  public AbstractMoveExpression_BehaviorDescriptor() {
  }

  public boolean virtual_isLegalAsStatement_1239211900844(SNode thisNode) {
    return AbstractMoveExpression_Behavior.virtual_isLegalAsStatement_1239211900844(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.lang.refactoring.structure.AbstractMoveExpression";
  }
}
