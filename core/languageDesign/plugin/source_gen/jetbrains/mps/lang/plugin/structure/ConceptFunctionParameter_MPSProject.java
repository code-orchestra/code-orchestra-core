package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ConceptFunctionParameter_MPSProject extends ConceptFunctionParameter {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.ConceptFunctionParameter_MPSProject";

  public ConceptFunctionParameter_MPSProject(SNode node) {
    super(node);
  }

  public static ConceptFunctionParameter_MPSProject newInstance(SModel sm, boolean init) {
    return (ConceptFunctionParameter_MPSProject) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.ConceptFunctionParameter_MPSProject", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ConceptFunctionParameter_MPSProject newInstance(SModel sm) {
    return ConceptFunctionParameter_MPSProject.newInstance(sm, false);
  }
}
