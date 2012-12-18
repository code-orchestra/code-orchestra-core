package jetbrains.mps.baseLanguage.math.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MathTypeCast extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.math.structure.MathTypeCast";
  public static final String TARGET = "target";
  public static final String CASTED_EXPR = "castedExpr";

  public MathTypeCast(SNode node) {
    super(node);
  }

  public CastTargetDescriptor getTarget() {
    String value = super.getProperty(MathTypeCast.TARGET);
    return CastTargetDescriptor.parseValue(value);
  }

  public void setTarget(CastTargetDescriptor value) {
    super.setProperty(MathTypeCast.TARGET, value.getValueAsString());
  }

  public Expression getCastedExpr() {
    return (Expression) this.getChild(Expression.class, MathTypeCast.CASTED_EXPR);
  }

  public void setCastedExpr(Expression node) {
    super.setChild(MathTypeCast.CASTED_EXPR, node);
  }

  public static MathTypeCast newInstance(SModel sm, boolean init) {
    return (MathTypeCast) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.math.structure.MathTypeCast", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MathTypeCast newInstance(SModel sm) {
    return MathTypeCast.newInstance(sm, false);
  }
}
