package jetbrains.mps.baseLanguage.classifiers.behavior;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.behavior.BaseMethodDeclaration_BehaviorDescriptor;
import jetbrains.mps.baseLanguage.behavior.IVisible_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;
import javax.swing.Icon;

public class DefaultClassifierMethodDeclaration_BehaviorDescriptor extends BaseMethodDeclaration_BehaviorDescriptor implements IMember_BehaviorDescriptor, IVisible_BehaviorDescriptor {
  public DefaultClassifierMethodDeclaration_BehaviorDescriptor() {
  }

  public SNode virtual_createOperation_1213877353000(SNode thisNode) {
    return IMember_Behavior.virtual_createOperation_1213877353000(thisNode);
  }

  public boolean virtual_canBeReferent_8179323502814657526(SNode thisNode, SNode referentConcept) {
    return IMember_Behavior.virtual_canBeReferent_8179323502814657526(thisNode, referentConcept);
  }

  public boolean virtual_canOperationBeChild_4593153787954614840(SNode thisNode, SNode parentNode) {
    return IMember_Behavior.virtual_canOperationBeChild_4593153787954614840(thisNode, parentNode);
  }

  public SNode virtual_getVisiblity_1213877352965(SNode thisNode) {
    return DefaultClassifierMethodDeclaration_Behavior.virtual_getVisiblity_1213877352965(thisNode);
  }

  public Icon virtual_getAdditionalIcon_5017341185733863694(SNode thisNode) {
    return DefaultClassifierMethodDeclaration_Behavior.virtual_getAdditionalIcon_5017341185733863694(thisNode);
  }

  public boolean virtual_canBeAnnotated_1233076312117(SNode thisNode) {
    return DefaultClassifierMethodDeclaration_Behavior.virtual_canBeAnnotated_1233076312117(thisNode);
  }

  public SNode virtual_getOperationConcept_1213877352972(SNode thisNode) {
    return IMember_Behavior.virtual_getOperationConcept_1213877352972(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.classifiers.structure.DefaultClassifierMethodDeclaration";
  }
}
