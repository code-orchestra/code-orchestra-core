package jetbrains.mpslite.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.core.behavior.BaseConcept_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;
import java.util.Map;
import jetbrains.mps.lang.core.behavior.INamedConcept_Behavior;

public class VariableConcept_BehaviorDescriptor extends BaseConcept_BehaviorDescriptor implements IMPSLiteConcept_BehaviorDescriptor {
  public VariableConcept_BehaviorDescriptor() {
  }

  public SNode virtual_createEditor_1239890004879(SNode thisNode, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    return VariableConcept_Behavior.virtual_createEditor_1239890004879(thisNode, conceptsToTargets, partsToLinks);
  }

  public void virtual_fillConcept_1239891562930(SNode thisNode, SNode concept, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    VariableConcept_Behavior.virtual_fillConcept_1239891562930(thisNode, concept, conceptsToTargets, partsToLinks);
  }

  public SNode virtual_createAdditionalConcept_1239817368042(SNode thisNode, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    return VariableConcept_Behavior.virtual_createAdditionalConcept_1239817368042(thisNode, conceptsToTargets, partsToLinks);
  }

  public boolean virtual_isRootable_1239714833738(SNode thisNode) {
    return VariableConcept_Behavior.virtual_isRootable_1239714833738(thisNode);
  }

  public boolean virtual_isAbstract_1239715026284(SNode thisNode) {
    return VariableConcept_Behavior.virtual_isAbstract_1239715026284(thisNode);
  }

  public String virtual_getFqName_1213877404258(SNode thisNode) {
    return INamedConcept_Behavior.virtual_getFqName_1213877404258(thisNode);
  }

  public SNode virtual_createAdditionalEditor_1239891670850(SNode thisNode, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    return VariableConcept_Behavior.virtual_createAdditionalEditor_1239891670850(thisNode, conceptsToTargets, partsToLinks);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mpslite.structure.VariableConcept";
  }
}
