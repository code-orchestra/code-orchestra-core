package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class NotNullOperation extends DateTimeOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.NotNullOperation";

  public NotNullOperation(SNode node) {
    super(node);
  }

  public static NotNullOperation newInstance(SModel sm, boolean init) {
    return (NotNullOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.NotNullOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static NotNullOperation newInstance(SModel sm) {
    return NotNullOperation.newInstance(sm, false);
  }
}
