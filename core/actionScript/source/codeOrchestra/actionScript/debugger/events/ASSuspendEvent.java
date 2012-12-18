package codeOrchestra.actionScript.debugger.events;

import codeOrchestra.debugger.step.StepType;
import flash.tools.debugger.events.BreakEvent;

/**
 * @author Alexander Eliseyev
 */
public class ASSuspendEvent {

  private BreakEvent breakEvent;
  private int suspendReason;
  private boolean stepping;
  private StepType steppingType;

  public ASSuspendEvent(BreakEvent breakEvent, int suspendReason) {
    this.breakEvent = breakEvent;
    this.suspendReason = suspendReason;
  }

  public boolean isStepping() {
    return stepping;
  }

  public void setStepping(boolean stepping) {
    this.stepping = stepping;
  }

  public BreakEvent getBreakEvent() {
    return breakEvent;
  }

  public int getSuspendReason() {
    return suspendReason;
  }

  public void setSteppingType(StepType steppingType) {
    this.steppingType = steppingType;
  }

  public StepType getSteppingType() {
    return steppingType;
  }
}
