package jetbrains.mps.debug.customViewers.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class WatchableListType extends Type {
  public static final String concept = "jetbrains.mps.debug.customViewers.structure.WatchableListType";

  public WatchableListType(SNode node) {
    super(node);
  }

  public static WatchableListType newInstance(SModel sm, boolean init) {
    return (WatchableListType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.debug.customViewers.structure.WatchableListType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static WatchableListType newInstance(SModel sm) {
    return WatchableListType.newInstance(sm, false);
  }
}
