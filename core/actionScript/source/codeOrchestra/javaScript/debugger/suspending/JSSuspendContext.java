package codeOrchestra.javaScript.debugger.suspending;

import codeOrchestra.debugger.step.StepType;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.events.JSSuspendEvent;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.CallFrame;
import org.jetbrains.annotations.Nullable;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class JSSuspendContext {

  private static final Logger LOG = Logger.getLogger(JSSuspendContext.class);

  protected ChromeEventsProcessor eventsProcessor;

  private volatile boolean isResumed;
  boolean myIsVotedForResume = true;

  private boolean stepping;
  private StepType stepType;

  protected int votesToVote;
  protected JSSuspendEvent debugEvent;

  protected JSSuspendContext(ChromeEventsProcessor eventsProcessor, int eventVotes, JSSuspendEvent debugEvent) {
    this.eventsProcessor = eventsProcessor;
    this.votesToVote = eventVotes;
    this.debugEvent = debugEvent;
  }

  public boolean isSteppingRequested() {
    return stepping;
  }

  public StepType getStepType() {
    return stepType;
  }

  public void setSteppingRequested(boolean stepping, @Nullable StepType stepType) {
    this.stepping = stepping;
    this.stepType = stepType;
  }

  public int getVotesToVote() {
    return votesToVote;
  }

  public void decrementVotes() {
    votesToVote--;
  }

  public JSSuspendEvent getDebugEvent() {
    return debugEvent;
  }

  public CallFrame getFrame() {
    assertNotResumed();
    List<? extends CallFrame> frames = getFrames();
    return !frames.isEmpty() ? frames.get(0) : null;
  }

  public List<? extends CallFrame> getFrames() {
    assertNotResumed();
    return debugEvent.getDebugContext().getCallFrames();
  }

  public void resume() {
    assertNotResumed();
    DebuggerManagerThread.assertIsManagerThread();
    try {
      doResume();
    } finally {
      isResumed = true;
    }
  }

  protected abstract void doResume();

  private void assertNotResumed() {
    if (isResumed) {
      if (getEventsProcessor().isAttached()) {
        LOG.assertLog(false, "Cannot access SuspendContext. SuspendContext is resumed.");
      }
    }
  }

  public ChromeEventsProcessor getEventsProcessor() {
    return eventsProcessor;
  }

  public boolean isResumed() {
    return isResumed;
  }

}
