package jetbrains.mps.ui.modeling.behavior;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.behavior.ConceptFunction_BehaviorDescriptor;
import java.util.List;
import jetbrains.mps.smodel.SNode;

public class UIObjectFactory_BehaviorDescriptor extends ConceptFunction_BehaviorDescriptor {
  public UIObjectFactory_BehaviorDescriptor() {
  }

  public List<SNode> virtual_getParameters_1213877374450(SNode thisNode) {
    return UIObjectFactory_Behavior.virtual_getParameters_1213877374450(thisNode);
  }

  public SNode virtual_getExpectedReturnType_1213877374441(SNode thisNode) {
    return UIObjectFactory_Behavior.virtual_getExpectedReturnType_1213877374441(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.ui.modeling.structure.UIObjectFactory";
  }
}
