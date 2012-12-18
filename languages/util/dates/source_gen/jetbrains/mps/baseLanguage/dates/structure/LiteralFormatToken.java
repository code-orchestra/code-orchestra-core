package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class LiteralFormatToken extends FormatToken {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.LiteralFormatToken";
  public static final String VALUE = "value";

  public LiteralFormatToken(SNode node) {
    super(node);
  }

  public String getValue() {
    return this.getProperty(LiteralFormatToken.VALUE);
  }

  public void setValue(String value) {
    this.setProperty(LiteralFormatToken.VALUE, value);
  }

  public static LiteralFormatToken newInstance(SModel sm, boolean init) {
    return (LiteralFormatToken) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.LiteralFormatToken", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static LiteralFormatToken newInstance(SModel sm) {
    return LiteralFormatToken.newInstance(sm, false);
  }
}
