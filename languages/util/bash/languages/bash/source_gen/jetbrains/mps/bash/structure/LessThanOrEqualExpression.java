package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class LessThanOrEqualExpression extends BinaryArithmeticExpression {
  public static final String concept = "jetbrains.mps.bash.structure.LessThanOrEqualExpression";

  public LessThanOrEqualExpression(SNode node) {
    super(node);
  }

  public static LessThanOrEqualExpression newInstance(SModel sm, boolean init) {
    return (LessThanOrEqualExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.LessThanOrEqualExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static LessThanOrEqualExpression newInstance(SModel sm) {
    return LessThanOrEqualExpression.newInstance(sm, false);
  }
}
