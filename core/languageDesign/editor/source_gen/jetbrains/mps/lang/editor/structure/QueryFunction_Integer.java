package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class QueryFunction_Integer extends QueryFunction_StyleParameter {
  public static final String concept = "jetbrains.mps.lang.editor.structure.QueryFunction_Integer";

  public QueryFunction_Integer(SNode node) {
    super(node);
  }

  public static QueryFunction_Integer newInstance(SModel sm, boolean init) {
    return (QueryFunction_Integer) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.QueryFunction_Integer", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static QueryFunction_Integer newInstance(SModel sm) {
    return QueryFunction_Integer.newInstance(sm, false);
  }
}
