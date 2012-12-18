package codeOrchestra.actionScript.debugger.request;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointKind;
import codeOrchestra.actionScript.debugger.breakpoint.ASLineBreakpoint;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessor;
import flash.tools.debugger.Location;
import flash.tools.debugger.NoResponseException;
import flash.tools.debugger.NotConnectedException;
import flash.tools.debugger.SourceFile;
import jetbrains.mps.logging.Logger;

/**
 * @author Alexander Eliseyev
 */
public class ASLineBreakpointRequestProcessor implements BreakpointRequestProcessor<FDBEventsProcessor, ASLineBreakpoint> {

  private static final Logger LOG = Logger.getLogger(ASLineBreakpointRequestProcessor.class);

  @Override
  public boolean create(FDBEventsProcessor eventsProcessor, ASLineBreakpoint breakpoint) {
    ASRequestManager requestManager = eventsProcessor.getRequestManager();

    String containingRootFQName = breakpoint.getContainingRootFQName();
    if (containingRootFQName != null) {
      SourceFile sourceFile = eventsProcessor.getFileInfoCache().getSourceFileByFQName(containingRootFQName);
      if (sourceFile == null) {
        requestManager.setInvalid(breakpoint, "Can't find executable code");
        return false;
      }

      try {
        Location location = eventsProcessor.getFdbSession().setBreakpoint(sourceFile.getId(), breakpoint.getLocation().getLineIndexInFile());
        eventsProcessor.getBreakpointCache().putBackendBreakpointObject(breakpoint, location);
        return true;
      } catch (NoResponseException e) {
        // that's fine, the player must've done its job already
      } catch (NotConnectedException e) {
        LOG.error("Can't request breakpoint creation", e);
      }
    }

    return false;
  }

  @Override
  public void remove(FDBEventsProcessor eventProcessor, ASLineBreakpoint breakpoint) {
    Location backendLocation = eventProcessor.getBreakpointCache().getBackendBreakpointObject(breakpoint);
    if (backendLocation == null) {
      LOG.warning("Trying to remove the breakpoint which wasn't properly requested");
      return;
    }

    try {
      eventProcessor.getFdbSession().clearBreakpoint(backendLocation);
    } catch (NoResponseException e) {
      LOG.error("Can't request breakpoint removal", e);
    } catch (NotConnectedException e) {
      LOG.error("Can't request breakpoint removal", e);
    }
  }

  @Override
  public ASBreakpointKind getBreakpointKind() {
    return ASBreakpointKind.LINE_BREAKPOINT;
  }

  @Override
  public String getEventProcessorId() {
    return FDBEventsProcessor.ID;
  }
}
