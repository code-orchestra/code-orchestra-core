package codeOrchestra.javaScript.debugger.suspending;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.events.JSSuspendEvent;
import codeOrchestra.javaScript.debugger.listener.JSDebugProcessAdapter;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JFrame;
import java.util.LinkedList;

/**
 * @author Alexander Eliseyev
 *
 */
public class JSSuspendManager {

  private static final Logger LOG = Logger.getLogger(JSSuspendManager.class);

  private ChromeEventsProcessor eventsProcessor;

  private final LinkedList<JSSuspendContext> myEventContexts = new LinkedList<JSSuspendContext>();

  @Nullable
  private JSSuspendContext pausedContext;

  public JSSuspendManager(ChromeEventsProcessor eventsProcessor) {
    this.eventsProcessor = eventsProcessor;
    this.eventsProcessor.addDebugProcessListener(new JSDebugProcessAdapter() {
      public void processDetached(@NotNull ChromeEventsProcessor process, boolean closedByUser) {
        myEventContexts.clear();
        pausedContext = null;
      }
    });
  }

  public void voteResume(JSSuspendContext suspendContext) {
    processVote(suspendContext);
  }

  public void voteSuspend(JSSuspendContext suspendContext) {
    suspendContext.myIsVotedForResume = false;
    processVote(suspendContext);
  }

  private void processVote(JSSuspendContext suspendContext) {
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
  public JSSuspendContext getPausedContext() {
    return pausedContext;
  }

  private void notifyPaused(JSSuspendContext suspendContext) {
    pushPausedContext(suspendContext);
    eventsProcessor.getMulticaster().paused(suspendContext);
  }

  private void pushPausedContext(JSSuspendContext suspendContext) {
    LOG.assertLog(myEventContexts.contains(suspendContext));
    pausedContext = suspendContext;
  }

  public void resume(JSSuspendContext context) {
    context.resume();
    popContext(context);
  }

  public void popContext(JSSuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.remove(suspendContext);
    if (pausedContext == suspendContext) {
      pausedContext = null;
    }
  }

  public JSSuspendContext pushSuspendContextFromEvent(JSSuspendEvent debugEvent) {
    JSSuspendContext suspendContext = new JSSuspendContextByEvent(eventsProcessor, debugEvent);
    pushContext(suspendContext);
    return suspendContext;
  }

  private void pushContext(JSSuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.addFirst(suspendContext);
  }

}
