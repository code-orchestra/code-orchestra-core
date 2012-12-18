package jetbrains.mps.transformation.test.inputLang.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExpressionToReduceToStatement extends Expression {
  public static final String concept = "jetbrains.mps.transformation.test.inputLang.structure.ExpressionToReduceToStatement";

  public ExpressionToReduceToStatement(SNode node) {
    super(node);
  }

  public static ExpressionToReduceToStatement newInstance(SModel sm, boolean init) {
    return (ExpressionToReduceToStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.transformation.test.inputLang.structure.ExpressionToReduceToStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExpressionToReduceToStatement newInstance(SModel sm) {
    return ExpressionToReduceToStatement.newInstance(sm, false);
  }
}
