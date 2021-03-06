package jetbrains.mps.nanoc.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class CShort extends CType {
  public static final String concept = "jetbrains.mps.nanoc.structure.CShort";

  public CShort(SNode node) {
    super(node);
  }

  public static CShort newInstance(SModel sm, boolean init) {
    return (CShort) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.nanoc.structure.CShort", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static CShort newInstance(SModel sm) {
    return CShort.newInstance(sm, false);
  }
}
