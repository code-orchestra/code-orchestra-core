package jetbrains.mps.platform.conf.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Extension extends ConfigurationXmlNode implements IConfigurationElement {
  public static final String concept = "jetbrains.mps.platform.conf.structure.Extension";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String EXTENSION_POINT = "extensionPoint";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public Extension(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(Extension.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(Extension.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(Extension.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(Extension.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(Extension.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(Extension.VIRTUAL_PACKAGE, value);
  }

  public ExtensionPoint getExtensionPoint() {
    return (ExtensionPoint) this.getReferent(ExtensionPoint.class, Extension.EXTENSION_POINT);
  }

  public void setExtensionPoint(ExtensionPoint node) {
    super.setReferent(Extension.EXTENSION_POINT, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(Extension.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, Extension.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, Extension.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(Extension.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, Extension.SMODEL_ATTRIBUTE, node);
  }

  public static Extension newInstance(SModel sm, boolean init) {
    return (Extension) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.platform.conf.structure.Extension", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Extension newInstance(SModel sm) {
    return Extension.newInstance(sm, false);
  }
}
