package jetbrains.mps.baseLanguage.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class CreateReferenceOnClass_Intention extends BaseIntention implements Intention {
  public CreateReferenceOnClass_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.baseLanguage.structure.ThisExpression";
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
    return "Create a Reference on Outer Class";
  }

  public boolean isApplicable(final SNode node, final EditorContext editorContext) {
    if (!(this.isApplicableToNode(node, editorContext))) {
      return false;
    }
    return true;
  }

  public boolean isApplicableToNode(final SNode node, final EditorContext editorContext) {
    SNode outerConcept = SNodeOperations.getAncestor(SNodeOperations.getAncestor(node, "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false), "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false);
    while ((outerConcept != null)) {
      if (SNodeOperations.isInstanceOf(outerConcept, "jetbrains.mps.baseLanguage.structure.AnonymousClass")) {
        outerConcept = SNodeOperations.getAncestor(outerConcept, "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false);
      } else {
        break;
      }
    }
    return (outerConcept != null);
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SNode outerConcept = SNodeOperations.getAncestor(SNodeOperations.getAncestor(node, "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false), "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false);
    while ((outerConcept != null)) {
      if (SNodeOperations.isInstanceOf(outerConcept, "jetbrains.mps.baseLanguage.structure.AnonymousClass")) {
        outerConcept = SNodeOperations.getAncestor(outerConcept, "jetbrains.mps.baseLanguage.structure.ClassConcept", false, false);
      } else {
        break;
      }
    }
    SLinkOperations.setTarget(node, "classConcept", outerConcept, false);
  }

  public String getLocationString() {
    return "jetbrains.mps.baseLanguage.intentions";
  }
}
