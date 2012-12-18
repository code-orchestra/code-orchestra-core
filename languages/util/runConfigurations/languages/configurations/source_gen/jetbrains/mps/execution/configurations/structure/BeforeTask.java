package jetbrains.mps.execution.configurations.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.execution.common.structure.IGeneratedToClass;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.lang.core.structure.Attribute;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BeforeTask extends BaseConcept implements IGeneratedToClass {
  public static final String concept = "jetbrains.mps.execution.configurations.structure.BeforeTask";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String EXECUTE = "execute";
  public static final String PARAMETER = "parameter";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public BeforeTask(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(BeforeTask.NAME);
  }

  public void setName(String value) {
    this.setProperty(BeforeTask.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(BeforeTask.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(BeforeTask.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(BeforeTask.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(BeforeTask.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(BeforeTask.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(BeforeTask.VIRTUAL_PACKAGE, value);
  }

  public ExecuteBeforeTask_ConceptFunction getExecute() {
    return (ExecuteBeforeTask_ConceptFunction) this.getChild(ExecuteBeforeTask_ConceptFunction.class, BeforeTask.EXECUTE);
  }

  public void setExecute(ExecuteBeforeTask_ConceptFunction node) {
    super.setChild(BeforeTask.EXECUTE, node);
  }

  public int getParametersCount() {
    return this.getChildCount(BeforeTask.PARAMETER);
  }

  public Iterator<BeforeTaskParameter> parameters() {
    return this.children(BeforeTaskParameter.class, BeforeTask.PARAMETER);
  }

  public List<BeforeTaskParameter> getParameters() {
    return this.getChildren(BeforeTaskParameter.class, BeforeTask.PARAMETER);
  }

  public void addParameter(BeforeTaskParameter node) {
    this.addChild(BeforeTask.PARAMETER, node);
  }

  public void insertParameter(BeforeTaskParameter prev, BeforeTaskParameter node) {
    this.insertChild(prev, BeforeTask.PARAMETER, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(BeforeTask.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, BeforeTask.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, BeforeTask.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(BeforeTask.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, BeforeTask.SMODEL_ATTRIBUTE, node);
  }

  public static BeforeTask newInstance(SModel sm, boolean init) {
    return (BeforeTask) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.execution.configurations.structure.BeforeTask", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BeforeTask newInstance(SModel sm) {
    return BeforeTask.newInstance(sm, false);
  }
}
