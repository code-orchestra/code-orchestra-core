package jetbrains.mps.make.facet.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class FacetReferenceExpression extends Expression {
  public static final String concept = "jetbrains.mps.make.facet.structure.FacetReferenceExpression";
  public static final String REFERENCE = "reference";

  public FacetReferenceExpression(SNode node) {
    super(node);
  }

  public NamedFacetReference getReference() {
    return (NamedFacetReference) this.getChild(NamedFacetReference.class, FacetReferenceExpression.REFERENCE);
  }

  public void setReference(NamedFacetReference node) {
    super.setChild(FacetReferenceExpression.REFERENCE, node);
  }

  public static FacetReferenceExpression newInstance(SModel sm, boolean init) {
    return (FacetReferenceExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.make.facet.structure.FacetReferenceExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static FacetReferenceExpression newInstance(SModel sm) {
    return FacetReferenceExpression.newInstance(sm, false);
  }
}
