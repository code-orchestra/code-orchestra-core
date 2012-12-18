package codeOrchestra.actionScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.icons.Icons;
import codeOrchestra.actionScript.debugger.ui.ASStackFrame;
import codeOrchestra.actionScript.debugger.ui.ASWatchablesCategory;
import flash.tools.debugger.Variable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

/**
 * @author Alexander Eliseyev
 */
public class ASThisVariable extends ASVariable {

  public ASThisVariable(FDBEventsProcessor eventsProcessor, Variable variable, ASStackFrame stackFrame) {
    super(eventsProcessor, variable, stackFrame);
  }

  @Override
  public WatchablesCategory getCategory() {
    return ASWatchablesCategory.THIS_OBJECT;
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.CLASS;
  }

  @Override
  public SNode getNode() {
    SNode stackFrameNode = getStackFrameNode();
    if (stackFrameNode == null) {
      return null;
    }

    return SNodeOperations.getAncestor(stackFrameNode, "codeOrchestra.actionScript.structure.ClassConcept", true, false);
  }
}