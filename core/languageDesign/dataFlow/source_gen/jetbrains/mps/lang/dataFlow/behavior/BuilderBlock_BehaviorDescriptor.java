package jetbrains.mps.lang.dataFlow.behavior;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.behavior.ConceptFunction_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;

public class BuilderBlock_BehaviorDescriptor extends ConceptFunction_BehaviorDescriptor {
  public BuilderBlock_BehaviorDescriptor() {
  }

  public boolean virtual_usesParameterObjectFor_1213877374432(SNode thisNode, SNode parameter) {
    return BuilderBlock_Behavior.virtual_usesParameterObjectFor_1213877374432(thisNode, parameter);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.lang.dataFlow.structure.BuilderBlock";
  }
}
