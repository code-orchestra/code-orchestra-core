package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.traceable.behavior.ScopeConcept_BehaviorDescriptor;
import java.util.List;
import jetbrains.mps.smodel.SNode;

public class ForeachStatement_BehaviorDescriptor extends AbstractForStatement_BehaviorDescriptor implements ScopeConcept_BehaviorDescriptor {
  public ForeachStatement_BehaviorDescriptor() {
  }

  public List<SNode> virtual_getScopeVariables_5067982036267369894(SNode thisNode) {
    return ForeachStatement_Behavior.virtual_getScopeVariables_5067982036267369894(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.structure.ForeachStatement";
  }
}
