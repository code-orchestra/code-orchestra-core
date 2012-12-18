package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SemicolonOperator extends FollowingCommandList {
  public static final String concept = "jetbrains.mps.bash.structure.SemicolonOperator";

  public SemicolonOperator(SNode node) {
    super(node);
  }

  public static SemicolonOperator newInstance(SModel sm, boolean init) {
    return (SemicolonOperator) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.SemicolonOperator", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SemicolonOperator newInstance(SModel sm) {
    return SemicolonOperator.newInstance(sm, false);
  }
}
