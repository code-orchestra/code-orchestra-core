package codeOrchestra.actionScript.debugger.request;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import codeOrchestra.actionScript.debugger.breakpoint.InvalidBreakpointException;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessorManager;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessorManager.AllDebugProcessesAction;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessListener;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.debug.runtime.requests.Requestor;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ASRequestManager implements ASDebugProcessListener {

  private static final Logger LOG = Logger.getLogger(ASRequestManager.class);

  private FDBEventsProcessor eventsProcessor;

  private final Map<Requestor, String> myInvalidRequestsAndWarnings = new HashMap<Requestor, String>();

  public ASRequestManager(FDBEventsProcessor eventsProcessor) {
    this.eventsProcessor = eventsProcessor;
    this.eventsProcessor.addDebugProcessListener(this);
  }

  @Override
  public void processAttached(final @NotNull FDBEventsProcessor eventsProcessor) {
    // Set the stored breakpoints
    eventsProcessor.getManagerThread().schedule(new DebuggerCommand() {
      @Override
      protected void action() throws Exception {
        BreakpointManagerComponent breakpointManager = eventsProcessor.getBreakpointManager();
        for (IBreakpoint breakpoint : breakpointManager.getValidIBreakpoints()) {
          if (breakpoint instanceof ASBreakpoint) {
            try {
              ((ASBreakpoint) breakpoint).createRequest(eventsProcessor);
            } catch (InvalidBreakpointException ibe) {
              throw new IllegalStateException("Invalid breakpoint came through getValidIBreakpoints()");
            }
          }
        }
      }
    });
  }

  @Override
  public void paused(@NotNull ASSuspendContext suspendContext) {
    // do nothing
  }

  @Override
  public void resumed(@NotNull ASSuspendContext suspendContext) {
    // do nothing
  }

  @Override
  public void processDetached(@NotNull FDBEventsProcessor eventsProcessor, boolean closedByUser) {
    myInvalidRequestsAndWarnings.clear();
  }

  public void setInvalid(Requestor requestor, String message) {
    DebuggerManagerThread.assertIsManagerThread();
    myInvalidRequestsAndWarnings.put(requestor, message);
  }

  @Nullable
  public String getWarning(Requestor requestor) {
    DebuggerManagerThread.assertIsManagerThread();
    return myInvalidRequestsAndWarnings.get(requestor);
  }

  public static void requestBreakPointAdd(final ASBreakpoint breakpoint) {
    FDBEventsProcessorManager.getInstance(breakpoint.getProject()).performAllDebugProcessesAction(new AllDebugProcessesAction() {
      @Override
      public void run(FDBEventsProcessor processor) {
        if (processor.isAttached()) {
          try {
            breakpoint.createRequest(processor);
          } catch (InvalidBreakpointException e) {
            // That's fine, do nothing
          }
        }
      }
    });
  }

  public static void requestBreakPointRemove(final ASBreakpoint breakpoint) {
    FDBEventsProcessorManager.getInstance(breakpoint.getProject()).performAllDebugProcessesAction(new AllDebugProcessesAction() {
      @Override
      public void run(FDBEventsProcessor processor) {
        if (processor.isAttached()) {
          breakpoint.removeRequest(processor);
        }
      }
    });
  }

}
