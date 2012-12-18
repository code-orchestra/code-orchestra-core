package jetbrains.mps.baseLanguage.jdk7.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.SwitchStatement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class StringSwitchStatement extends SwitchStatement {
  public static final String concept = "jetbrains.mps.baseLanguage.jdk7.structure.StringSwitchStatement";

  public StringSwitchStatement(SNode node) {
    super(node);
  }

  public static StringSwitchStatement newInstance(SModel sm, boolean init) {
    return (StringSwitchStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.jdk7.structure.StringSwitchStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static StringSwitchStatement newInstance(SModel sm) {
    return StringSwitchStatement.newInstance(sm, false);
  }
}
