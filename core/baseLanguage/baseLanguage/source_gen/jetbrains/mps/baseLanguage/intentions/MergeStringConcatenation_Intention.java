package jetbrains.mps.baseLanguage.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class MergeStringConcatenation_Intention extends BaseIntention implements Intention {
  public MergeStringConcatenation_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.baseLanguage.structure.PlusExpression";
  }

  public boolean isParameterized() {
    return false;
  }

  public boolean isErrorIntention() {
    return false;
  }

  public boolean isAvailableInChildNodes() {
    return false;
  }

  public String getDescription(final SNode node, final EditorContext editorContext) {
    return "Merge String Concatination";
  }

  public boolean isApplicable(final SNode node, final EditorContext editorContext) {
    if (!(this.isApplicableToNode(node, editorContext))) {
      return false;
    }
    return true;
  }

  public boolean isApplicableToNode(final SNode node, final EditorContext editorContext) {
    return SNodeOperations.isInstanceOf(SLinkOperations.getTarget(node, "leftExpression", true), "jetbrains.mps.baseLanguage.structure.StringLiteral") && SNodeOperations.isInstanceOf(SLinkOperations.getTarget(node, "rightExpression", true), "jetbrains.mps.baseLanguage.structure.StringLiteral");
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SNode stringLiteral = SNodeFactoryOperations.replaceWithNewChild(node, "jetbrains.mps.baseLanguage.structure.StringLiteral");
    String left = SPropertyOperations.getString(SNodeOperations.cast(SLinkOperations.getTarget(node, "leftExpression", true), "jetbrains.mps.baseLanguage.structure.StringLiteral"), "value");
    String right = SPropertyOperations.getString(SNodeOperations.cast(SLinkOperations.getTarget(node, "rightExpression", true), "jetbrains.mps.baseLanguage.structure.StringLiteral"), "value");
    SPropertyOperations.set(stringLiteral, "value", left + right);
    editorContext.selectAndSetCaret(stringLiteral, left.length() + 1);
  }

  public String getLocationString() {
    return "jetbrains.mps.baseLanguage.intentions";
  }
}
