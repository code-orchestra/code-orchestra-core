package jetbrains.mps.ypath.structure;

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

public class TreePathOperation extends BaseConcept implements IOperation {
  public static final String concept = "jetbrains.mps.ypath.structure.TreePathOperation";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public TreePathOperation(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(TreePathOperation.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(TreePathOperation.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(TreePathOperation.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(TreePathOperation.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(TreePathOperation.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(TreePathOperation.VIRTUAL_PACKAGE, value);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(TreePathOperation.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, TreePathOperation.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, TreePathOperation.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(TreePathOperation.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, TreePathOperation.SMODEL_ATTRIBUTE, node);
  }

  public static TreePathOperation newInstance(SModel sm, boolean init) {
    return (TreePathOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ypath.structure.TreePathOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TreePathOperation newInstance(SModel sm) {
    return TreePathOperation.newInstance(sm, false);
  }
}
