package jetbrains.mps.build.distrib.structure;

/*Generated by MPS */

import jetbrains.mps.buildlanguage.structure.PropertyValueExpression;
import jetbrains.mps.build.packaging.structure.IStringExpression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.build.packaging.structure.Variable;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExternalVariableReference extends PropertyValueExpression implements IStringExpression {
  public static final String concept = "jetbrains.mps.build.distrib.structure.ExternalVariableReference";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String VARIABLE = "variable";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public ExternalVariableReference(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(ExternalVariableReference.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(ExternalVariableReference.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(ExternalVariableReference.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(ExternalVariableReference.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(ExternalVariableReference.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(ExternalVariableReference.VIRTUAL_PACKAGE, value);
  }

  public Variable getVariable() {
    return (Variable) this.getReferent(Variable.class, ExternalVariableReference.VARIABLE);
  }

  public void setVariable(Variable node) {
    super.setReferent(ExternalVariableReference.VARIABLE, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(ExternalVariableReference.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, ExternalVariableReference.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, ExternalVariableReference.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(ExternalVariableReference.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, ExternalVariableReference.SMODEL_ATTRIBUTE, node);
  }

  public static ExternalVariableReference newInstance(SModel sm, boolean init) {
    return (ExternalVariableReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.build.distrib.structure.ExternalVariableReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExternalVariableReference newInstance(SModel sm) {
    return ExternalVariableReference.newInstance(sm, false);
  }
}
