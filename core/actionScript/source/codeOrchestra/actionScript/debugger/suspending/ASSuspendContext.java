package codeOrchestra.actionScript.debugger.suspending;

import codeOrchestra.actionScript.debugger.events.ASSuspendEvent;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.debugger.step.StepType;
import flash.tools.debugger.Frame;
import flash.tools.debugger.NotConnectedException;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASSuspendContext {

  private static final Logger LOG = Logger.getLogger(ASSuspendContext.class);

  protected FDBEventsProcessor eventsProcessor;

  private volatile boolean isResumed;
  boolean myIsVotedForResume = true;

  private boolean stepping;

  protected int votesToVote;
  protected ASSuspendEvent debugEvent;
  private StepType stepType;

  protected ASSuspendContext(FDBEventsProcessor eventsProcessor, int eventVotes, ASSuspendEvent debugEvent) {
    this.eventsProcessor = eventsProcessor;
    this.votesToVote = eventVotes;
    this.debugEvent = debugEvent;
  }

  public boolean isStepping() {
    return stepping;
  }

  public void setStepping(boolean stepping) {
    this.stepping = stepping;
  }

  public int getVotesToVote() {
    return votesToVote;
  }

  public void decrementVotes() {
    votesToVote--;
  }

  public ASSuspendEvent getDebugEvent() {
    return debugEvent;
  }

  @Nullable
  public Frame getFrame() {
    assertNotResumed();
    List<Frame> frames = getFrames();
    return !frames.isEmpty() ? frames.get(0) : null;
  }

  public List<Frame> getFrames() {
    assertNotResumed();
    try {
      Frame[] frames = eventsProcessor.getFdbSession().getFrames();
      return Arrays.asList(frames);
    } catch (NotConnectedException e) {
      return Collections.emptyList();
    }
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

  public FDBEventsProcessor getEventsProcessor() {
    return eventsProcessor;
  }

  public boolean isResumed() {
    return isResumed;
  }

  public void setStepType(StepType stepType) {
    this.stepType = stepType;
  }

  public StepType getStepType() {
    return stepType;
  }
}
