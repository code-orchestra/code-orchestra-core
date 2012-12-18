package jetbrains.mps.samples.complex.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ReExpression extends SingleComplexExpression {
  public static final String concept = "jetbrains.mps.samples.complex.structure.ReExpression";

  public ReExpression(SNode node) {
    super(node);
  }

  public static ReExpression newInstance(SModel sm, boolean init) {
    return (ReExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.samples.complex.structure.ReExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ReExpression newInstance(SModel sm) {
    return ReExpression.newInstance(sm, false);
  }
}
