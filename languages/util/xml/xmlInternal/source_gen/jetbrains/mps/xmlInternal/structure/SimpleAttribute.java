package jetbrains.mps.xmlInternal.structure;

/*Generated by MPS */

import jetbrains.mps.xml.structure.BaseAttribute;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.xml.structure.BaseText;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SimpleAttribute extends BaseAttribute {
  public static final String concept = "jetbrains.mps.xmlInternal.structure.SimpleAttribute";
  public static final String ATTRIBUTE_NAME = "attributeName";
  public static final String VALUE = "value";

  public SimpleAttribute(SNode node) {
    super(node);
  }

  public String getAttributeName() {
    return this.getProperty(SimpleAttribute.ATTRIBUTE_NAME);
  }

  public void setAttributeName(String value) {
    this.setProperty(SimpleAttribute.ATTRIBUTE_NAME, value);
  }

  public BaseText getValue() {
    return (BaseText) this.getChild(BaseText.class, SimpleAttribute.VALUE);
  }

  public void setValue(BaseText node) {
    super.setChild(SimpleAttribute.VALUE, node);
  }

  public static SimpleAttribute newInstance(SModel sm, boolean init) {
    return (SimpleAttribute) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.xmlInternal.structure.SimpleAttribute", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SimpleAttribute newInstance(SModel sm) {
    return SimpleAttribute.newInstance(sm, false);
  }
}
