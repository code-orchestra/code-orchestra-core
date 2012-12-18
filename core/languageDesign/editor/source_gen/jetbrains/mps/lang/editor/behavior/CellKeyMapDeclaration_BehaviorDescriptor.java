package jetbrains.mps.lang.editor.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.core.behavior.BaseConcept_BehaviorDescriptor;
import jetbrains.mps.lang.core.behavior.INamedConcept_BehaviorDescriptor;
import jetbrains.mps.lang.structure.behavior.IConceptAspect_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.behavior.IConceptAspect_Behavior;
import java.util.List;
import jetbrains.mps.lang.core.behavior.INamedConcept_Behavior;

public class CellKeyMapDeclaration_BehaviorDescriptor extends BaseConcept_BehaviorDescriptor implements INamedConcept_BehaviorDescriptor, IConceptAspect_BehaviorDescriptor {
  public CellKeyMapDeclaration_BehaviorDescriptor() {
  }

  public boolean virtual_isApplicable_7839831476331657915(SNode thisNode, SNode candidate) {
    return IConceptAspect_Behavior.virtual_isApplicable_7839831476331657915(thisNode, candidate);
  }

  public List<SNode> virtual_getBaseConceptCollection_5270353093116013036(SNode thisNode) {
    return IConceptAspect_Behavior.virtual_getBaseConceptCollection_5270353093116013036(thisNode);
  }

  public SNode virtual_getBaseConcept_2621449412040133768(SNode thisNode) {
    return CellKeyMapDeclaration_Behavior.virtual_getBaseConcept_2621449412040133768(thisNode);
  }

  public void virtual_setBaseConcept_6261424444345963020(SNode thisNode, SNode baseConcept) {
    CellKeyMapDeclaration_Behavior.virtual_setBaseConcept_6261424444345963020(thisNode, baseConcept);
  }

  public String virtual_getFqName_1213877404258(SNode thisNode) {
    return INamedConcept_Behavior.virtual_getFqName_1213877404258(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.lang.editor.structure.CellKeyMapDeclaration";
  }
}
