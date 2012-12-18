package jetbrains.mps.xml.deprecated.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Element extends ElementPart {
  public static final String concept = "jetbrains.mps.xml.deprecated.structure.Element";
  public static final String COLLAPSE = "collapse";
  public static final String ATTRIBUTE = "attribute";
  public static final String CONTENT = "content";

  public Element(SNode node) {
    super(node);
  }

  public boolean getCollapse() {
    return this.getBooleanProperty(Element.COLLAPSE);
  }

  public void setCollapse(boolean value) {
    this.setBooleanProperty(Element.COLLAPSE, value);
  }

  public int getAttributesCount() {
    return this.getChildCount(Element.ATTRIBUTE);
  }

  public Iterator<Attribute> attributes() {
    return this.children(Attribute.class, Element.ATTRIBUTE);
  }

  public List<Attribute> getAttributes() {
    return this.getChildren(Attribute.class, Element.ATTRIBUTE);
  }

  public void addAttribute(Attribute node) {
    this.addChild(Element.ATTRIBUTE, node);
  }

  public void insertAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, Element.ATTRIBUTE, node);
  }

  public int getContentsCount() {
    return this.getChildCount(Element.CONTENT);
  }

  public Iterator<ElementPart> contents() {
    return this.children(ElementPart.class, Element.CONTENT);
  }

  public List<ElementPart> getContents() {
    return this.getChildren(ElementPart.class, Element.CONTENT);
  }

  public void addContent(ElementPart node) {
    this.addChild(Element.CONTENT, node);
  }

  public void insertContent(ElementPart prev, ElementPart node) {
    this.insertChild(prev, Element.CONTENT, node);
  }

  public static Element newInstance(SModel sm, boolean init) {
    return (Element) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.xml.deprecated.structure.Element", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Element newInstance(SModel sm) {
    return Element.newInstance(sm, false);
  }
}
