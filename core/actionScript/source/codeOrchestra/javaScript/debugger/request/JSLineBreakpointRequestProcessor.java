package codeOrchestra.javaScript.debugger.request;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointKind;
import codeOrchestra.actionScript.debugger.breakpoint.ASLineBreakpoint;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessor;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.Breakpoint;
import org.chromium.sdk.JavascriptVm.BreakpointCallback;
import org.chromium.sdk.Script;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class JSLineBreakpointRequestProcessor implements BreakpointRequestProcessor<ChromeEventsProcessor, ASLineBreakpoint> {

  private static final Logger LOG = Logger.getLogger(JSLineBreakpointRequestProcessor.class);

  @Override
  public boolean create(ChromeEventsProcessor eventProcessor, ASLineBreakpoint breakpoint) {
    BreakpointLocation location = breakpoint.getLocation();
    String fileName = location.getFileName();

    Script script = eventProcessor.getScriptsCache().getScriptByFileName(fileName);
    if (script == null) {
      // Put into the postponed breakpoints of the events processor
      eventProcessor.getPostponedBreakpointsManager().add(breakpoint);
      return false;
    }

    Breakpoint.Target breakpointTarget = eventProcessor.getBackendBehavior().getBreakpointTarget(script);

    int lineNumberFixed = location.getLineIndexInFile() - 1;
    eventProcessor.getJavascriptVM().setBreakpoint(
      breakpointTarget,
      lineNumberFixed,
      eventProcessor.getBackendBehavior().getDefaultBreakpointColumn(),
      breakpoint.isEnabled(),
      null, // Condition
      new AddBreakpointCallback(breakpoint, eventProcessor),
      null);

    eventProcessor.getReporter().reportInformation("Requested a breakpoint: " + script.getName() + ", line: " +  location.getLineIndexInFile());
    
    return true;
  }

  @Override
  public void remove(ChromeEventsProcessor eventProcessor, ASLineBreakpoint breakpoint) {
    Breakpoint chromeBreakpoint = eventProcessor.getBreakpointCache().getBackendBreakpointObject(breakpoint);
    if (chromeBreakpoint == null) {
      LOG.warning("Trying to remove a breakpoint not attached to the session");
      return;
    }

    chromeBreakpoint.clear(new RemoveBreakpointCallback(), null);
  }

  @NotNull
  @Override
  public ASBreakpointKind getBreakpointKind() {
    return ASBreakpointKind.LINE_BREAKPOINT;
  }

  @NotNull
  @Override
  public String getEventProcessorId() {
    return ChromeEventsProcessor.ID;
  }

  private static class RemoveBreakpointCallback implements BreakpointCallback {
    @Override
    public void success(Breakpoint breakpoint) {
    }

    @Override
    public void failure(String errorMessage) {
      LOG.warning("Can't remove a breakpoint from session: " + errorMessage);
    }
  }
  
  private static class AddBreakpointCallback implements BreakpointCallback {
    private ASLineBreakpoint asBreakpoint;
    private ChromeEventsProcessor eventsProcessor;

    private AddBreakpointCallback(ASLineBreakpoint asBreakpoint, ChromeEventsProcessor eventsProcessor) {
      this.asBreakpoint = asBreakpoint;
      this.eventsProcessor = eventsProcessor;
    }

    @Override
    public void success(Breakpoint chromeBreakpoint) {
      eventsProcessor.getBreakpointCache().putBackendBreakpointObject(asBreakpoint, chromeBreakpoint);
    }

    @Override
    public void failure(final String errorMessage) {
      eventsProcessor.getManagerThread().invoke(new DebuggerCommand() {
        @Override
        protected void action() throws Exception {
          eventsProcessor.getReporter().reportError("Can't add a breakpoint: " + errorMessage);
          eventsProcessor.getRequestManager().setInvalid(asBreakpoint, "Can't add a breakpoint: " + errorMessage);
        }
      });
    }
  }

}
