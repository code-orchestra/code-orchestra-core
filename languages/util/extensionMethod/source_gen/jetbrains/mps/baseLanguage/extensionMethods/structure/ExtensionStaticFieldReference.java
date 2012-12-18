package jetbrains.mps.baseLanguage.extensionMethods.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.VariableReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExtensionStaticFieldReference extends VariableReference {
  public static final String concept = "jetbrains.mps.baseLanguage.extensionMethods.structure.ExtensionStaticFieldReference";

  public ExtensionStaticFieldReference(SNode node) {
    super(node);
  }

  public ExtensionStaticFieldDeclaration getStaticFieldDeclaration() {
    return this.ensureAdapter(ExtensionStaticFieldDeclaration.class, "variableDeclaration", this.getVariableDeclaration());
  }

  public void setStaticFieldDeclaration(ExtensionStaticFieldDeclaration node) {
    this.setVariableDeclaration(node);
  }

  public static ExtensionStaticFieldReference newInstance(SModel sm, boolean init) {
    return (ExtensionStaticFieldReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.extensionMethods.structure.ExtensionStaticFieldReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExtensionStaticFieldReference newInstance(SModel sm) {
    return ExtensionStaticFieldReference.newInstance(sm, false);
  }
}
