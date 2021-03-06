package jetbrains.mps.lang.constraints.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ConstraintFunctionParameter_oldReferentNode extends ConceptFunctionParameter {
  public static final String concept = "jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_oldReferentNode";

  public ConstraintFunctionParameter_oldReferentNode(SNode node) {
    super(node);
  }

  public static ConstraintFunctionParameter_oldReferentNode newInstance(SModel sm, boolean init) {
    return (ConstraintFunctionParameter_oldReferentNode) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_oldReferentNode", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ConstraintFunctionParameter_oldReferentNode newInstance(SModel sm) {
    return ConstraintFunctionParameter_oldReferentNode.newInstance(sm, false);
  }
}
