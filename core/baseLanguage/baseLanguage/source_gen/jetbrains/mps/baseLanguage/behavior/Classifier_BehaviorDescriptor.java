package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.core.behavior.IResolveInfo_BehaviorDescriptor;
import jetbrains.mps.lang.core.behavior.IContainer_BehaviorDescriptor;
import jetbrains.mps.smodel.SNode;
import java.util.List;
import javax.swing.Icon;
import java.util.Set;

public abstract class Classifier_BehaviorDescriptor extends GenericDeclaration_BehaviorDescriptor implements HasAnnotation_BehaviorDescriptor, IMemberContainer_BehaviorDescriptor, IResolveInfo_BehaviorDescriptor, IValidIdentifier_BehaviorDescriptor, IVisible_BehaviorDescriptor, IContainer_BehaviorDescriptor {
  public Classifier_BehaviorDescriptor() {
  }

  public boolean virtual_isDescendant_7165541881557222913(SNode thisNode, SNode nodeToCompare) {
    return Classifier_Behavior.virtual_isDescendant_7165541881557222913(thisNode, nodeToCompare);
  }

  public List<Icon> virtual_getMarkIcons_3923831204883340393(SNode thisNode) {
    return Classifier_Behavior.virtual_getMarkIcons_3923831204883340393(thisNode);
  }

  public List<SNode> virtual_getMethodsToOverride_5418393554803767537(SNode thisNode) {
    return IMemberContainer_Behavior.virtual_getMethodsToOverride_5418393554803767537(thisNode);
  }

  public String virtual_getPresentation_1213877396640(SNode thisNode) {
    return Classifier_Behavior.virtual_getPresentation_1213877396640(thisNode);
  }

  public String virtual_getNestedName_8540045600162184125(SNode thisNode) {
    return Classifier_Behavior.virtual_getNestedName_8540045600162184125(thisNode);
  }

  public SNode virtual_getThisType_3305065273710880775(SNode thisNode) {
    return Classifier_Behavior.virtual_getThisType_3305065273710880775(thisNode);
  }

  public boolean virtual_checkLoops_3980490811621705344(SNode thisNode) {
    return Classifier_Behavior.virtual_checkLoops_3980490811621705344(thisNode);
  }

  public List<SNode> virtual_getMembers_1213877531970(SNode thisNode) {
    return Classifier_Behavior.virtual_getMembers_1213877531970(thisNode);
  }

  public List<SNode> virtual_getOwnMethods_1906502351318572840(SNode thisNode) {
    return Classifier_Behavior.virtual_getOwnMethods_1906502351318572840(thisNode);
  }

  public List<SNode> virtual_getMethodsToImplement_5418393554803775106(SNode thisNode) {
    return IMemberContainer_Behavior.virtual_getMethodsToImplement_5418393554803775106(thisNode);
  }

  public Icon virtual_getAdditionalIcon_5017341185733863694(SNode thisNode) {
    return Classifier_Behavior.virtual_getAdditionalIcon_5017341185733863694(thisNode);
  }

  public boolean virtual_isDescendant_checkLoops_7165541881557222950(SNode thisNode, SNode nodeToCompare, Set<SNode> visited) {
    return Classifier_Behavior.virtual_isDescendant_checkLoops_7165541881557222950(thisNode, nodeToCompare, visited);
  }

  public List<SNode> virtual_getChildrenToDisplayIntention_4025276038182319200(SNode thisNode) {
    return HasAnnotation_Behavior.virtual_getChildrenToDisplayIntention_4025276038182319200(thisNode);
  }

  public boolean virtual_checkLoops_3980490811621705349(SNode thisNode, Set<SNode> visited) {
    return Classifier_Behavior.virtual_checkLoops_3980490811621705349(thisNode, visited);
  }

  public boolean virtual_canBeAnnotated_1233076312117(SNode thisNode) {
    return HasAnnotation_Behavior.virtual_canBeAnnotated_1233076312117(thisNode);
  }

  public boolean virtual_hasStaticMemebers_1214840444586(SNode thisNode) {
    return Classifier_Behavior.virtual_hasStaticMemebers_1214840444586(thisNode);
  }

  public String virtual_getFqName_1213877404258(SNode thisNode) {
    return Classifier_Behavior.virtual_getFqName_1213877404258(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.structure.Classifier";
  }
}
