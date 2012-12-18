package jetbrains.mps.ui.modeling.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class PropertyChangeHandlerSetup extends ConceptFunction {
  public static final String concept = "jetbrains.mps.ui.modeling.structure.PropertyChangeHandlerSetup";

  public PropertyChangeHandlerSetup(SNode node) {
    super(node);
  }

  public static PropertyChangeHandlerSetup newInstance(SModel sm, boolean init) {
    return (PropertyChangeHandlerSetup) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ui.modeling.structure.PropertyChangeHandlerSetup", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static PropertyChangeHandlerSetup newInstance(SModel sm) {
    return PropertyChangeHandlerSetup.newInstance(sm, false);
  }
}
