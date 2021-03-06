package jetbrains.mps.baseLanguage.classifiers.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SuperClassifierExpresson extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.classifiers.structure.SuperClassifierExpresson";

  public SuperClassifierExpresson(SNode node) {
    super(node);
  }

  public static SuperClassifierExpresson newInstance(SModel sm, boolean init) {
    return (SuperClassifierExpresson) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.classifiers.structure.SuperClassifierExpresson", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SuperClassifierExpresson newInstance(SModel sm) {
    return SuperClassifierExpresson.newInstance(sm, false);
  }
}
