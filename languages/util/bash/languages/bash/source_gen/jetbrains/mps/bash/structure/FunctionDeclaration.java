package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.INamedConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.lang.core.structure.Attribute;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class FunctionDeclaration extends AbstractCommand implements INamedConcept {
  public static final String concept = "jetbrains.mps.bash.structure.FunctionDeclaration";
  public static final String NAME = "name";
  public static final String SHORT_DESCRIPTION = "shortDescription";
  public static final String ALIAS = "alias";
  public static final String VIRTUAL_PACKAGE = "virtualPackage";
  public static final String COMMAND = "command";
  public static final String REDIRECTIONS = "redirections";
  public static final String SMODEL_ATTRIBUTE = "smodelAttribute";

  public FunctionDeclaration(SNode node) {
    super(node);
  }

  public String getName() {
    return this.getProperty(FunctionDeclaration.NAME);
  }

  public void setName(String value) {
    this.setProperty(FunctionDeclaration.NAME, value);
  }

  public String getShortDescription() {
    return this.getProperty(FunctionDeclaration.SHORT_DESCRIPTION);
  }

  public void setShortDescription(String value) {
    this.setProperty(FunctionDeclaration.SHORT_DESCRIPTION, value);
  }

  public String getAlias() {
    return this.getProperty(FunctionDeclaration.ALIAS);
  }

  public void setAlias(String value) {
    this.setProperty(FunctionDeclaration.ALIAS, value);
  }

  public String getVirtualPackage() {
    return this.getProperty(FunctionDeclaration.VIRTUAL_PACKAGE);
  }

  public void setVirtualPackage(String value) {
    this.setProperty(FunctionDeclaration.VIRTUAL_PACKAGE, value);
  }

  public ICompoundCommand getCommand() {
    return (ICompoundCommand) this.getChild(ICompoundCommand.class, FunctionDeclaration.COMMAND);
  }

  public void setCommand(ICompoundCommand node) {
    super.setChild(FunctionDeclaration.COMMAND, node);
  }

  public int getRedirectionsesCount() {
    return this.getChildCount(FunctionDeclaration.REDIRECTIONS);
  }

  public Iterator<Redirection> redirectionses() {
    return this.children(Redirection.class, FunctionDeclaration.REDIRECTIONS);
  }

  public List<Redirection> getRedirectionses() {
    return this.getChildren(Redirection.class, FunctionDeclaration.REDIRECTIONS);
  }

  public void addRedirections(Redirection node) {
    this.addChild(FunctionDeclaration.REDIRECTIONS, node);
  }

  public void insertRedirections(Redirection prev, Redirection node) {
    this.insertChild(prev, FunctionDeclaration.REDIRECTIONS, node);
  }

  public int getSmodelAttributesCount() {
    return this.getChildCount(FunctionDeclaration.SMODEL_ATTRIBUTE);
  }

  public Iterator<Attribute> smodelAttributes() {
    return this.children(Attribute.class, FunctionDeclaration.SMODEL_ATTRIBUTE);
  }

  public List<Attribute> getSmodelAttributes() {
    return this.getChildren(Attribute.class, FunctionDeclaration.SMODEL_ATTRIBUTE);
  }

  public void addSmodelAttribute(Attribute node) {
    this.addChild(FunctionDeclaration.SMODEL_ATTRIBUTE, node);
  }

  public void insertSmodelAttribute(Attribute prev, Attribute node) {
    this.insertChild(prev, FunctionDeclaration.SMODEL_ATTRIBUTE, node);
  }

  public static FunctionDeclaration newInstance(SModel sm, boolean init) {
    return (FunctionDeclaration) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.FunctionDeclaration", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static FunctionDeclaration newInstance(SModel sm) {
    return FunctionDeclaration.newInstance(sm, false);
  }
}
