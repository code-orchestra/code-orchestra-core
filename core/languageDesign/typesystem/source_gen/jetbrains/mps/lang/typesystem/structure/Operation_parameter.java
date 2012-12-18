package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunctionParameter;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Operation_parameter extends ConceptFunctionParameter {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.Operation_parameter";

  public Operation_parameter(SNode node) {
    super(node);
  }

  public static Operation_parameter newInstance(SModel sm, boolean init) {
    return (Operation_parameter) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.Operation_parameter", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Operation_parameter newInstance(SModel sm) {
    return Operation_parameter.newInstance(sm, false);
  }
}
