package jetbrains.mps.lang.editor.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;

public abstract class AbstractPaddingStyleClassItem_BehaviorDescriptor extends FloatStyleClassItem_BehaviorDescriptor {
  public AbstractPaddingStyleClassItem_BehaviorDescriptor() {
  }

  public boolean virtual_isApplicableTo_1214304723440(SNode thisNode, SNode cellModel) {
    return AbstractPaddingStyleClassItem_Behavior.virtual_isApplicableTo_1214304723440(thisNode, cellModel);
  }

  public boolean virtual_canUseSpaces_1226492824000(SNode thisNode) {
    return AbstractPaddingStyleClassItem_Behavior.virtual_canUseSpaces_1226492824000(thisNode);
  }

  @Override
  public String getConceptFqName() {
    return "jetbrains.mps.lang.editor.structure.AbstractPaddingStyleClassItem";
  }
}
