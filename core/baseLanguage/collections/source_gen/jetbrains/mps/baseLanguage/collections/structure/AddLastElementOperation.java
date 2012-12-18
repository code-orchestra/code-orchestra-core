package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AddLastElementOperation extends SingleArgumentSequenceOperation implements IListOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.AddLastElementOperation";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public AddLastElementOperation(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(AddLastElementOperation.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(AddLastElementOperation.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(AddLastElementOperation.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(AddLastElementOperation.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(AddLastElementOperation.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(AddLastElementOperation.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(AddLastElementOperation.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, AddLastElementOperation.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, AddLastElementOperation.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(AddLastElementOperation.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, AddLastElementOperation.SMODEL_ATTRIBUTE, node);
  }

  public static AddLastElementOperation newInstance(SModel sm, boolean init) {
    return (AddLastElementOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.AddLastElementOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AddLastElementOperation newInstance(SModel sm) {
    return AddLastElementOperation.newInstance(sm, false);
  }
}
