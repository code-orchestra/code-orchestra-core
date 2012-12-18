package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.lang.core.structure.INamedConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.structure.LinkDeclaration;
import jetbrains.mps.baseLanguage.structure.Expression;
import java.util.Iterator;
import jetbrains.mps.lang.core.structure.Attribute;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ChildTypeRestriction extends BaseConcept implements INamedConcept {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.ChildTypeRestriction";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String RESTRICTION_KIND = "restrictionKind";
  public static final String CHILD_LINK_DECLARATION = "childLinkDeclaration";
  public static final String TYPE = "type";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public ChildTypeRestriction(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(ChildTypeRestriction.NAME);
  }

  public void setName(String value) {
    this.setProperty(ChildTypeRestriction.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(ChildTypeRestriction.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(ChildTypeRestriction.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(ChildTypeRestriction.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(ChildTypeRestriction.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(ChildTypeRestriction.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(ChildTypeRestriction.VIRTUAL_PACKAGE, value);
  }

  public RestrictionKind getRestrictionKind() {
    String value = super.getProperty(ChildTypeRestriction.RESTRICTION_KIND);
    return RestrictionKind.parseValue(value);
  }

  public void setRestrictionKind(RestrictionKind value) {
    super.setProperty(ChildTypeRestriction.RESTRICTION_KIND, value.getValueAsString());
  }

  public LinkDeclaration getChildLinkDeclaration() {
    return (LinkDeclaration) this.getReferent(LinkDeclaration.class, ChildTypeRestriction.CHILD_LINK_DECLARATION);
  }

  public void setChildLinkDeclaration(LinkDeclaration node) {
    super.setReferent(ChildTypeRestriction.CHILD_LINK_DECLARATION, node);
  }

  public Expression getType() {
    return (Expression) this.getChild(Expression.class, ChildTypeRestriction.TYPE);
  }

  public void setType(Expression node) {
    super.setChild(ChildTypeRestriction.TYPE, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(ChildTypeRestriction.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, ChildTypeRestriction.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, ChildTypeRestriction.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(ChildTypeRestriction.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, ChildTypeRestriction.SMODEL_ATTRIBUTE, node);
  }

  public static ChildTypeRestriction newInstance(SModel sm, boolean init) {
    return (ChildTypeRestriction) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.ChildTypeRestriction", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ChildTypeRestriction newInstance(SModel sm) {
    return ChildTypeRestriction.newInstance(sm, false);
  }
}
