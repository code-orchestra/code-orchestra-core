package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class NormalTypeClause extends TypeClause {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.NormalTypeClause";
  public static final String NORMAL_TYPE = "normalType";

  public NormalTypeClause(SNode node) {
    super(node);
  }

  public Expression getNormalType() {
    return (Expression) this.getChild(Expression.class, NormalTypeClause.NORMAL_TYPE);
  }

  public void setNormalType(Expression node) {
    super.setChild(NormalTypeClause.NORMAL_TYPE, node);
  }

  public static NormalTypeClause newInstance(SModel sm, boolean init) {
    return (NormalTypeClause) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.NormalTypeClause", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static NormalTypeClause newInstance(SModel sm) {
    return NormalTypeClause.newInstance(sm, false);
  }
}
