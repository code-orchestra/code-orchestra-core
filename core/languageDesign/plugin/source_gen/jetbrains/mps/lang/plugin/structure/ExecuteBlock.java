package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExecuteBlock extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.ExecuteBlock";

  public ExecuteBlock(SNode node) {
    super(node);
  }

  public static ExecuteBlock newInstance(SModel sm, boolean init) {
    return (ExecuteBlock) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.ExecuteBlock", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExecuteBlock newInstance(SModel sm) {
    return ExecuteBlock.newInstance(sm, false);
  }
}
