package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TimeZoneConstant extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.TimeZoneConstant";

  public TimeZoneConstant(SNode node) {
    super(node);
  }

  public static TimeZoneConstant newInstance(SModel sm, boolean init) {
    return (TimeZoneConstant) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.TimeZoneConstant", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TimeZoneConstant newInstance(SModel sm) {
    return TimeZoneConstant.newInstance(sm, false);
  }
}
