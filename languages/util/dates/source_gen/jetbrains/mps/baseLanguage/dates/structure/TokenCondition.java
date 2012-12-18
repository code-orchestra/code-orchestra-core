package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TokenCondition extends ConceptFunction {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.TokenCondition";

  public TokenCondition(SNode node) {
    super(node);
  }

  public static TokenCondition newInstance(SModel sm, boolean init) {
    return (TokenCondition) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.TokenCondition", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TokenCondition newInstance(SModel sm) {
    return TokenCondition.newInstance(sm, false);
  }
}
