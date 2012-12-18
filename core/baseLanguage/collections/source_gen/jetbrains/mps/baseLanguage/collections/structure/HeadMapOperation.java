package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class HeadMapOperation extends SortedMapOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.HeadMapOperation";
  public static final String TO_KEY = "toKey";

  public HeadMapOperation(SNode node) {
    super(node);
  }

  public Expression getToKey() {
    return (Expression) this.getChild(Expression.class, HeadMapOperation.TO_KEY);
  }

  public void setToKey(Expression node) {
    super.setChild(HeadMapOperation.TO_KEY, node);
  }

  public static HeadMapOperation newInstance(SModel sm, boolean init) {
    return (HeadMapOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.HeadMapOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static HeadMapOperation newInstance(SModel sm) {
    return HeadMapOperation.newInstance(sm, false);
  }
}
