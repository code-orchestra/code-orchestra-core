package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import java.util.List;
import jetbrains.mps.smodel.SNode;

public class LocalStaticMethodCall_BehaviorDescriptor extends BaseMethodCall_BehaviorDescriptor {
  public LocalStaticMethodCall_BehaviorDescriptor() {
  }

  public List<SNode> virtual_getAvailableMethodDeclarations_5776618742611315379(SNode thisNode, String methodName) {
    return LocalStaticMethodCall_Behavior.virtual_getAvailableMethodDeclarations_5776618742611315379(thisNode, methodName);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.structure.LocalStaticMethodCall";
  }
}
