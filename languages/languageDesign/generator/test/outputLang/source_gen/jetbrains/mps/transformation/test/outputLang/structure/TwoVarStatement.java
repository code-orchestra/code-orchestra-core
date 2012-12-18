package jetbrains.mps.transformation.test.outputLang.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Statement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TwoVarStatement extends Statement {
  public static final String concept = "jetbrains.mps.transformation.test.outputLang.structure.TwoVarStatement";
  public static final String NAME1 = "name1";
  public static final String NAME2 = "name2";

  public TwoVarStatement(SNode node) {
    super(node);
  }

  public String getName1() {
    return this.getProperty(TwoVarStatement.NAME1);
  }

  public void setName1(String value) {
    this.setProperty(TwoVarStatement.NAME1, value);
  }

  public String getName2() {
    return this.getProperty(TwoVarStatement.NAME2);
  }

  public void setName2(String value) {
    this.setProperty(TwoVarStatement.NAME2, value);
  }

  public static TwoVarStatement newInstance(SModel sm, boolean init) {
    return (TwoVarStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.transformation.test.outputLang.structure.TwoVarStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TwoVarStatement newInstance(SModel sm) {
    return TwoVarStatement.newInstance(sm, false);
  }
}
