package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class EnumeratorType extends Type {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.EnumeratorType";
  public static final String ELEMENT_TYPE = "elementType";

  public EnumeratorType(SNode node) {
    super(node);
  }

  public Type getElementType() {
    return (Type) this.getChild(Type.class, EnumeratorType.ELEMENT_TYPE);
  }

  public void setElementType(Type node) {
    super.setChild(EnumeratorType.ELEMENT_TYPE, node);
  }

  public static EnumeratorType newInstance(SModel sm, boolean init) {
    return (EnumeratorType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.EnumeratorType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static EnumeratorType newInstance(SModel sm) {
    return EnumeratorType.newInstance(sm, false);
  }
}
