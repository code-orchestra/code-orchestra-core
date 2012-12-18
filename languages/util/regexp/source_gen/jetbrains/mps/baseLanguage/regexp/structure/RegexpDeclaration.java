package jetbrains.mps.baseLanguage.regexp.structure;

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

public class RegexpDeclaration extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.baseLanguage.regexp.structure.RegexpDeclaration";
  public static final String DESCRIPTION = "description";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String REGEXP = "regexp";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public RegexpDeclaration(SNode node) {
    super(node);
  }

  public String getDescription() {
    return this.getProperty(RegexpDeclaration.DESCRIPTION);
  }

  public void setDescription(String value) {
    this.setProperty(RegexpDeclaration.DESCRIPTION, value);
  }

  public String getName() {
    return this.getProperty(RegexpDeclaration.NAME);
  }

  public void setName(String value) {
    this.setProperty(RegexpDeclaration.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(RegexpDeclaration.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(RegexpDeclaration.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(RegexpDeclaration.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(RegexpDeclaration.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(RegexpDeclaration.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(RegexpDeclaration.VIRTUAL_PACKAGE, value);
  }

  public Regexp getRegexp() {
    return (Regexp) this.getChild(Regexp.class, RegexpDeclaration.REGEXP);
  }

  public void setRegexp(Regexp node) {
    super.setChild(RegexpDeclaration.REGEXP, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(RegexpDeclaration.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, RegexpDeclaration.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, RegexpDeclaration.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(RegexpDeclaration.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, RegexpDeclaration.SMODEL_ATTRIBUTE, node);
  }

  public static RegexpDeclaration newInstance(SModel sm, boolean init) {
    return (RegexpDeclaration) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.regexp.structure.RegexpDeclaration", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static RegexpDeclaration newInstance(SModel sm) {
    return RegexpDeclaration.newInstance(sm, false);
  }
}
