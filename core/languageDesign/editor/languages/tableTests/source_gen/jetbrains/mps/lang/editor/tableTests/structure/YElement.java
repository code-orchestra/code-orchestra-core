package jetbrains.mps.lang.editor.tableTests.structure;

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

public class YElement extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.lang.editor.tableTests.structure.YElement";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public YElement(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(YElement.NAME);
  }

  public void setName(String value) {
    this.setProperty(YElement.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(YElement.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(YElement.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(YElement.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(YElement.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(YElement.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(YElement.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(YElement.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, YElement.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, YElement.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(YElement.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, YElement.SMODEL_ATTRIBUTE, node);
  }

  public static YElement newInstance(SModel sm, boolean init) {
    return (YElement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.tableTests.structure.YElement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static YElement newInstance(SModel sm) {
    return YElement.newInstance(sm, false);
  }
}
