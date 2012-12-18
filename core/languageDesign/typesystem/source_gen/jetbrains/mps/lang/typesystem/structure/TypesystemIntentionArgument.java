package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TypesystemIntentionArgument extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.TypesystemIntentionArgument";
  public static final String QUICK_FIX_ARGUMENT = "quickFixArgument";
  public static final String VALUE = "value";

  public TypesystemIntentionArgument(SNode node) {
    super(node);
  }

  public QuickFixArgument getQuickFixArgument() {
    return (QuickFixArgument) this.getReferent(QuickFixArgument.class, TypesystemIntentionArgument.QUICK_FIX_ARGUMENT);
  }

  public void setQuickFixArgument(QuickFixArgument node) {
    super.setReferent(TypesystemIntentionArgument.QUICK_FIX_ARGUMENT, node);
  }

  public Expression getValue() {
    return (Expression) this.getChild(Expression.class, TypesystemIntentionArgument.VALUE);
  }

  public void setValue(Expression node) {
    super.setChild(TypesystemIntentionArgument.VALUE, node);
  }

  public static TypesystemIntentionArgument newInstance(SModel sm, boolean init) {
    return (TypesystemIntentionArgument) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.TypesystemIntentionArgument", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TypesystemIntentionArgument newInstance(SModel sm) {
    return TypesystemIntentionArgument.newInstance(sm, false);
  }
}
