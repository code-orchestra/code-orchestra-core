package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class OrOperator extends FollowingCommandList {
  public static final String concept = "jetbrains.mps.bash.structure.OrOperator";

  public OrOperator(SNode node) {
    super(node);
  }

  public static OrOperator newInstance(SModel sm, boolean init) {
    return (OrOperator) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.OrOperator", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static OrOperator newInstance(SModel sm) {
    return OrOperator.newInstance(sm, false);
  }
}
