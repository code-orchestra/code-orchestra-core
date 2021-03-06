package jetbrains.mps.baseLanguage.math.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MathContext extends BaseConcept {
  public static final String concept = "jetbrains.mps.baseLanguage.math.structure.MathContext";
  public static final String PRECISION = "precision";
  public static final String ROUNDING_MODE = "roundingMode";
  public static final String PRECISION_SETTING = "precisionSetting";

  public MathContext(SNode node) {
    super(node);
  }

  public int getPrecision() {
    return this.getIntegerProperty(MathContext.PRECISION);
  }

  public void setPrecision(int value) {
    this.setIntegerProperty(MathContext.PRECISION, value);
  }

  public RoundingMode getRoundingMode() {
    String value = super.getProperty(MathContext.ROUNDING_MODE);
    return RoundingMode.parseValue(value);
  }

  public void setRoundingMode(RoundingMode value) {
    super.setProperty(MathContext.ROUNDING_MODE, value.getValueAsString());
  }

  public PrecisionSetting getPrecisionSetting() {
    String value = super.getProperty(MathContext.PRECISION_SETTING);
    return PrecisionSetting.parseValue(value);
  }

  public void setPrecisionSetting(PrecisionSetting value) {
    super.setProperty(MathContext.PRECISION_SETTING, value.getValueAsString());
  }

  public static MathContext newInstance(SModel sm, boolean init) {
    return (MathContext) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.math.structure.MathContext", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MathContext newInstance(SModel sm) {
    return MathContext.newInstance(sm, false);
  }
}
