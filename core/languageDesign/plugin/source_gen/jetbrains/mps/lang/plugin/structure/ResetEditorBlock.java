package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ResetEditorBlock extends AbstractEnhancedConceptFunction {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.ResetEditorBlock";

  public ResetEditorBlock(SNode node) {
    super(node);
  }

  public static ResetEditorBlock newInstance(SModel sm, boolean init) {
    return (ResetEditorBlock) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.ResetEditorBlock", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ResetEditorBlock newInstance(SModel sm) {
    return ResetEditorBlock.newInstance(sm, false);
  }
}
