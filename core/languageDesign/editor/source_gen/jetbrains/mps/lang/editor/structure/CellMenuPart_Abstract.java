package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class CellMenuPart_Abstract extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.editor.structure.CellMenuPart_Abstract";

  public CellMenuPart_Abstract(SNode node) {
    super(node);
  }

  public static CellMenuPart_Abstract newInstance(SModel sm, boolean init) {
    return (CellMenuPart_Abstract) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.CellMenuPart_Abstract", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static CellMenuPart_Abstract newInstance(SModel sm) {
    return CellMenuPart_Abstract.newInstance(sm, false);
  }
}
