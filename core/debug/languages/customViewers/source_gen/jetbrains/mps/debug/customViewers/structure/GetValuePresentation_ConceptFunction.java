package jetbrains.mps.debug.customViewers.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GetValuePresentation_ConceptFunction extends ConceptFunction {
  public static final String concept = "jetbrains.mps.debug.customViewers.structure.GetValuePresentation_ConceptFunction";

  public GetValuePresentation_ConceptFunction(SNode node) {
    super(node);
  }

  public static GetValuePresentation_ConceptFunction newInstance(SModel sm, boolean init) {
    return (GetValuePresentation_ConceptFunction) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.debug.customViewers.structure.GetValuePresentation_ConceptFunction", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GetValuePresentation_ConceptFunction newInstance(SModel sm) {
    return GetValuePresentation_ConceptFunction.newInstance(sm, false);
  }
}
