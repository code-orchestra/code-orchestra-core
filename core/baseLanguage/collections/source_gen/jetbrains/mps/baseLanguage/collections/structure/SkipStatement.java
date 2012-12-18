package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Statement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SkipStatement extends Statement {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.SkipStatement";

  public SkipStatement(SNode node) {
    super(node);
  }

  public static SkipStatement newInstance(SModel sm, boolean init) {
    return (SkipStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SkipStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SkipStatement newInstance(SModel sm) {
    return SkipStatement.newInstance(sm, false);
  }
}
