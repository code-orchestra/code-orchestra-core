package jetbrains.mps.lang.smodel.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Reference_GetTargetOperation extends BaseConcept implements IReferenceOperation {
  public static final String concept = "jetbrains.mps.lang.smodel.structure.Reference_GetTargetOperation";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public Reference_GetTargetOperation(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(Reference_GetTargetOperation.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(Reference_GetTargetOperation.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(Reference_GetTargetOperation.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(Reference_GetTargetOperation.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(Reference_GetTargetOperation.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(Reference_GetTargetOperation.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(Reference_GetTargetOperation.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, Reference_GetTargetOperation.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, Reference_GetTargetOperation.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(Reference_GetTargetOperation.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, Reference_GetTargetOperation.SMODEL_ATTRIBUTE, node);
  }

  public static Reference_GetTargetOperation newInstance(SModel sm, boolean init) {
    return (Reference_GetTargetOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.Reference_GetTargetOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Reference_GetTargetOperation newInstance(SModel sm) {
    return Reference_GetTargetOperation.newInstance(sm, false);
  }
}
