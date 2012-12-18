package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class RemoveAllSetElementsOperation extends AbstractSetOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.RemoveAllSetElementsOperation";
  public static final String ARGUMENT = "argument";

  public RemoveAllSetElementsOperation(SNode node) {
    super(node);
  }

  public Expression getArgument() {
    return (Expression) this.getChild(Expression.class, RemoveAllSetElementsOperation.ARGUMENT);
  }

  public void setArgument(Expression node) {
    super.setChild(RemoveAllSetElementsOperation.ARGUMENT, node);
  }

  public static RemoveAllSetElementsOperation newInstance(SModel sm, boolean init) {
    return (RemoveAllSetElementsOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.RemoveAllSetElementsOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static RemoveAllSetElementsOperation newInstance(SModel sm) {
    return RemoveAllSetElementsOperation.newInstance(sm, false);
  }
}
