package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.classifiers.structure.BaseClassifierType;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MultitabbedEditorTabType extends BaseClassifierType {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.MultitabbedEditorTabType";

  public MultitabbedEditorTabType(SNode node) {
    super(node);
  }

  public static MultitabbedEditorTabType newInstance(SModel sm, boolean init) {
    return (MultitabbedEditorTabType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.MultitabbedEditorTabType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MultitabbedEditorTabType newInstance(SModel sm) {
    return MultitabbedEditorTabType.newInstance(sm, false);
  }
}
