package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.IWrapper;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class LocalVariableDeclarationStatement extends Statement implements IWrapper {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String LOCAL_VARIABLE_DECLARATION = "localVariableDeclaration";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public LocalVariableDeclarationStatement(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(LocalVariableDeclarationStatement.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(LocalVariableDeclarationStatement.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(LocalVariableDeclarationStatement.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(LocalVariableDeclarationStatement.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(LocalVariableDeclarationStatement.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(LocalVariableDeclarationStatement.VIRTUAL_PACKAGE, value);
  }

  public LocalVariableDeclaration getLocalVariableDeclaration() {
    return (LocalVariableDeclaration) this.getChild(LocalVariableDeclaration.class, LocalVariableDeclarationStatement.LOCAL_VARIABLE_DECLARATION);
  }

  public void setLocalVariableDeclaration(LocalVariableDeclaration node) {
    super.setChild(LocalVariableDeclarationStatement.LOCAL_VARIABLE_DECLARATION, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(LocalVariableDeclarationStatement.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, LocalVariableDeclarationStatement.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, LocalVariableDeclarationStatement.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(LocalVariableDeclarationStatement.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, LocalVariableDeclarationStatement.SMODEL_ATTRIBUTE, node);
  }

  public static LocalVariableDeclarationStatement newInstance(SModel sm, boolean init) {
    return (LocalVariableDeclarationStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static LocalVariableDeclarationStatement newInstance(SModel sm) {
    return LocalVariableDeclarationStatement.newInstance(sm, false);
  }
}
