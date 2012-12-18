package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AbsDateTimeMinusOperation extends DateTimeMinusOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.AbsDateTimeMinusOperation";

  public AbsDateTimeMinusOperation(SNode node) {
    super(node);
  }

  public static AbsDateTimeMinusOperation newInstance(SModel sm, boolean init) {
    return (AbsDateTimeMinusOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.AbsDateTimeMinusOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AbsDateTimeMinusOperation newInstance(SModel sm) {
    return AbsDateTimeMinusOperation.newInstance(sm, false);
  }
}
