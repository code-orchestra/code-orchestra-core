package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExcludeOperation extends BinaryOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.ExcludeOperation";

  public ExcludeOperation(SNode node) {
    super(node);
  }

  public static ExcludeOperation newInstance(SModel sm, boolean init) {
    return (ExcludeOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.ExcludeOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExcludeOperation newInstance(SModel sm) {
    return ExcludeOperation.newInstance(sm, false);
  }
}
