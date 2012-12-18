package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExecuteSmartActionFunction extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.actions.structure.ExecuteSmartActionFunction";

  public ExecuteSmartActionFunction(SNode node) {
    super(node);
  }

  public static ExecuteSmartActionFunction newInstance(SModel sm, boolean init) {
    return (ExecuteSmartActionFunction) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.ExecuteSmartActionFunction", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExecuteSmartActionFunction newInstance(SModel sm) {
    return ExecuteSmartActionFunction.newInstance(sm, false);
  }
}
