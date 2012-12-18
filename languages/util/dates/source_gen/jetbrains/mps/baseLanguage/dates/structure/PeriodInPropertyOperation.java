package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.datesInternal.structure.DateTimeProperty;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class PeriodInPropertyOperation extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.PeriodInPropertyOperation";
  public static final String ABSOLUTE = "absolute";
  public static final String DATETIME_PROPERTY = "datetimeProperty";
  public static final String DATETIME = "datetime";

  public PeriodInPropertyOperation(SNode node) {
    super(node);
  }

  public boolean getAbsolute() {
    return this.getBooleanProperty(PeriodInPropertyOperation.ABSOLUTE);
  }

  public void setAbsolute(boolean value) {
    this.setBooleanProperty(PeriodInPropertyOperation.ABSOLUTE, value);
  }

  public DateTimeProperty getDatetimeProperty() {
    return (DateTimeProperty) this.getReferent(DateTimeProperty.class, PeriodInPropertyOperation.DATETIME_PROPERTY);
  }

  public void setDatetimeProperty(DateTimeProperty node) {
    super.setReferent(PeriodInPropertyOperation.DATETIME_PROPERTY, node);
  }

  public Expression getDatetime() {
    return (Expression) this.getChild(Expression.class, PeriodInPropertyOperation.DATETIME);
  }

  public void setDatetime(Expression node) {
    super.setChild(PeriodInPropertyOperation.DATETIME, node);
  }

  public static PeriodInPropertyOperation newInstance(SModel sm, boolean init) {
    return (PeriodInPropertyOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.PeriodInPropertyOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PeriodInPropertyOperation newInstance(SModel sm) {
    return PeriodInPropertyOperation.newInstance(sm, false);
  }
}
