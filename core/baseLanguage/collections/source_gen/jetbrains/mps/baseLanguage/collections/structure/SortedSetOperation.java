package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SortedSetOperation extends AbstractSetOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.SortedSetOperation";

  public SortedSetOperation(SNode node) {
    super(node);
  }

  public static SortedSetOperation newInstance(SModel sm, boolean init) {
    return (SortedSetOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SortedSetOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SortedSetOperation newInstance(SModel sm) {
    return SortedSetOperation.newInstance(sm, false);
  }
}
