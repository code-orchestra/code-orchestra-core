package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class DirectoryConditionalExpression extends UnaryConditionalExpression {
  public static final String concept = "jetbrains.mps.bash.structure.DirectoryConditionalExpression";

  public DirectoryConditionalExpression(SNode node) {
    super(node);
  }

  public static DirectoryConditionalExpression newInstance(SModel sm, boolean init) {
    return (DirectoryConditionalExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.DirectoryConditionalExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static DirectoryConditionalExpression newInstance(SModel sm) {
    return DirectoryConditionalExpression.newInstance(sm, false);
  }
}
