package jetbrains.mps.baseLanguage.tuples.behavior;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.behavior.Expression_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;

public class IndexedTupleMemberAccessExpression_BehaviorDescriptor extends Expression_BehaviorDescriptor {
  public IndexedTupleMemberAccessExpression_BehaviorDescriptor() {
  }

  public boolean virtual_isLValue_1213877519786(SNode thisNode) {
    return IndexedTupleMemberAccessExpression_Behavior.virtual_isLValue_1213877519786(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.tuples.structure.IndexedTupleMemberAccessExpression";
  }
}
