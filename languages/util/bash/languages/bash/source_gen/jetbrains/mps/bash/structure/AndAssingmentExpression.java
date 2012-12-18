package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AndAssingmentExpression extends BaseAssingmentExpression {
  public static final String concept = "jetbrains.mps.bash.structure.AndAssingmentExpression";

  public AndAssingmentExpression(SNode node) {
    super(node);
  }

  public static AndAssingmentExpression newInstance(SModel sm, boolean init) {
    return (AndAssingmentExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.AndAssingmentExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AndAssingmentExpression newInstance(SModel sm) {
    return AndAssingmentExpression.newInstance(sm, false);
  }
}
