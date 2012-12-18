package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ConceptFunction extends BaseConcept implements IMethodLike, IStatementListContainer {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.ConceptFunction";
  public static final String CPR_UsesParameterObject = "usesParameterObject";
  public static final String CPR_ShowName = "showName";
  public static final String CLNK_ConceptFunctionReturnType = "conceptFunctionReturnType";
  public static final String CLNK_ConceptFunctionThrowsType = "conceptFunctionThrowsType";
  public static final String CLNK_ConceptFunctionParameter = "conceptFunctionParameter";
  public static final String CLNK_ApplicableConceptFunctionParameter = "applicableConceptFunctionParameter";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String BODY = "body";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public ConceptFunction(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(ConceptFunction.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(ConceptFunction.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(ConceptFunction.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(ConceptFunction.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(ConceptFunction.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(ConceptFunction.VIRTUAL_PACKAGE, value);
  }

  public StatementList getBody() {
    return (StatementList) this.getChild(StatementList.class, ConceptFunction.BODY);
  }

  public void setBody(StatementList node) {
    super.setChild(ConceptFunction.BODY, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(ConceptFunction.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, ConceptFunction.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, ConceptFunction.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(ConceptFunction.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, ConceptFunction.SMODEL_ATTRIBUTE, node);
  }

  public static ConceptFunction newInstance(SModel sm, boolean init) {
    return (ConceptFunction) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ConceptFunction", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ConceptFunction newInstance(SModel sm) {
    return ConceptFunction.newInstance(sm, false);
  }
}
