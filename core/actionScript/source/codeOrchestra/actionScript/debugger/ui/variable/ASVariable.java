package codeOrchestra.actionScript.debugger.ui.variable;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.ui.ASLocation;
import codeOrchestra.actionScript.debugger.ui.ASStackFrame;
import codeOrchestra.actionScript.debugger.ui.ASValue;
import codeOrchestra.actionScript.debugger.ui.ASWatchablesCategory;
import flash.tools.debugger.Variable;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASVariable implements IWatchable {

  private Variable variable;
  private ASStackFrame stackFrame;
  private FDBEventsProcessor eventsProcessor;

  public ASVariable(FDBEventsProcessor eventsProcessor, Variable variable, ASStackFrame stackFrame) {
    this.variable = variable;
    this.stackFrame = stackFrame;
    this.eventsProcessor = eventsProcessor;
  }

  @Override
  public String getName() {
    return new StringBuilder().append(variable.getName()).toString();
  }

  @Override
  public IValue getValue() {
    return new ASValue(this, variable.getValue(), stackFrame, eventsProcessor);
  }

  @Override
  public Icon getPresentationIcon() {
    return getValue().getPresentationIcon();
  }

  protected SNode getStackFrameNode() {
    ASLocation location = stackFrame.getLocation();
    return TraceInfoUtil.getNode(location.getUnitName(), location.getFileName(), location.getLineNumber());
  }

}
