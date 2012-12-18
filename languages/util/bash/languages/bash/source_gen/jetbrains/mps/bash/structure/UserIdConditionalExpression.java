package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class UserIdConditionalExpression extends UnaryConditionalExpression {
  public static final String concept = "jetbrains.mps.bash.structure.UserIdConditionalExpression";

  public UserIdConditionalExpression(SNode node) {
    super(node);
  }

  public static UserIdConditionalExpression newInstance(SModel sm, boolean init) {
    return (UserIdConditionalExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.UserIdConditionalExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static UserIdConditionalExpression newInstance(SModel sm) {
    return UserIdConditionalExpression.newInstance(sm, false);
  }
}
