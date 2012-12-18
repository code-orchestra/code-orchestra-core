package jetbrains.mps.xmlUnitTest.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class XMLLiteral extends BaseConcept {
  public static final String concept = "jetbrains.mps.xmlUnitTest.structure.XMLLiteral";
  public static final String ELEMENT = "element";

  public XMLLiteral(SNode node) {
    super(node);
  }

  public Element getElement() {
    return (Element) this.getChild(Element.class, XMLLiteral.ELEMENT);
  }

  public void setElement(Element node) {
    super.setChild(XMLLiteral.ELEMENT, node);
  }

  public static XMLLiteral newInstance(SModel sm, boolean init) {
    return (XMLLiteral) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.xmlUnitTest.structure.XMLLiteral", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static XMLLiteral newInstance(SModel sm) {
    return XMLLiteral.newInstance(sm, false);
  }
}
