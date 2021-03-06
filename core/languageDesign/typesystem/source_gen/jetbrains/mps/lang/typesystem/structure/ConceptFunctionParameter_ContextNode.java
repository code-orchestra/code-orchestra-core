package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ConceptFunctionParameter_ContextNode extends ConceptFunctionParameter {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.ConceptFunctionParameter_ContextNode";

  public ConceptFunctionParameter_ContextNode(SNode node) {
    super(node);
  }

  public static ConceptFunctionParameter_ContextNode newInstance(SModel sm, boolean init) {
    return (ConceptFunctionParameter_ContextNode) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.ConceptFunctionParameter_ContextNode", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ConceptFunctionParameter_ContextNode newInstance(SModel sm) {
    return ConceptFunctionParameter_ContextNode.newInstance(sm, false);
  }
}
