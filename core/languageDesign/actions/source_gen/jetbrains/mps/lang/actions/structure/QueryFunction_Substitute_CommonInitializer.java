package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class QueryFunction_Substitute_CommonInitializer extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.actions.structure.QueryFunction_Substitute_CommonInitializer";

  public QueryFunction_Substitute_CommonInitializer(SNode node) {
    super(node);
  }

  public static QueryFunction_Substitute_CommonInitializer newInstance(SModel sm, boolean init) {
    return (QueryFunction_Substitute_CommonInitializer) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.QueryFunction_Substitute_CommonInitializer", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static QueryFunction_Substitute_CommonInitializer newInstance(SModel sm) {
    return QueryFunction_Substitute_CommonInitializer.newInstance(sm, false);
  }
}
