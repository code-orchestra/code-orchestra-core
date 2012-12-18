package jetbrains.mps.baseLanguage.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;

public class InvertIfCondition_Intention extends BaseIntention implements Intention {
  public InvertIfCondition_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.baseLanguage.structure.IfStatement";
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
    return "Invert If Condition";
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    // Invert condition 
    SNode condition = SLinkOperations.getTarget(node, "condition", true);
    if ((condition != null)) {
      if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.NotExpression")) {
        condition = SLinkOperations.getTarget(SNodeOperations.cast(condition, "jetbrains.mps.baseLanguage.structure.NotExpression"), "expression", true);
      } else {
        SNode newCondition = null;
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.EqualsExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.NotEqualsExpression", null);
        } else
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.NotEqualsExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.EqualsExpression", null);
        } else
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.GreaterThanExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.LessThanOrEqualsExpression", null);
        } else
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.GreaterThanOrEqualsExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.LessThanExpression", null);
        } else
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.LessThanExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.GreaterThanOrEqualsExpression", null);
        } else
        if (SNodeOperations.isInstanceOf(condition, "jetbrains.mps.baseLanguage.structure.LessThanOrEqualsExpression")) {
          newCondition = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.GreaterThanExpression", null);
        }
        if (newCondition != null) {
          SLinkOperations.setTarget(newCondition, "leftExpression", SLinkOperations.getTarget(SNodeOperations.cast(condition, "jetbrains.mps.baseLanguage.structure.BinaryOperation"), "leftExpression", true), true);
          SLinkOperations.setTarget(newCondition, "rightExpression", SLinkOperations.getTarget(SNodeOperations.cast(condition, "jetbrains.mps.baseLanguage.structure.BinaryOperation"), "rightExpression", true), true);
          condition = newCondition;
        } else {
          SNode notExpression = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.NotExpression", null);
          SLinkOperations.setTarget(notExpression, "expression", condition, true);
          condition = notExpression;
        }
      }
      SLinkOperations.setTarget(node, "condition", condition, true);
    }
    // Flip ifTrue and ifFalse 
    SNode ifTrue = SLinkOperations.getTarget(node, "ifTrue", true);
    SNode ifFalse = SLinkOperations.getTarget(node, "ifFalseStatement", true);
    SNode newIfTrue;
    SNode newIfFalse;
    // Set new ifFalse 
    if (ListSequence.fromList(SLinkOperations.getTargets(ifTrue, "statement", true)).count() == 0) {
      newIfFalse = null;
    } else
    if (ListSequence.fromList(SLinkOperations.getTargets(ifTrue, "statement", true)).count() == 1 && SNodeOperations.isInstanceOf(ListSequence.fromList(SLinkOperations.getTargets(ifTrue, "statement", true)).first(), "jetbrains.mps.baseLanguage.structure.IfStatement")) {
      newIfFalse = ListSequence.fromList(SLinkOperations.getTargets(ifTrue, "statement", true)).first();
    } else {
      newIfFalse = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.BlockStatement", null);
      SLinkOperations.setTarget(SNodeOperations.cast(newIfFalse, "jetbrains.mps.baseLanguage.structure.BlockStatement"), "statements", ifTrue, true);
    }
    // Set new ifTrue 
    if (SNodeOperations.isInstanceOf(ifFalse, "jetbrains.mps.baseLanguage.structure.BlockStatement")) {
      newIfTrue = SLinkOperations.getTarget(SNodeOperations.cast(ifFalse, "jetbrains.mps.baseLanguage.structure.BlockStatement"), "statements", true);
    } else {
      newIfTrue = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguage.structure.StatementList", null);
      if (ifFalse != null) {
        ListSequence.fromList(SLinkOperations.getTargets(newIfTrue, "statement", true)).addElement(ifFalse);
      }
    }
    SLinkOperations.setTarget(node, "ifTrue", newIfTrue, true);
    SLinkOperations.setTarget(node, "ifFalseStatement", newIfFalse, true);
  }

  public String getLocationString() {
    return "jetbrains.mps.baseLanguage.intentions";
  }
}
