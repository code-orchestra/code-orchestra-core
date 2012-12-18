package jetbrains.mps.platform.conf.structure;

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

public class PluginVendor extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.platform.conf.structure.PluginVendor";
  public static final String URL = "url";
  public static final String EMAIL = "email";
  public static final String LOGO = "logo";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public PluginVendor(SNode node) {
    super(node);
  }

  public String getUrl() {
    return this.getProperty(PluginVendor.URL);
  }

  public void setUrl(String value) {
    this.setProperty(PluginVendor.URL, value);
  }

  public String getEmail() {
    return this.getProperty(PluginVendor.EMAIL);
  }

  public void setEmail(String value) {
    this.setProperty(PluginVendor.EMAIL, value);
  }

  public String getLogo() {
    return this.getProperty(PluginVendor.LOGO);
  }

  public void setLogo(String value) {
    this.setProperty(PluginVendor.LOGO, value);
  }

  public String getName() {
    return this.getProperty(PluginVendor.NAME);
  }

  public void setName(String value) {
    this.setProperty(PluginVendor.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(PluginVendor.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(PluginVendor.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(PluginVendor.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(PluginVendor.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(PluginVendor.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(PluginVendor.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(PluginVendor.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, PluginVendor.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, PluginVendor.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(PluginVendor.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, PluginVendor.SMODEL_ATTRIBUTE, node);
  }

  public static PluginVendor newInstance(SModel sm, boolean init) {
    return (PluginVendor) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.platform.conf.structure.PluginVendor", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PluginVendor newInstance(SModel sm) {
    return PluginVendor.newInstance(sm, false);
  }
}
