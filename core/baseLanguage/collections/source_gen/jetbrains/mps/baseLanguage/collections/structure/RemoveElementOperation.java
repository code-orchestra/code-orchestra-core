package jetbrains.mps.baseLanguage.collections.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class RemoveElementOperation extends SingleArgumentSequenceOperation implements IListOperation, IQueueOperation, IStackOperation {
  public static final String concept = "jetbrains.mps.baseLanguage.collections.structure.RemoveElementOperation";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public RemoveElementOperation(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(RemoveElementOperation.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(RemoveElementOperation.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(RemoveElementOperation.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(RemoveElementOperation.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(RemoveElementOperation.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(RemoveElementOperation.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(RemoveElementOperation.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, RemoveElementOperation.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, RemoveElementOperation.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(RemoveElementOperation.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, RemoveElementOperation.SMODEL_ATTRIBUTE, node);
  }

  public static RemoveElementOperation newInstance(SModel sm, boolean init) {
    return (RemoveElementOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.collections.structure.RemoveElementOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static RemoveElementOperation newInstance(SModel sm) {
    return RemoveElementOperation.newInstance(sm, false);
  }
}
