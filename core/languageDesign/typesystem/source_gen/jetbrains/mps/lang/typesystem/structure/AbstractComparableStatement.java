package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AbstractComparableStatement extends AbstractEquationStatement {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.AbstractComparableStatement";
  public static final String INFER = "infer";

  public AbstractComparableStatement(SNode node) {
    super(node);
  }

  public boolean getInfer() {
    return this.getBooleanProperty(AbstractComparableStatement.INFER);
  }

  public void setInfer(boolean value) {
    this.setBooleanProperty(AbstractComparableStatement.INFER, value);
  }

  public static AbstractComparableStatement newInstance(SModel sm, boolean init) {
    return (AbstractComparableStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.AbstractComparableStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AbstractComparableStatement newInstance(SModel sm) {
    return AbstractComparableStatement.newInstance(sm, false);
  }
}
