package jetbrains.mps.baseLanguageInternal.textGen;

/*Generated by MPS */

import jetbrains.mps.textGen.SNodeTextGen;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.textGen.TextGenManager;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class TypeHintExpression_TextGen extends SNodeTextGen {
  public void doGenerateText(SNode node) {
    TextGenManager.instance().appendNodeText(this.getContext(), this.getBuffer(), SLinkOperations.getTarget(node, "expression", true), this.getSNode());
  }
}
