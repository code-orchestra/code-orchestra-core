package jetbrains.mps.buildlanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BooleanLiteral extends PropertyValueExpression {
  public static final String concept = "jetbrains.mps.buildlanguage.structure.BooleanLiteral";
  public static final String VALUE = "value";

  public BooleanLiteral(SNode node) {
    super(node);
  }

  public boolean getValue() {
    return this.getBooleanProperty(BooleanLiteral.VALUE);
  }

  public void setValue(boolean value) {
    this.setBooleanProperty(BooleanLiteral.VALUE, value);
  }

  public static BooleanLiteral newInstance(SModel sm, boolean init) {
    return (BooleanLiteral) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.buildlanguage.structure.BooleanLiteral", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BooleanLiteral newInstance(SModel sm) {
    return BooleanLiteral.newInstance(sm, false);
  }
}
