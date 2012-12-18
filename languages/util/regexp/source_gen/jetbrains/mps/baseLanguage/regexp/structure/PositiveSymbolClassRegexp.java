package jetbrains.mps.baseLanguage.regexp.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class PositiveSymbolClassRegexp extends SymbolClassRegexp {
  public static final String concept = "jetbrains.mps.baseLanguage.regexp.structure.PositiveSymbolClassRegexp";

  public PositiveSymbolClassRegexp(SNode node) {
    super(node);
  }

  public static PositiveSymbolClassRegexp newInstance(SModel sm, boolean init) {
    return (PositiveSymbolClassRegexp) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.regexp.structure.PositiveSymbolClassRegexp", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PositiveSymbolClassRegexp newInstance(SModel sm) {
    return PositiveSymbolClassRegexp.newInstance(sm, false);
  }
}
