package jetbrains.mps.lang.test.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Statement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class InvokeActionStatement extends Statement {
  public static final String concept = "jetbrains.mps.lang.test.structure.InvokeActionStatement";
  public static final String ACTION_REFERENCE = "actionReference";

  public InvokeActionStatement(SNode node) {
    super(node);
  }

  public ActionReference getActionReference() {
    return (ActionReference) this.getChild(ActionReference.class, InvokeActionStatement.ACTION_REFERENCE);
  }

  public void setActionReference(ActionReference node) {
    super.setChild(InvokeActionStatement.ACTION_REFERENCE, node);
  }

  public static InvokeActionStatement newInstance(SModel sm, boolean init) {
    return (InvokeActionStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.test.structure.InvokeActionStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static InvokeActionStatement newInstance(SModel sm) {
    return InvokeActionStatement.newInstance(sm, false);
  }
}
