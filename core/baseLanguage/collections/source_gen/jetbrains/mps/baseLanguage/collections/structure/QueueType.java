package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class QueueType extends AbstractContainerType {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.QueueType";

  public QueueType(SNode node) {
    super(node);
  }

  public static QueueType newInstance(SModel sm, boolean init) {
    return (QueueType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.QueueType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static QueueType newInstance(SModel sm) {
    return QueueType.newInstance(sm, false);
  }
}
