package jetbrains.mps.samples.formulaLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class StringConstant extends Constant {
  public static final String concept = "jetbrains.mps.samples.formulaLanguage.structure.StringConstant";
  public static final String VALUE = "value";

  public StringConstant(SNode node) {
    super(node);
  }

  public String getValue() {
    return this.getProperty(StringConstant.VALUE);
  }

  public void setValue(String value) {
    this.setProperty(StringConstant.VALUE, value);
  }

  public static StringConstant newInstance(SModel sm, boolean init) {
    return (StringConstant) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.samples.formulaLanguage.structure.StringConstant", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static StringConstant newInstance(SModel sm) {
    return StringConstant.newInstance(sm, false);
  }
}
