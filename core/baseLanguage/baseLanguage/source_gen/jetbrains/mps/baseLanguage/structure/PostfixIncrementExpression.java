package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class PostfixIncrementExpression extends AbstractUnaryNumberOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.PostfixIncrementExpression";

  public PostfixIncrementExpression(SNode node) {
    super(node);
  }

  public static PostfixIncrementExpression newInstance(SModel sm, boolean init) {
    return (PostfixIncrementExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.PostfixIncrementExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PostfixIncrementExpression newInstance(SModel sm) {
    return PostfixIncrementExpression.newInstance(sm, false);
  }
}
