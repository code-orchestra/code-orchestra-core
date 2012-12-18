package codeOrchestra.actionScript.debugger.suspending;

import codeOrchestra.actionScript.debugger.events.ASSuspendEvent;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessAdapter;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.LinkedList;

/**
 * @author Alexander Eliseyev
 *
 */
public class ASSuspendManager {

  private static final Logger LOG = Logger.getLogger(ASSuspendManager.class);

  private FDBEventsProcessor eventsProcessor;

  private final LinkedList<ASSuspendContext> myEventContexts = new LinkedList<ASSuspendContext>();

  boolean myIsVotedForResume = true;

  @Nullable
  private ASSuspendContext pausedContext;

  public ASSuspendManager(FDBEventsProcessor eventsProcessor) {
    this.eventsProcessor = eventsProcessor;
    this.eventsProcessor.addDebugProcessListener(new ASDebugProcessAdapter() {
      public void processDetached(@NotNull FDBEventsProcessor process, boolean closedByUser) {
        myEventContexts.clear();
        pausedContext = null;
      }
    });
  }

  public void voteResume(ASSuspendContext suspendContext) {
    processVote(suspendContext);
  }

  public void voteSuspend(ASSuspendContext suspendContext) {
    suspendContext.myIsVotedForResume = false;
    processVote(suspendContext);
  }

  private void processVote(ASSuspendContext suspendContext) {
    LOG.assertLog(suspendContext.getVotesToVote() > 0);
    suspendContext.decrementVotes();

    if (suspendContext.getVotesToVote() == 0) {
      if (suspendContext.myIsVotedForResume) {
        resume(suspendContext);
      } else {
        notifyPaused(suspendContext);
      }
    }
  }

  @Nullable
  public ASSuspendContext getPausedContext() {
    return pausedContext;
  }

  private void notifyPaused(ASSuspendContext suspendContext) {
    pushPausedContext(suspendContext);
    eventsProcessor.getMulticaster().paused(suspendContext);
  }

  private void pushPausedContext(ASSuspendContext suspendContext) {
    LOG.assertLog(myEventContexts.contains(suspendContext));
    //pausedContext.addFirst(suspendContext);
    pausedContext = suspendContext;
  }

  public void resume(ASSuspendContext context) {
    context.resume();
    popContext(context);
  }

  public void popContext(ASSuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.remove(suspendContext);
    if (pausedContext == suspendContext) {
      pausedContext = null;
    }
  }

  public ASSuspendContext pushSuspendContextFromEvent(ASSuspendEvent debugEvent) {
    ASSuspendContext suspendContext = new ASSuspendContextByEvent(eventsProcessor, debugEvent);
    pushContext(suspendContext);
    return suspendContext;
  }

  public ASSuspendContext pushSuspendContextWithVotesNumber(int nVotes) {
    ASSuspendContext suspendContext = new ASSuspendContextByUser(eventsProcessor, nVotes);
    pushContext(suspendContext);
    return suspendContext;
  }

  private void pushContext(ASSuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.addFirst(suspendContext);
  }

}
