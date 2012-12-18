package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ChildTypeRestrictionReference extends Expression {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.ChildTypeRestrictionReference";
  public static final String TYPE_RESTRICTION = "typeRestriction";

  public ChildTypeRestrictionReference(SNode node) {
    super(node);
  }

  public ChildTypeRestriction getTypeRestriction() {
    return (ChildTypeRestriction) this.getReferent(ChildTypeRestriction.class, ChildTypeRestrictionReference.TYPE_RESTRICTION);
  }

  public void setTypeRestriction(ChildTypeRestriction node) {
    super.setReferent(ChildTypeRestrictionReference.TYPE_RESTRICTION, node);
  }

  public static ChildTypeRestrictionReference newInstance(SModel sm, boolean init) {
    return (ChildTypeRestrictionReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.ChildTypeRestrictionReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ChildTypeRestrictionReference newInstance(SModel sm) {
    return ChildTypeRestrictionReference.newInstance(sm, false);
  }
}
