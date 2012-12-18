package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class HeadSetOperation extends SortedSetOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.HeadSetOperation";
  public static final String TO_ELEMENT = "toElement";

  public HeadSetOperation(SNode node) {
    super(node);
  }

  public Expression getToElement() {
    return (Expression) this.getChild(Expression.class, HeadSetOperation.TO_ELEMENT);
  }

  public void setToElement(Expression node) {
    super.setChild(HeadSetOperation.TO_ELEMENT, node);
  }

  public static HeadSetOperation newInstance(SModel sm, boolean init) {
    return (HeadSetOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.HeadSetOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static HeadSetOperation newInstance(SModel sm) {
    return HeadSetOperation.newInstance(sm, false);
  }
}
