package jetbrains.mps.lang.test.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Statement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AbstractNodeAssert extends Statement {
  public static final String concept = "jetbrains.mps.lang.test.structure.AbstractNodeAssert";
  public static final String NODE_TO_CHECK = "nodeToCheck";

  public AbstractNodeAssert(SNode node) {
    super(node);
  }

  public Expression getNodeToCheck() {
    return (Expression) this.getChild(Expression.class, AbstractNodeAssert.NODE_TO_CHECK);
  }

  public void setNodeToCheck(Expression node) {
    super.setChild(AbstractNodeAssert.NODE_TO_CHECK, node);
  }

  public static AbstractNodeAssert newInstance(SModel sm, boolean init) {
    return (AbstractNodeAssert) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.test.structure.AbstractNodeAssert", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AbstractNodeAssert newInstance(SModel sm) {
    return AbstractNodeAssert.newInstance(sm, false);
  }
}
