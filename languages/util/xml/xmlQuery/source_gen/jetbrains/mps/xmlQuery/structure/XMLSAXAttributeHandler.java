package jetbrains.mps.xmlQuery.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class XMLSAXAttributeHandler extends XMLSAXHandlerFunction {
  public static final String concept = "jetbrains.mps.xmlQuery.structure.XMLSAXAttributeHandler";

  public XMLSAXAttributeHandler(SNode node) {
    super(node);
  }

  public static XMLSAXAttributeHandler newInstance(SModel sm, boolean init) {
    return (XMLSAXAttributeHandler) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.xmlQuery.structure.XMLSAXAttributeHandler", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static XMLSAXAttributeHandler newInstance(SModel sm) {
    return XMLSAXAttributeHandler.newInstance(sm, false);
  }
}
