package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class InitTabBlock extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.InitTabBlock";

  public InitTabBlock(SNode node) {
    super(node);
  }

  public static InitTabBlock newInstance(SModel sm, boolean init) {
    return (InitTabBlock) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.InitTabBlock", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static InitTabBlock newInstance(SModel sm) {
    return InitTabBlock.newInstance(sm, false);
  }
}
