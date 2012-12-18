package jetbrains.mps.baseLanguage.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;

public class ConvertElsifToNewIfStatement_Intention extends BaseIntention implements Intention {
  public ConvertElsifToNewIfStatement_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.baseLanguage.structure.ElsifClause";
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
    return "Convert Else-If Clause to New If Statement";
  }

  public boolean isApplicable(final SNode node, final EditorContext editorContext) {
    if (!(this.isApplicableToNode(node, editorContext))) {
      return false;
    }
    return true;
  }

  public boolean isApplicableToNode(final SNode node, final EditorContext editorContext) {
    SNode statement = SNodeOperations.getAncestor(node, "jetbrains.mps.baseLanguage.structure.IfStatement", false, false);
    SNode statementParent = SNodeOperations.getParent(statement);
    return (statementParent != null) && SNodeOperations.isInstanceOf(statementParent, "jetbrains.mps.baseLanguage.structure.StatementList") && SNodeOperations.getIndexInParent(node) == SNodeOperations.getIndexInParent(ListSequence.fromList(SLinkOperations.getTargets(statement, "elsifClauses", true)).last()) && (SLinkOperations.getTarget(statement, "ifFalseStatement", true) == null);
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SNode ifStatement = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.IfStatement", null);
    SLinkOperations.setTarget(ifStatement, "condition", SNodeOperations.copyNode(SLinkOperations.getTarget(node, "condition", true)), true);
    SLinkOperations.setTarget(ifStatement, "ifTrue", SNodeOperations.copyNode(SLinkOperations.getTarget(node, "statementList", true)), true);
    SNode statement = SNodeOperations.getAncestor(node, "jetbrains.mps.baseLanguage.structure.Statement", false, false);
    SNodeOperations.insertNextSiblingChild(statement, ifStatement);
    SNodeOperations.deleteNode(node);
  }

  public String getLocationString() {
    return "jetbrains.mps.baseLanguage.intentions";
  }
}
