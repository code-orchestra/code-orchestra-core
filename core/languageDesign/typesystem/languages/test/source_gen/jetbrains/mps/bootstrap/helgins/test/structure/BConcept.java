package jetbrains.mps.bootstrap.helgins.test.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BConcept extends Expression {
  public static final String concept = "jetbrains.mps.bootstrap.helgins.test.structure.BConcept";

  public BConcept(SNode node) {
    super(node);
  }

  public static BConcept newInstance(SModel sm, boolean init) {
    return (BConcept) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bootstrap.helgins.test.structure.BConcept", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BConcept newInstance(SModel sm) {
    return BConcept.newInstance(sm, false);
  }
}
