package jetbrains.mps.buildlanguage.behavior;

/*Generated by MPS */

import jetbrains.mps.lang.core.behavior.BaseConcept_BehaviorDescriptor;
import java.util.List;
import jetbrains.mps.smodel.SNode;

public abstract class PropertyValueExpression_BehaviorDescriptor extends BaseConcept_BehaviorDescriptor implements ISource_BehaviorDescriptor {
  public PropertyValueExpression_BehaviorDescriptor() {
  }

  public List<String> virtual_getPaths_1213877276955(SNode thisNode) {
    return PropertyValueExpression_Behavior.virtual_getPaths_1213877276955(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.buildlanguage.structure.PropertyValueExpression";
  }

  public abstract String virtual_toString_1213877472569(SNode thisNode);

  public abstract String virtual_getActualValue_1213877472572(SNode thisNode);
}
