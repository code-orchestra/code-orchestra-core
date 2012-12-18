package codeOrchestra.actionScript.debugger.events;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointsProvider;
import codeOrchestra.actionScript.debugger.command.ASSuspendContextCommand;
import codeOrchestra.actionScript.debugger.fdbex.FileInfoCacheEx;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessListener;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessMulticaster;
import codeOrchestra.actionScript.debugger.reporting.SystemMessagesReporter;
import codeOrchestra.actionScript.debugger.request.ASRequestManager;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendManager;
import codeOrchestra.actionScript.debugger.ui.ASLocation;
import codeOrchestra.actionScript.debugger.ui.ASStackFrame;
import codeOrchestra.debugger.DebuggerEventProcessor;
import codeOrchestra.debugger.breakpoint.BreakpointSessionCache;
import codeOrchestra.debugger.breakpoint.BreakpointSessionCacheImpl;
import codeOrchestra.debugger.step.StepType;
import flash.tools.debugger.*;
import flash.tools.debugger.events.*;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.IDebuggableFramesSelector;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.debug.runtime.execution.IDebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author Alexander Eliseyev
 */
public class FDBEventsProcessor implements DebuggerEventProcessor {

  private static final Logger LOG = Logger.getLogger(FDBEventsProcessor.class);

  public static final String ID = "FDB";

  private final BreakpointManagerComponent breakpointManager;
  private BreakpointSessionCache<Location> breakpointCache;
  private IDebuggableFramesSelector myFramesSelector;
  private FDBEventThread eventThread;

  // FDB stuff
  private FileInfoCacheEx fileInfoCache;
  private Session fdbSession;

  private ASSuspendManager suspendManager;
  private ASRequestManager requestManager;

  private SystemMessagesReporter systemMessagesReporter = new SystemMessagesReporter();

  private final IDebuggerManagerThread myManagerThread;

  protected static final int STATE_INITIAL = 0;
  protected static final int STATE_ATTACHED = 1;
  protected static final int STATE_DETACHING = 2;
  protected static final int STATE_DETACHED = 3;
  protected final AtomicInteger myState = new AtomicInteger(STATE_INITIAL);

  private ASDebugProcessMulticaster multicaster = new ASDebugProcessMulticaster();

  public FDBEventsProcessor(BreakpointManagerComponent breakpointManager, DebuggerManagerThread debuggerManagerThread) {
    this.myManagerThread = debuggerManagerThread;
    this.breakpointManager = breakpointManager;
    this.suspendManager = new ASSuspendManager(this);
    this.requestManager = new ASRequestManager(this);
    this.breakpointCache = new BreakpointSessionCacheImpl<Location>();
  }

  public void addDebugProcessListener(ASDebugProcessListener listener) {
    multicaster.addListener(listener);
  }

  public void removeDebugProcessListener(ASDebugProcessListener listener) {
    multicaster.removeListener(listener);
  }

  public void commitFDBSession(Session fdbSession) {
    this.fdbSession = fdbSession;

    onAttach();

    this.eventThread = new FDBEventThread();
    this.eventThread.start();
  }

  public void processSessionDeathEvent() {
    if (eventThread != null) {
      eventThread.stopListening();
      eventThread = null;
    }
    closeProcess(false);
  }

  private void closeProcess(boolean closedByUser) {
    DebuggerManagerThread.assertIsManagerThread();
    if (myState.compareAndSet(STATE_INITIAL, STATE_DETACHING) || myState.compareAndSet(STATE_ATTACHED, STATE_DETACHING)) {
      breakpointCache.dispose();
      fdbSession = null;
      try {
        getManagerThread().close();
      } finally {
        myState.set(STATE_DETACHED);
        getMulticaster().processDetached(this, closedByUser);
      }
    }
  }

  private void stopConnecting() {
    closeProcess(true);
  }

  public boolean isAttached() {
    return myState.get() == STATE_ATTACHED;
  }

  private void onAttach() {
    LOG.assertLog(!isAttached());

    // Create file cache
    fileInfoCache = new FileInfoCacheEx();
    fileInfoCache.bind(fdbSession);

    // Here we change an atomic state from initial to attached
    if (myState.compareAndSet(STATE_INITIAL, STATE_ATTACHED)) {
      multicaster.processAttached(this);
    }
  }

  @Override
  public String getId() {
    return ID;
  }

  @SuppressWarnings("deprecation")
  private class FDBEventThread extends Thread {

    private boolean myIsStopped = false;

    public FDBEventThread() {
      super("FDB Event Dispatch Thread");
    }

    public synchronized void stopListening() {
      myIsStopped = true;
    }

    private synchronized boolean isStopped() {
      return myIsStopped;
    }

    public void run() {
      while (!isStopped()) {
        try {
          fdbSession.waitForEvent();
        } catch (NotConnectedException e) {
          getManagerThread().invokeAndWait(new DebuggerCommand() {
            @Override
            protected void action() throws Exception {
              processSessionDeathEvent();
            }
          });
          return;
        } catch (InterruptedException e) {
          continue;
        }

        final DebugEvent debugEvent = fdbSession.nextEvent();
        if (debugEvent == null) {
          throw new IllegalStateException("NULL debug event");
        }

        getManagerThread().invokeAndWait(new DebuggerCommand() {
          protected void action() throws Exception {
            if (debugEvent instanceof TraceEvent) {
              systemMessagesReporter.reportInformation("[trace] " + ((TraceEvent) debugEvent).information);
            } else if (debugEvent instanceof SwfLoadedEvent) {
              systemMessagesReporter.reportInformation("SWF loaded: " + ((SwfLoadedEvent) debugEvent).url);
            } else if (debugEvent instanceof SwfUnloadedEvent) {
              systemMessagesReporter.reportInformation("SWF unloaded: " + ((SwfUnloadedEvent) debugEvent).path);
            } else if (debugEvent instanceof BreakEvent) {
              ASSuspendEvent suspendEvent = new ASSuspendEvent((BreakEvent) debugEvent, fdbSession.suspendReason());

              ASSuspendContext pausedContext = getSuspendManager().getPausedContext();
              if (pausedContext != null) {
                suspendEvent.setStepping(pausedContext.isStepping());
                suspendEvent.setSteppingType(pausedContext.getStepType());
              }

              ASSuspendContext suspendContext = getSuspendManager().pushSuspendContextFromEvent(suspendEvent);
              processBreakEvent(suspendContext, suspendEvent);
            } else if (debugEvent instanceof FileListModifiedEvent) {
              // we ignore this
            } else if (debugEvent instanceof FunctionMetaDataAvailableEvent) {
              // we ignore this
            } else if (debugEvent instanceof FaultEvent) {
              //TODO: implement
              /*
            if ( handleFault((FaultEvent)e) )
              requestResume = true;
            else
              requestHalt = true;
              */
              systemMessagesReporter.reportInformation("Fault: " + ((FaultEvent) debugEvent).stackTrace());
            } else {
              LOG.warning("Unknown debug event: " + debugEvent.getClass().getSimpleName());
            }
          }
        });
      }
    }
  }

  private void processBreakEvent(final ASSuspendContext context, final ASSuspendEvent suspendEvent) {
    ASSuspendContextCommand suspendCommand = new ASSuspendContextCommand(context) {
      protected void action() throws Exception {
        final ASSuspendManager suspendManager = getSuspendManager();

        if (suspendEvent.getSuspendReason() == SuspendReason.ScriptLoaded) {
          suspendManager.voteResume(getSuspendContext());
        } else {
          // Check if we really can stop here
          boolean voteSuspend = true;
          Frame[] frames = fdbSession.getFrames();
          if (frames.length > 0) {
            ASLocation locationFromFrame = ASStackFrame.getLocationFromFrame(frames[0]);
            if (suspendEvent.isStepping()) {
              if (ASBreakpointsProvider.isOnFunctionDeclaration(locationFromFrame) || ASBreakpointsProvider.isOnClassDeclaration(locationFromFrame)) {
                // RE-3233 — We can get stopped at method declaration node while stepping in
                // Anyway, we should try to step next while on the function location

                step(suspendEvent.getSteppingType(), context);
                return;
              }
            }
            if (!ASBreakpointsProvider.isDebuggableFromStep(locationFromFrame)) {
              voteSuspend = false;
            }
          } else {
            voteSuspend = false;
          }

          if (voteSuspend) {
            suspendManager.voteSuspend(getSuspendContext());
          } else {
            suspendManager.voteResume(getSuspendContext());
          }
        }
      }
    };
    getManagerThread().schedule(suspendCommand);
  }

  public void resume(@NotNull ASSuspendContext suspendContext) {
    getManagerThread().schedule(new ResumeCommand(suspendContext));
  }

  public void pause() {
    getManagerThread().schedule(new PauseCommand());
  }

  public void stop(boolean terminate) {
    getManagerThread().invokeTerminalCommand(new StopCommand(terminate));
  }

  public void step(StepType type, @NotNull ASSuspendContext suspendContext) {
    if (type == null) {
      LOG.warning("Null step type");
      type = StepType.OVER;
    }
    getManagerThread().schedule(new StepCommand(suspendContext, type));
  }

  // --- Debugger commands ---

  private class StopCommand extends DebuggerCommand {
    private final boolean terminate;

    public StopCommand(boolean terminate) {
      this.terminate = terminate;
    }

    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    protected void action() throws Exception {
      if (isAttached()) {
        if (terminate) {
          fdbSession.terminate();
        } else {
          try {
            fdbSession.resume();
          } catch (Throwable t) {
            // ignore
          } finally {
            fdbSession.unbind();
          }
        }
      } else {
        stopConnecting();
      }
    }
  }

  private class PauseCommand extends DebuggerCommand {
    @Override
    protected void action() throws Exception {
      try {
        getFdbSession().suspend();
      } catch (NoResponseException nre) {
        // there's no way to suspend in the current state
      }

      ASSuspendManager suspendManager = getSuspendManager();
      ASSuspendContext suspendContext = suspendManager.pushSuspendContextWithVotesNumber(0);
      getMulticaster().paused(suspendContext);
    }
  }

  private class ResumeCommand extends ASSuspendContextCommand {
    public ResumeCommand(@NotNull ASSuspendContext suspendContext) {
      super(suspendContext);
    }

    @Override
    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    @Override
    protected void action() throws Exception {
      ASSuspendManager suspendManager = getSuspendManager();
      suspendManager.resume(getSuspendContext());
      getMulticaster().resumed(getSuspendContext());
    }
  }

  private class StepCommand  extends /* ResumeCommand */ ASSuspendContextCommand {

    private final StepType myStepType;

    public StepCommand(@NotNull ASSuspendContext suspendContext, @NotNull StepType type) {
      super(suspendContext);
      myStepType = type;
    }

    @Override
    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    @Override
    protected void action() throws Exception {
      switch (myStepType) {
        case INTO:
          fdbSession.stepInto();
          break;
        case OUT:
          fdbSession.stepOut();
          break;
        case OVER:
          fdbSession.stepOver();
          break;
        default:
          throw new IllegalStateException("Unknown step type: " + myStepType);
      }

      getMulticaster().resumed(getSuspendContext());
    }

  }

  // --- Getters & Setters ---

  public IDebuggerManagerThread getManagerThread() {
    return myManagerThread;
  }

  public void setDebuggableFramesSelector(IDebuggableFramesSelector framesSelector) {
    myFramesSelector = framesSelector;
  }

  public IDebuggableFramesSelector getDebuggableFramesSelector() {
    return myFramesSelector;
  }

  public ASRequestManager getRequestManager() {
    return requestManager;
  }

  public BreakpointManagerComponent getBreakpointManager() {
    return breakpointManager;
  }

  public ASSuspendManager getSuspendManager() {
    return suspendManager;
  }

  public ASDebugProcessMulticaster getMulticaster() {
    return multicaster;
  }

  public Session getFdbSession() {
    return fdbSession;
  }

  public FileInfoCacheEx getFileInfoCache() {
    return fileInfoCache;
  }

  public SystemMessagesReporter getReporter() {
    return systemMessagesReporter;
  }

  public BreakpointSessionCache<Location> getBreakpointCache() {
    return breakpointCache;
  }
}