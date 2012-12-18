package codeOrchestra.javaScript.debugger.ui.variable;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.ui.JSLocation;
import codeOrchestra.javaScript.debugger.ui.JSStackFrame;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.smodel.SNode;
import org.chromium.sdk.JsScope;
import org.chromium.sdk.JsScope.Type;
import org.chromium.sdk.JsVariable;

import javax.swing.Icon;

/**
 * @author Alexander Eliseyev
 */
public class JSVariable implements IWatchable {

  private JsVariable variable;
  private JSStackFrame stackFrame;
  private ChromeEventsProcessor eventsProcessor;
  private JsScope.Type scopeType;

  public JSVariable(ChromeEventsProcessor eventsProcessor, JsVariable variable, JSStackFrame stackFrame, Type scopeType) {
    this.variable = variable;
    this.stackFrame = stackFrame;
    this.eventsProcessor = eventsProcessor;
    this.scopeType = scopeType;
  }

  public Type getScopeType() {
    return scopeType;
  }

  @Override
  public WatchablesCategory getCategory() {
    return JSWatchablesCategory.LOCAL_VARIABLE; // ???
  }

  @Override
  public SNode getNode() {
    return null; // TODO: do we need this?
  }

  @Override
  public String getName() {
    return new StringBuilder().append(variable.getName()).toString();
  }

  @Override
  public IValue getValue() {
    return new JSValue(eventsProcessor, stackFrame, variable.getValue(), this);
  }

  @Override
  public Icon getPresentationIcon() {
    return getValue().getPresentationIcon();
  }

  protected SNode getStackFrameNode() {
    JSLocation location = stackFrame.getLocation();
    return TraceInfoUtil.getNode(location.getUnitName(), location.getFileName(), location.getLineNumber());
  }

}
