package jetbrains.mps.baseLanguage.textGen;

/*Generated by MPS */

import jetbrains.mps.textGen.SNodeTextGen;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class Visibility_TextGen extends SNodeTextGen {
  public void doGenerateText(SNode node) {
    if (SNodeOperations.isInstanceOf(node, "jetbrains.mps.baseLanguage.structure.PrivateVisibility")) {
      this.append("private ");
    }
    if (SNodeOperations.isInstanceOf(node, "jetbrains.mps.baseLanguage.structure.ProtectedVisibility")) {
      this.append("protected ");
    }
    if (SNodeOperations.isInstanceOf(node, "jetbrains.mps.baseLanguage.structure.PublicVisibility")) {
      this.append("public ");
    }
  }
}
