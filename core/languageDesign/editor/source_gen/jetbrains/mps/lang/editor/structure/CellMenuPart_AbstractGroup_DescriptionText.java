package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class CellMenuPart_AbstractGroup_DescriptionText extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.editor.structure.CellMenuPart_AbstractGroup_DescriptionText";

  public CellMenuPart_AbstractGroup_DescriptionText(SNode node) {
    super(node);
  }

  public static CellMenuPart_AbstractGroup_DescriptionText newInstance(SModel sm, boolean init) {
    return (CellMenuPart_AbstractGroup_DescriptionText) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.CellMenuPart_AbstractGroup_DescriptionText", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static CellMenuPart_AbstractGroup_DescriptionText newInstance(SModel sm) {
    return CellMenuPart_AbstractGroup_DescriptionText.newInstance(sm, false);
  }
}
