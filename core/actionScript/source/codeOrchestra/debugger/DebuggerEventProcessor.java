package codeOrchestra.debugger;

import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.runtime.execution.IDebuggerManagerThread;

/**
 * @author Alexander Eliseyev
 */
public interface DebuggerEventProcessor {
  
  String getId();
  BreakpointManagerComponent getBreakpointManager();
  IDebuggerManagerThread getManagerThread();
  boolean isAttached();
  
}
