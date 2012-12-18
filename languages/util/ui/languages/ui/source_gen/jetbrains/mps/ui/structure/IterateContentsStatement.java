package jetbrains.mps.ui.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.AbstractLoopStatement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class IterateContentsStatement extends AbstractLoopStatement {
  public static final String concept = "jetbrains.mps.ui.structure.IterateContentsStatement";
  public static final String VARIABLE = "variable";

  public IterateContentsStatement(SNode node) {
    super(node);
  }

  public IterateContentsVariable getVariable() {
    return (IterateContentsVariable) this.getChild(IterateContentsVariable.class, IterateContentsStatement.VARIABLE);
  }

  public void setVariable(IterateContentsVariable node) {
    super.setChild(IterateContentsStatement.VARIABLE, node);
  }

  public static IterateContentsStatement newInstance(SModel sm, boolean init) {
    return (IterateContentsStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ui.structure.IterateContentsStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static IterateContentsStatement newInstance(SModel sm) {
    return IterateContentsStatement.newInstance(sm, false);
  }
}
