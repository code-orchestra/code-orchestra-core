package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class QueryFunction_ParameterizedSideTransform_Handler extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.actions.structure.QueryFunction_ParameterizedSideTransform_Handler";

  public QueryFunction_ParameterizedSideTransform_Handler(SNode node) {
    super(node);
  }

  public static QueryFunction_ParameterizedSideTransform_Handler newInstance(SModel sm, boolean init) {
    return (QueryFunction_ParameterizedSideTransform_Handler) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.QueryFunction_ParameterizedSideTransform_Handler", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static QueryFunction_ParameterizedSideTransform_Handler newInstance(SModel sm) {
    return QueryFunction_ParameterizedSideTransform_Handler.newInstance(sm, false);
  }
}
