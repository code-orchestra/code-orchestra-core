package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SelectOperation extends InternalSequenceOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.SelectOperation";

  public SelectOperation(SNode node) {
    super(node);
  }

  public Expression getSelector() {
    return this.ensureAdapter(Expression.class, "closure", this.getClosure());
  }

  public void setSelector(Expression node) {
    this.setClosure(node);
  }

  public static SelectOperation newInstance(SModel sm, boolean init) {
    return (SelectOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.SelectOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SelectOperation newInstance(SModel sm) {
    return SelectOperation.newInstance(sm, false);
  }
}
