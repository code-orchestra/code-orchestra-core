package codeOrchestra.javaScript.debugger.events;

import codeOrchestra.debugger.step.StepType;
import org.chromium.sdk.CallFrame;
import org.chromium.sdk.DebugContext;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSSuspendEvent {

  private DebugContext debugContext;
  private StepType stepType;

  public JSSuspendEvent(DebugContext debugContext) {
    this.debugContext = debugContext;
  }

  public DebugContext getDebugContext() {
    return debugContext;
  }

  public boolean isOnBreakpoint() {
    return !debugContext.getBreakpointsHit().isEmpty();
  }

  public CallFrame getFirstFrame() {
    List<? extends CallFrame> callFrames = debugContext.getCallFrames();
    if (callFrames.isEmpty()) {
      return null;
    }
    return callFrames.get(0);
  }

  public StepType getStepTypeRequested() {
    return stepType;
  }

  public void setStepTypeRequested(StepType stepType) {
    this.stepType = stepType;
  }
}
