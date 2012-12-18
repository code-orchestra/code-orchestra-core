package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GreaterThanOrEqualExpression extends BinaryArithmeticExpression {
  public static final String concept = "jetbrains.mps.bash.structure.GreaterThanOrEqualExpression";

  public GreaterThanOrEqualExpression(SNode node) {
    super(node);
  }

  public static GreaterThanOrEqualExpression newInstance(SModel sm, boolean init) {
    return (GreaterThanOrEqualExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.GreaterThanOrEqualExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GreaterThanOrEqualExpression newInstance(SModel sm) {
    return GreaterThanOrEqualExpression.newInstance(sm, false);
  }
}
