package jetbrains.mps.lang.smodel.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SearchScopeType extends Type {
  public static final String concept = "jetbrains.mps.lang.smodel.structure.SearchScopeType";

  public SearchScopeType(SNode node) {
    super(node);
  }

  public static SearchScopeType newInstance(SModel sm, boolean init) {
    return (SearchScopeType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.SearchScopeType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SearchScopeType newInstance(SModel sm) {
    return SearchScopeType.newInstance(sm, false);
  }
}
