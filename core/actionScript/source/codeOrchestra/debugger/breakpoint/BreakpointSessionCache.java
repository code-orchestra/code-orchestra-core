package codeOrchestra.debugger.breakpoint;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;

/**
 * @author Alexander Eliseyev
 */
public interface BreakpointSessionCache<T extends Object> {
  
  void putBackendBreakpointObject(ASBreakpoint asBreakpoint, T backendObject);
  T getBackendBreakpointObject(ASBreakpoint asBreakpoint);
  void dispose();
  
}
