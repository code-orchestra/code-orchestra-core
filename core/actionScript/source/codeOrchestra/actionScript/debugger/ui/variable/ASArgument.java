package codeOrchestra.actionScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.ui.ASStackFrame;
import codeOrchestra.actionScript.debugger.ui.ASWatchablesCategory;
import flash.tools.debugger.Variable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander ELiseyev
 */
public class ASArgument extends ASVariable {

  public ASArgument(FDBEventsProcessor eventsProcessor, Variable variable, ASStackFrame stackFrame) {
    super(eventsProcessor, variable, stackFrame);
  }

  @Override
  public WatchablesCategory getCategory() {
    return ASWatchablesCategory.ARGUMENT;
  }

  @Override
  public SNode getNode() {
    SNode stackFrameNode = getStackFrameNode();
    if (stackFrameNode == null) {
      return null;
    }

    SNode function = SNodeOperations.getAncestor(stackFrameNode, "codeOrchestra.actionScript.structure.IFunctionConcept", false, false);
    if (function != null) {
      return ListSequence.fromList(SLinkOperations.getTargets(function, "parameter", true)).findFirst(new IWhereFilter<SNode>() {
        public boolean accept(SNode it) {
          return getName().equals(SPropertyOperations.getString(it, "name"));
        }
      });
    }

    return null;
  }
}
