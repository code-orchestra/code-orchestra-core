package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BaseVariableReference extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.BaseVariableReference";
  public static final String BASE_VARIABLE_DECLARATION = "baseVariableDeclaration";

  public BaseVariableReference(SNode node) {
    super(node);
  }

  public BaseVariableDeclaration getBaseVariableDeclaration() {
    return (BaseVariableDeclaration) this.getReferent(BaseVariableDeclaration.class, BaseVariableReference.BASE_VARIABLE_DECLARATION);
  }

  public void setBaseVariableDeclaration(BaseVariableDeclaration node) {
    super.setReferent(BaseVariableReference.BASE_VARIABLE_DECLARATION, node);
  }

  public static BaseVariableReference newInstance(SModel sm, boolean init) {
    return (BaseVariableReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.BaseVariableReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BaseVariableReference newInstance(SModel sm) {
    return BaseVariableReference.newInstance(sm, false);
  }
}
