package jetbrains.mps.baseLanguage.typesystem;

/*Generated by MPS */

import jetbrains.mps.errors.QuickFix_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.baseLanguage.plugin.ParenthesisUtil;

public class BinaryExpressionPriority_QuickFix extends QuickFix_Runtime {
  public BinaryExpressionPriority_QuickFix() {
  }

  public String getDescription() {
    return "Fix syntax tree operation priorities.";
  }

  public void execute(SNode node) {
    if (SLinkOperations.getTarget(((SNode) BinaryExpressionPriority_QuickFix.this.getField("parent")[0]), "leftExpression", true) == ((SNode) BinaryExpressionPriority_QuickFix.this.getField("child")[0])) {
      ParenthesisUtil.rotateTree(((SNode) BinaryExpressionPriority_QuickFix.this.getField("child")[0]), ((SNode) BinaryExpressionPriority_QuickFix.this.getField("parent")[0]), false);
    } else if (SLinkOperations.getTarget(((SNode) BinaryExpressionPriority_QuickFix.this.getField("parent")[0]), "rightExpression", true) == ((SNode) BinaryExpressionPriority_QuickFix.this.getField("child")[0])) {
      ParenthesisUtil.rotateTree(((SNode) BinaryExpressionPriority_QuickFix.this.getField("child")[0]), ((SNode) BinaryExpressionPriority_QuickFix.this.getField("parent")[0]), true);
    }
  }
}
