package jetbrains.mps.baseLanguage.math.structure;

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

public class MatrixInitializerIndex extends BaseConcept implements INamedConcept, MatrixOrVectorInitializer {
  public static final String concept = "jetbrains.mps.baseLanguage.math.structure.MatrixInitializerIndex";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public MatrixInitializerIndex(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(MatrixInitializerIndex.NAME);
  }

  public void setName(String value) {
    this.setProperty(MatrixInitializerIndex.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(MatrixInitializerIndex.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(MatrixInitializerIndex.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(MatrixInitializerIndex.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(MatrixInitializerIndex.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(MatrixInitializerIndex.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(MatrixInitializerIndex.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(MatrixInitializerIndex.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, MatrixInitializerIndex.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, MatrixInitializerIndex.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(MatrixInitializerIndex.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, MatrixInitializerIndex.SMODEL_ATTRIBUTE, node);
  }

  public static MatrixInitializerIndex newInstance(SModel sm, boolean init) {
    return (MatrixInitializerIndex) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.math.structure.MatrixInitializerIndex", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MatrixInitializerIndex newInstance(SModel sm) {
    return MatrixInitializerIndex.newInstance(sm, false);
  }
}
