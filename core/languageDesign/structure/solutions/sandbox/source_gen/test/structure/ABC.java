package test.structure;

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

public class ABC extends BaseConcept implements INamedConcept {
  public static final String concept = "test.structure.ABC";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public ABC(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(ABC.NAME);
  }

  public void setName(String value) {
    this.setProperty(ABC.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(ABC.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(ABC.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(ABC.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(ABC.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(ABC.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(ABC.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(ABC.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, ABC.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, ABC.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(ABC.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, ABC.SMODEL_ATTRIBUTE, node);
  }

  public static ABC newInstance(SModel sm, boolean init) {
    return (ABC) SModelUtil_new.instantiateConceptDeclaration("test.structure.ABC", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ABC newInstance(SModel sm) {
    return ABC.newInstance(sm, false);
  }
}
