package codeOrchestra.javaScript.debugger.request;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import codeOrchestra.actionScript.debugger.breakpoint.InvalidBreakpointException;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSPostponedBreakpointsManager {

  private ChromeEventsProcessor eventsProcessor;
  private List<ASBreakpoint> breakpoints = new ArrayList<ASBreakpoint>();

  public JSPostponedBreakpointsManager(ChromeEventsProcessor eventsProcessor) {
    this.eventsProcessor = eventsProcessor;
  }

  public synchronized void add(ASBreakpoint breakpoint) {
    if (!breakpoints.contains(breakpoint)) {
      breakpoints.add(breakpoint);
    }
  }

  public synchronized void retryRequests() {
    Iterator<ASBreakpoint> breakpointIterator = breakpoints.iterator();
    while (breakpointIterator.hasNext()) {
      ASBreakpoint breakpoint = breakpointIterator.next();
      try {
        if (breakpoint.createRequest(eventsProcessor)) {
          breakpointIterator.remove();
        }
      } catch (InvalidBreakpointException e) {
        breakpointIterator.remove(); // Remove anyway - we don't need to keep submitting an invalid breakpoint
      }
    }
  }

}
