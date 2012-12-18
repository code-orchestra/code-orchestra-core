package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.ConceptFunction;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class CellMenuPart_PropertyPostfixHints_GetPostfixes extends ConceptFunction {
  public static final String concept = "jetbrains.mps.lang.editor.structure.CellMenuPart_PropertyPostfixHints_GetPostfixes";

  public CellMenuPart_PropertyPostfixHints_GetPostfixes(SNode node) {
    super(node);
  }

  public static CellMenuPart_PropertyPostfixHints_GetPostfixes newInstance(SModel sm, boolean init) {
    return (CellMenuPart_PropertyPostfixHints_GetPostfixes) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.CellMenuPart_PropertyPostfixHints_GetPostfixes", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static CellMenuPart_PropertyPostfixHints_GetPostfixes newInstance(SModel sm) {
    return CellMenuPart_PropertyPostfixHints_GetPostfixes.newInstance(sm, false);
  }
}
