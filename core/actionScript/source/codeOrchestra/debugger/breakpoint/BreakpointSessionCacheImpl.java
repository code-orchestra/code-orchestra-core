package codeOrchestra.debugger.breakpoint;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class BreakpointSessionCacheImpl<T extends Object> implements BreakpointSessionCache<T> {

  private Map<ASBreakpoint, T> backendObjects = new HashMap<ASBreakpoint, T>();
  
  @Override
  public synchronized void putBackendBreakpointObject(ASBreakpoint asBreakpoint, T backendObject) {
    backendObjects.put(asBreakpoint, backendObject);
  }

  @Override
  public synchronized T getBackendBreakpointObject(ASBreakpoint asBreakpoint) {
    return backendObjects.get(asBreakpoint);
  }

  @Override
  public void dispose() {
    backendObjects.clear();
  }
}
