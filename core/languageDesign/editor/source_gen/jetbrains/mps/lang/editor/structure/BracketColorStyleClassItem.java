package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BracketColorStyleClassItem extends ColorStyleClassItem {
  public static final String concept = "jetbrains.mps.lang.editor.structure.BracketColorStyleClassItem";

  public BracketColorStyleClassItem(SNode node) {
    super(node);
  }

  public static BracketColorStyleClassItem newInstance(SModel sm, boolean init) {
    return (BracketColorStyleClassItem) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.BracketColorStyleClassItem", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BracketColorStyleClassItem newInstance(SModel sm) {
    return BracketColorStyleClassItem.newInstance(sm, false);
  }
}
