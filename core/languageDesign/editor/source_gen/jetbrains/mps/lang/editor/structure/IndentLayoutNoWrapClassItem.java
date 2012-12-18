package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class IndentLayoutNoWrapClassItem extends BooleanStyleSheetItem {
  public static final String concept = "jetbrains.mps.lang.editor.structure.IndentLayoutNoWrapClassItem";

  public IndentLayoutNoWrapClassItem(SNode node) {
    super(node);
  }

  public static IndentLayoutNoWrapClassItem newInstance(SModel sm, boolean init) {
    return (IndentLayoutNoWrapClassItem) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.IndentLayoutNoWrapClassItem", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static IndentLayoutNoWrapClassItem newInstance(SModel sm) {
    return IndentLayoutNoWrapClassItem.newInstance(sm, false);
  }
}
