package jetbrains.mps.baseLanguage.runConfigurations.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.core.behavior.BaseConcept_BehaviorDescriptor;
import jetbrains.mps.lang.plugin.behavior.IRunConfigPropertyInstance_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.core.behavior.INamedConcept_Behavior;

public class NodeRunConfigPropertyInstance_BehaviorDescriptor extends BaseConcept_BehaviorDescriptor implements IRunConfigPropertyInstance_BehaviorDescriptor {
  public NodeRunConfigPropertyInstance_BehaviorDescriptor() {
  }

  public String virtual_getFqName_1213877404258(SNode thisNode) {
    return INamedConcept_Behavior.virtual_getFqName_1213877404258(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.runConfigurations.structure.NodeRunConfigPropertyInstance";
  }
}
