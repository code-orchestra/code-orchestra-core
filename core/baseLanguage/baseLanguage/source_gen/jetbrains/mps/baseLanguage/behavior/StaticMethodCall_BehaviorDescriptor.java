package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import java.util.List;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.project.IModule;

public class StaticMethodCall_BehaviorDescriptor extends BaseMethodCall_BehaviorDescriptor {
  public StaticMethodCall_BehaviorDescriptor() {
  }

  public List<SNode> virtual_getAvailableMethodDeclarations_5776618742611315379(SNode thisNode, String methodName) {
    return StaticMethodCall_Behavior.virtual_getAvailableMethodDeclarations_5776618742611315379(thisNode, methodName);
  }

  public Object virtual_eval_1213877519769(SNode thisNode, @NotNull IModule module) {
    return StaticMethodCall_Behavior.virtual_eval_1213877519769(thisNode, module);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.baseLanguage.structure.StaticMethodCall";
  }
}
