package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SizeConditionalExpression extends UnaryConditionalExpression {
  public static final String concept = "jetbrains.mps.bash.structure.SizeConditionalExpression";

  public SizeConditionalExpression(SNode node) {
    super(node);
  }

  public static SizeConditionalExpression newInstance(SModel sm, boolean init) {
    return (SizeConditionalExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.SizeConditionalExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SizeConditionalExpression newInstance(SModel sm) {
    return SizeConditionalExpression.newInstance(sm, false);
  }
}
