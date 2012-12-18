package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class WildCardType extends Type {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.WildCardType";

  public WildCardType(SNode node) {
    super(node);
  }

  public static WildCardType newInstance(SModel sm, boolean init) {
    return (WildCardType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.WildCardType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static WildCardType newInstance(SModel sm) {
    return WildCardType.newInstance(sm, false);
  }
}
