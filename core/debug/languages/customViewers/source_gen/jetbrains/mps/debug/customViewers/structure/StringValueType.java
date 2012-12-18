package jetbrains.mps.debug.customViewers.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class StringValueType extends Type {
  public static final String concept = "jetbrains.mps.debug.customViewers.structure.StringValueType";

  public StringValueType(SNode node) {
    super(node);
  }

  public static StringValueType newInstance(SModel sm, boolean init) {
    return (StringValueType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.debug.customViewers.structure.StringValueType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static StringValueType newInstance(SModel sm) {
    return StringValueType.newInstance(sm, false);
  }
}
