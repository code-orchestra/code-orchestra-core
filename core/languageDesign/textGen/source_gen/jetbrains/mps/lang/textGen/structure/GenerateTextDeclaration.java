package jetbrains.mps.lang.textGen.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GenerateTextDeclaration extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration";

  public GenerateTextDeclaration(SNode node) {
    super(node);
  }

  public static GenerateTextDeclaration newInstance(SModel sm, boolean init) {
    return (GenerateTextDeclaration) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GenerateTextDeclaration newInstance(SModel sm) {
    return GenerateTextDeclaration.newInstance(sm, false);
  }
}
