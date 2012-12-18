package jetbrains.mps.baseLanguage.datesInternal.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.StaticMethodCall;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class PredefinedPeriodFormat extends BaseConcept implements IPeriodFormat {
  public static final String concept = "jetbrains.mps.baseLanguage.datesInternal.structure.PredefinedPeriodFormat";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String IS_PUBLIC = "isPublic";
  public static final String FORMATTER = "formatter";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public PredefinedPeriodFormat(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(PredefinedPeriodFormat.NAME);
  }

  public void setName(String value) {
    this.setProperty(PredefinedPeriodFormat.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(PredefinedPeriodFormat.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(PredefinedPeriodFormat.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(PredefinedPeriodFormat.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(PredefinedPeriodFormat.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(PredefinedPeriodFormat.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(PredefinedPeriodFormat.VIRTUAL_PACKAGE, value);
  }

  public boolean getIsPublic() {
    return this.getBooleanProperty(PredefinedPeriodFormat.IS_PUBLIC);
  }

  public void setIsPublic(boolean value) {
    this.setBooleanProperty(PredefinedPeriodFormat.IS_PUBLIC, value);
  }

  public StaticMethodCall getFormatter() {
    return (StaticMethodCall) this.getChild(StaticMethodCall.class, PredefinedPeriodFormat.FORMATTER);
  }

  public void setFormatter(StaticMethodCall node) {
    super.setChild(PredefinedPeriodFormat.FORMATTER, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(PredefinedPeriodFormat.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, PredefinedPeriodFormat.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, PredefinedPeriodFormat.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(PredefinedPeriodFormat.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, PredefinedPeriodFormat.SMODEL_ATTRIBUTE, node);
  }

  public static PredefinedPeriodFormat newInstance(SModel sm, boolean init) {
    return (PredefinedPeriodFormat) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.datesInternal.structure.PredefinedPeriodFormat", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PredefinedPeriodFormat newInstance(SModel sm) {
    return PredefinedPeriodFormat.newInstance(sm, false);
  }
}
