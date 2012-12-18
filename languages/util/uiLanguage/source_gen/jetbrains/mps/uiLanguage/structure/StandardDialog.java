package jetbrains.mps.uiLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.lang.core.structure.Attribute;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class StandardDialog extends BaseConcept implements IComponentInstance {
  public static final String concept = "jetbrains.mps.uiLanguage.structure.StandardDialog";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String ROOT_COMPONENT = "rootComponent";
  public static final String BUTTON = "button";
  public static final String CONTENT = "content";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public StandardDialog(SNode node) {
    super(node);
  }

  public String getShortDescription() {
    return this.getProperty(StandardDialog.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(StandardDialog.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(StandardDialog.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(StandardDialog.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(StandardDialog.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(StandardDialog.VIRTUAL_PACKAGE, value);
  }

  public IComponentInstance getRootComponent() {
    return (IComponentInstance) this.getChild(IComponentInstance.class, StandardDialog.ROOT_COMPONENT);
  }

  public void setRootComponent(IComponentInstance node) {
    super.setChild(StandardDialog.ROOT_COMPONENT, node);
  }

  public int getButtonsCount() {
    return this.getChildCount(StandardDialog.BUTTON);
  }

  public Iterator<StandardDialogButton> buttons() {
    return this.children(StandardDialogButton.class, StandardDialog.BUTTON);
  }

  public List<StandardDialogButton> getButtons() {
    return this.getChildren(StandardDialogButton.class, StandardDialog.BUTTON);
  }

  public void addButton(StandardDialogButton node) {
    this.addChild(StandardDialog.BUTTON, node);
  }

  public void insertButton(StandardDialogButton prev, StandardDialogButton node) {
    this.insertChild(prev, StandardDialog.BUTTON, node);
  }

  public int getContentsCount() {
    return this.getChildCount(StandardDialog.CONTENT);
  }

  public Iterator<IComponentPart> contents() {
    return this.children(IComponentPart.class, StandardDialog.CONTENT);
  }

  public List<IComponentPart> getContents() {
    return this.getChildren(IComponentPart.class, StandardDialog.CONTENT);
  }

  public void addContent(IComponentPart node) {
    this.addChild(StandardDialog.CONTENT, node);
  }

  public void insertContent(IComponentPart prev, IComponentPart node) {
    this.insertChild(prev, StandardDialog.CONTENT, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(StandardDialog.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, StandardDialog.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, StandardDialog.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(StandardDialog.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, StandardDialog.SMODEL_ATTRIBUTE, node);
  }

  public static StandardDialog newInstance(SModel sm, boolean init) {
    return (StandardDialog) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.uiLanguage.structure.StandardDialog", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static StandardDialog newInstance(SModel sm) {
    return StandardDialog.newInstance(sm, false);
  }
}
