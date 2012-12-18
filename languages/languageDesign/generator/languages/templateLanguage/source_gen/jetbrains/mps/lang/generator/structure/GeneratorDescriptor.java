package jetbrains.mps.lang.generator.structure;

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

public class GeneratorDescriptor extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.lang.generator.structure.GeneratorDescriptor";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String GENERATE = "generate";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public GeneratorDescriptor(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(GeneratorDescriptor.NAME);
  }

  public void setName(String value) {
    this.setProperty(GeneratorDescriptor.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(GeneratorDescriptor.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(GeneratorDescriptor.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(GeneratorDescriptor.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(GeneratorDescriptor.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(GeneratorDescriptor.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(GeneratorDescriptor.VIRTUAL_PACKAGE, value);
  }

  public boolean getGenerate() {
    return this.getBooleanProperty(GeneratorDescriptor.GENERATE);
  }

  public void setGenerate(boolean value) {
    this.setBooleanProperty(GeneratorDescriptor.GENERATE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(GeneratorDescriptor.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, GeneratorDescriptor.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, GeneratorDescriptor.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(GeneratorDescriptor.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, GeneratorDescriptor.SMODEL_ATTRIBUTE, node);
  }

  public static GeneratorDescriptor newInstance(SModel sm, boolean init) {
    return (GeneratorDescriptor) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.structure.GeneratorDescriptor", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GeneratorDescriptor newInstance(SModel sm) {
    return GeneratorDescriptor.newInstance(sm, false);
  }
}
