package jetbrains.mps.lang.smodel.behavior;

/*Generated by MPS */

import org.jetbrains.annotations.NotNull;
import java.util.List;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.IScope;

public class LanguageReferenceExpression_BehaviorDescriptor extends ModuleReferenceExpression_BehaviorDescriptor {
  public LanguageReferenceExpression_BehaviorDescriptor() {
  }

  @NotNull
  public List<IModule> virtual_getVisibleModules_4040588429969394404(SNode thisNode, IScope scope) {
    return LanguageReferenceExpression_Behavior.virtual_getVisibleModules_4040588429969394404(thisNode, scope);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.lang.smodel.structure.LanguageReferenceExpression";
  }
}
