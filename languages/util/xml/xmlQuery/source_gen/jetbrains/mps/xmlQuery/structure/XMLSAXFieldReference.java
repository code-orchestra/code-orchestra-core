package jetbrains.mps.xmlQuery.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class XMLSAXFieldReference extends Expression {
  public static final String concept = "jetbrains.mps.xmlQuery.structure.XMLSAXFieldReference";
  public static final String DECLARATION = "declaration";

  public XMLSAXFieldReference(SNode node) {
    super(node);
  }

  public XMLSAXFieldDeclaration getDeclaration() {
    return (XMLSAXFieldDeclaration) this.getReferent(XMLSAXFieldDeclaration.class, XMLSAXFieldReference.DECLARATION);
  }

  public void setDeclaration(XMLSAXFieldDeclaration node) {
    super.setReferent(XMLSAXFieldReference.DECLARATION, node);
  }

  public static XMLSAXFieldReference newInstance(SModel sm, boolean init) {
    return (XMLSAXFieldReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.xmlQuery.structure.XMLSAXFieldReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static XMLSAXFieldReference newInstance(SModel sm) {
    return XMLSAXFieldReference.newInstance(sm, false);
  }
}
