package jetbrains.mps.ui.modeling.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.lang.core.structure.INamedConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AspectParameterDecl extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.ui.modeling.structure.AspectParameterDecl";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String ASPECT_DEF = "aspectDef";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public AspectParameterDecl(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(AspectParameterDecl.NAME);
  }

  public void setName(String value) {
    this.setProperty(AspectParameterDecl.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(AspectParameterDecl.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(AspectParameterDecl.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(AspectParameterDecl.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(AspectParameterDecl.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(AspectParameterDecl.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(AspectParameterDecl.VIRTUAL_PACKAGE, value);
  }

  public ChildAspectDefinition getAspectDef() {
    return (ChildAspectDefinition) this.getReferent(ChildAspectDefinition.class, AspectParameterDecl.ASPECT_DEF);
  }

  public void setAspectDef(ChildAspectDefinition node) {
    super.setReferent(AspectParameterDecl.ASPECT_DEF, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(AspectParameterDecl.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, AspectParameterDecl.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, AspectParameterDecl.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(AspectParameterDecl.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, AspectParameterDecl.SMODEL_ATTRIBUTE, node);
  }

  public static AspectParameterDecl newInstance(SModel sm, boolean init) {
    return (AspectParameterDecl) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ui.modeling.structure.AspectParameterDecl", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AspectParameterDecl newInstance(SModel sm) {
    return AspectParameterDecl.newInstance(sm, false);
  }
}
