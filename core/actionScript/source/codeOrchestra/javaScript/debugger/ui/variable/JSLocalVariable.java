package codeOrchestra.javaScript.debugger.ui.variable;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.ui.JSStackFrame;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.smodel.SNode;
import org.chromium.sdk.JsScope.Type;
import org.chromium.sdk.JsVariable;

/**
 * @author Alexander Eliseyev
 */
public class JSLocalVariable extends JSVariable {

  public JSLocalVariable(ChromeEventsProcessor eventsProcessor, JsVariable variable, JSStackFrame stackFrame, Type scopeType) {
    super(eventsProcessor, variable, stackFrame, scopeType);
  }

  @Override
  public SNode getNode() {
    SNode stackFrameNode = getStackFrameNode();
    if (stackFrameNode == null) {
      return null;
    }

    SNode function = SNodeOperations.getAncestor(stackFrameNode, "codeOrchestra.actionScript.structure.IFunctionConcept", false, false);
    if (function != null) {
      return ListSequence.fromList(SNodeOperations.getDescendants(function, "codeOrchestra.actionScript.structure.LocalVariableDeclaration", false, new String[]{})).findFirst(new IWhereFilter<SNode>() {
        public boolean accept(SNode it) {
          return getName().equals(SPropertyOperations.getString(it, "name"));
        }
      });
    }

    return null;
  }

}
