package codeOrchestra.javaScript.debugger.events;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointsProvider;
import codeOrchestra.actionScript.debugger.reporting.SystemMessagesReporter;
import codeOrchestra.debugger.DebuggerEventProcessor;
import codeOrchestra.debugger.breakpoint.BreakpointSessionCache;
import codeOrchestra.debugger.breakpoint.BreakpointSessionCacheImpl;
import codeOrchestra.debugger.step.StepType;
import codeOrchestra.javaScript.debugger.command.JSSuspendContextCommand;
import codeOrchestra.javaScript.debugger.listener.JSDebugProcessListener;
import codeOrchestra.javaScript.debugger.listener.JSDebugProcessMulticaster;
import codeOrchestra.javaScript.debugger.request.JSPostponedBreakpointsManager;
import codeOrchestra.javaScript.debugger.request.JSRequestManager;
import codeOrchestra.javaScript.debugger.scripts.JSScriptsCache;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendManager;
import codeOrchestra.javaScript.debugger.ui.JSLocation;
import codeOrchestra.javaScript.debugger.ui.JSStackFrame;
import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.VmAttachException;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.IDebuggableFramesSelector;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.debug.runtime.execution.IDebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.*;
import org.chromium.sdk.DebugContext.StepAction;
import org.chromium.sdk.JavascriptVm.ScriptsCallback;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author Alexander Eliseyev
 */
public class ChromeEventsProcessor implements DebuggerEventProcessor, TabDebugEventListener {

  private static final Logger LOG = Logger.getLogger(ChromeEventsProcessor.class);

  private static final int ATTACH_DELAY_MILLIS = 1000;

  public static final String ID = "Chrome";

  private IDebuggableFramesSelector myFramesSelector;
  private DebuggerManagerThread myManagerThread;
  private BreakpointManagerComponent breakpointManager;
  private BreakpointSessionCache<Breakpoint> breakpointCache;

  private JSSuspendManager suspendManager;
  private JSRequestManager requestManager;
  private JSPostponedBreakpointsManager postponedBreakpointsManager;
  private JSScriptsCache scriptsCache;

  private BackendBehavior backendBehavior;

  private SystemMessagesReporter systemMessagesReporter = new SystemMessagesReporter();

  protected static final int STATE_INITIAL = 0;
  protected static final int STATE_ATTACHED = 1;
  protected static final int STATE_DETACHING = 2;
  protected static final int STATE_DETACHED = 3;

  protected final AtomicInteger myState = new AtomicInteger(STATE_INITIAL);

  private JavascriptVm javascriptVM;

  private JSDebugProcessMulticaster multicaster = new JSDebugProcessMulticaster();
  private DebugEventListener debugEventListener = new MyDebugEventListener();

  private RetryBreakpointRequestsThread retryBreakpointRequestsThread;

  private String debugURL;
  private boolean hasReceivedNavigatedEvent;

  public ChromeEventsProcessor(BreakpointManagerComponent breakpointManager, DebuggerManagerThread debuggerManagerThread) {
    this.myManagerThread = debuggerManagerThread;
    this.breakpointManager = breakpointManager;
    this.scriptsCache = new JSScriptsCache();
    this.suspendManager = new JSSuspendManager(this);
    this.requestManager = new JSRequestManager(this);
    this.postponedBreakpointsManager = new JSPostponedBreakpointsManager(this);
    this.retryBreakpointRequestsThread = new RetryBreakpointRequestsThread();
    this.breakpointCache = new BreakpointSessionCacheImpl<Breakpoint>();
  }

  public void commitTabConnector(TabConnector tabConnector) {
    try {
      this.backendBehavior = tabConnector.getBackendBehavior();

      if (this.backendBehavior.isAttachDelayRequired()) {
        try {
          Thread.sleep(ATTACH_DELAY_MILLIS);
        } catch (InterruptedException e) {
          // ignore
        }
      }

      this.javascriptVM = tabConnector.attach(this);
      this.debugURL = tabConnector.getUrl();
      this.systemMessagesReporter.reportInformation("Attached to Chrome tab with URL " + debugURL);
    } catch (VmAttachException e) {
      LOG.warning("Can't attach to browser tab", e);
      systemMessagesReporter.reportError("Can't attach to browser tab");
      return;
    }

    onAttach();
  }

  private void onAttach() {
    LOG.assertLog(!isAttached());

    // Load the scripts cache
    javascriptVM.getScripts(new ScriptsCallback() {
      @Override
      public void success(Collection<Script> scripts) {
        for (Script script : scripts) {
          scriptsCache.putScript(script);
        }
      }

      @Override
      public void failure(String errorMessage) {
        LOG.warning("Can't retrieve scripts from JS VM: " + errorMessage);
      }
    });

    retryBreakpointRequestsThread.start();

    // Here we change an atomic state from initial to attached
    if (myState.compareAndSet(STATE_INITIAL, STATE_ATTACHED)) {
      multicaster.processAttached(this);
    }
  }

  private void closeProcess(boolean closedByUser) {
    DebuggerManagerThread.assertIsManagerThread();
    if (myState.compareAndSet(STATE_INITIAL, STATE_DETACHING) || myState.compareAndSet(STATE_ATTACHED, STATE_DETACHING)) {
      retryBreakpointRequestsThread.stopTrying();
      breakpointCache.dispose();
      javascriptVM = null;
      try {
        getManagerThread().close();
      } finally {
        myState.set(STATE_DETACHED);
        getMulticaster().processDetached(this, closedByUser);
      }
    }
  }

  public boolean isAttached() {
    return myState.get() == STATE_ATTACHED;
  }

  private void stopConnecting() {
    closeProcess(true);
  }

  public void addDebugProcessListener(JSDebugProcessListener listener) {
    multicaster.addListener(listener);
  }

  public void removeDebugProcessListener(JSDebugProcessListener listener) {
    multicaster.removeListener(listener);
  }

  @Override
  public String getId() {
    return ID;
  }

  @Nullable
  public DebugContext getDebugContext() {
    JSSuspendContext pausedContext = suspendManager.getPausedContext();
    if (pausedContext == null) {
      return null;
    }

    return pausedContext.getDebugEvent().getDebugContext();
  }

  // --- Events sent to TabDebugEventListener

  @Override
  public void navigated(String newUrl) {
    // RE-3083
    if (!backendBehavior.handleFirstNavigationEvent() && !hasReceivedNavigatedEvent) {
      hasReceivedNavigatedEvent = true;
      return;
    }

    if (debugURL.equals(newUrl)) {
      this.systemMessagesReporter.reportInformation("Disconnecting from tab, page was reloaded");
    } else {
      this.systemMessagesReporter.reportInformation("Disconnecting from tab, navigated to: " + newUrl);
    }
    stop();
  }

  @Override
  public void closed() {
    getManagerThread().invoke(new DebuggerCommand() {
      @Override
      protected void action() throws Exception {
        closeProcess(false);
      }
    });
  }

  // ---

  private class MyDebugEventListener implements DebugEventListener {

    @Override
    public void suspended(final DebugContext context) {
      getManagerThread().invokeAndWait(new DebuggerCommand() {
        protected void action() throws Exception {
          JSSuspendEvent suspendEvent = new JSSuspendEvent(context);

          // Check is last suspend context was created by stepping
          JSSuspendContext previousPausedContext = getSuspendManager().getPausedContext();
          if (previousPausedContext != null && previousPausedContext.isSteppingRequested() && !suspendEvent.isOnBreakpoint()) {
            suspendEvent.setStepTypeRequested(previousPausedContext.getStepType());
          }

          JSSuspendContext newSuspendContext = getSuspendManager().pushSuspendContextFromEvent(suspendEvent);
          processSuspendEvent(newSuspendContext, suspendEvent);
        }
      });
    }

    @Override
    public void resumed() {
      getManagerThread().invokeAndWait(new DebuggerCommand() {
        @Override
        protected void action() throws Exception {
          // Here we handle only the special case of stepping out of "steppable" scope and receiving a resume
          // instead of the next suspend event.
          JSSuspendContext pausedContext = suspendManager.getPausedContext();
          if (pausedContext != null && pausedContext.isSteppingRequested()) {
            suspendManager.popContext(pausedContext);
            getMulticaster().resumed(pausedContext);
          }
        }
      });
    }

    @Override
    public void disconnected() {
      getManagerThread().invokeAndWait(new DebuggerCommand() {
        @Override
        protected void action() throws Exception {
          closeProcess(false);
        }
      });
    }

    @Override
    public void scriptLoaded(Script newScript) {
      scriptsCache.putScript(newScript);
    }

    @Override
    public void scriptCollected(Script script) {
      scriptsCache.removeScript(script);
    }

    @Override
    public VmStatusListener getVmStatusListener() {
      return new VmStatusListener() {
        @Override
        public void busyStatusChanged(String currentRequest, int numberOfEnqueued) {
          // for now we ignore this stuff
        }
      };
    }

    @Override
    public void scriptContentChanged(Script newScript) {
      scriptsCache.putScript(newScript);
    }
  }

  // --- Methods called from Debug Session object

  public void pause() {
    getManagerThread().schedule(new PauseCommand());
  }

  public void resume(JSSuspendContext context) {
    getManagerThread().schedule(new ResumeCommand(context));
  }

  public void stop() {
    getManagerThread().invokeTerminalCommand(new StopCommand());
  }

  public void step(StepType type, @NotNull JSSuspendContext suspendContext) {
    getManagerThread().schedule(new StepCommand(suspendContext, type));
  }

  // ---

  private void processSuspendEvent(JSSuspendContext suspendContext, final JSSuspendEvent suspendEvent) {
    JSSuspendContextCommand suspendCommand = new JSSuspendContextCommand(suspendContext) {
      protected void action() throws Exception {
        final JSSuspendManager suspendManager = getSuspendManager();

        // Check if we really can stop here
        boolean voteSuspend = true;

        JSLocation locationFromFrame = JSStackFrame.getLocationFromFrame(suspendEvent.getFirstFrame());
        if (!ASBreakpointsProvider.isDebuggableFromStep(locationFromFrame)) {
          voteSuspend = false;
        }

        if (voteSuspend) {
          suspendManager.voteSuspend(getSuspendContext());
        } else {
          suspendManager.voteResume(getSuspendContext());
        }
      }
    };
    getManagerThread().schedule(suspendCommand);
  }

  private class RetryBreakpointRequestsThread extends Thread {
    private boolean shouldStop;

    public void stopTrying() {
      shouldStop = true;
    }

    public void run() {
      while (!shouldStop) {
        try {
          Thread.sleep(200);
        } catch (InterruptedException e) {
          // ignore
        }
        postponedBreakpointsManager.retryRequests();
      }
    }
  }

  private class StepCommand extends JSSuspendContextCommand {
    private final StepType myStepType;

    public StepCommand(@NotNull JSSuspendContext suspendContext, @NotNull StepType type) {
      super(suspendContext);
      myStepType = type;
    }

    @Override
    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    @Override
    protected void action() throws Exception {
      final StepAction stepAction;

      switch (myStepType) {
        case INTO:
          stepAction = StepAction.IN;
          break;
        case OUT:
          stepAction = StepAction.OUT;
          break;
        case OVER:
          stepAction = StepAction.OVER;
          break;
        default:
          throw new IllegalStateException("Unknown step type: " + myStepType);
      }

      DebugContext debugContext = getDebugContext();
      if (debugContext == null) {
        throw new IllegalStateException("Trying to step while having no debug context");
      }

      debugContext.continueVm(stepAction, 1, null);
    }
  }

  private class ResumeCommand extends JSSuspendContextCommand {
    public ResumeCommand(@NotNull JSSuspendContext suspendContext) {
      super(suspendContext);
    }

    @Override
    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    @Override
    protected void action() throws Exception {
      JSSuspendManager suspendManager = getSuspendManager();
      suspendManager.resume(getSuspendContext());
    }
  }

  private class StopCommand extends DebuggerCommand {
    public StopCommand() {
    }

    public CommandPriority getPriority() {
      return CommandPriority.HIGH;
    }

    protected void action() throws Exception {
      if (isAttached()) {
        // Try releasing first
        try {
          getDebugContext().continueVm(StepAction.CONTINUE, -1, null);
        } catch (Throwable t) {
          // ignore
        } finally {
          javascriptVM.detach();
        }
      } else {
        stopConnecting();
      }
    }
  }

  private class PauseCommand extends DebuggerCommand {
    @Override
    protected void action() throws Exception {
      javascriptVM.suspend(null); // Is it ok to pass no callback object?

      // (eliseyev): We don't do any UI stuff here as we don't pause synchronously, we'll get notified
      // in the event listener that execution is VM is suspended
    }
  }

  // -- Getters/setters

  @Override
  public DebugEventListener getDebugEventListener() {
    return debugEventListener;
  }
  public void setDebuggableFramesSelector(IDebuggableFramesSelector framesSelector) {
    myFramesSelector = framesSelector;
  }
  public IDebuggableFramesSelector getDebuggableFramesSelector() {
    return myFramesSelector;
  }
  public IDebuggerManagerThread getManagerThread() {
    return myManagerThread;
  }
  public BreakpointManagerComponent getBreakpointManager() {
    return breakpointManager;
  }
  public SystemMessagesReporter getReporter() {
    return systemMessagesReporter;
  }
  public JSDebugProcessMulticaster getMulticaster() {
    return multicaster;
  }
  public JSSuspendManager getSuspendManager() {
    return suspendManager;
  }
  public JSRequestManager getRequestManager() {
    return requestManager;
  }
  public JavascriptVm getJavascriptVM() {
    return javascriptVM;
  }
  public JSScriptsCache getScriptsCache() {
    return scriptsCache;
  }
  public JSPostponedBreakpointsManager getPostponedBreakpointsManager() {
    return postponedBreakpointsManager;
  }
  public BreakpointSessionCache<Breakpoint> getBreakpointCache() {
    return breakpointCache;
  }
  public BackendBehavior getBackendBehavior() {
    return backendBehavior;
  }

}
