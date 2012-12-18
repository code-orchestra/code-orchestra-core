package jetbrains.mps.lang.test.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ModelExpression extends Expression {
  public static final String concept = "jetbrains.mps.lang.test.structure.ModelExpression";

  public ModelExpression(SNode node) {
    super(node);
  }

  public static ModelExpression newInstance(SModel sm, boolean init) {
    return (ModelExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.test.structure.ModelExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ModelExpression newInstance(SModel sm) {
    return ModelExpression.newInstance(sm, false);
  }
}
