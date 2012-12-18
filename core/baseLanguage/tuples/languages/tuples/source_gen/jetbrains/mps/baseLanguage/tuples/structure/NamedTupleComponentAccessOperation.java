package jetbrains.mps.baseLanguage.tuples.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.baseLanguage.structure.IOperation;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class NamedTupleComponentAccessOperation extends BaseConcept implements IOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.tuples.structure.NamedTupleComponentAccessOperation";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String COMPONENT = "component";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public NamedTupleComponentAccessOperation(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(NamedTupleComponentAccessOperation.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(NamedTupleComponentAccessOperation.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(NamedTupleComponentAccessOperation.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(NamedTupleComponentAccessOperation.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(NamedTupleComponentAccessOperation.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(NamedTupleComponentAccessOperation.VIRTUAL_PACKAGE, value);
  }

  public NamedTupleComponentDeclaration getComponent() {
    return (NamedTupleComponentDeclaration) this.getReferent(NamedTupleComponentDeclaration.class, NamedTupleComponentAccessOperation.COMPONENT);
  }

  public void setComponent(NamedTupleComponentDeclaration node) {
    super.setReferent(NamedTupleComponentAccessOperation.COMPONENT, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(NamedTupleComponentAccessOperation.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, NamedTupleComponentAccessOperation.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, NamedTupleComponentAccessOperation.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(NamedTupleComponentAccessOperation.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, NamedTupleComponentAccessOperation.SMODEL_ATTRIBUTE, node);
  }

  public static NamedTupleComponentAccessOperation newInstance(SModel sm, boolean init) {
    return (NamedTupleComponentAccessOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.tuples.structure.NamedTupleComponentAccessOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static NamedTupleComponentAccessOperation newInstance(SModel sm) {
    return NamedTupleComponentAccessOperation.newInstance(sm, false);
  }
}
