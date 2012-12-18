package codeOrchestra.debugger.breakpoint;

import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointKind;
import codeOrchestra.debugger.DebuggerEventProcessor;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public interface BreakpointRequestProcessor<E extends DebuggerEventProcessor, B extends ASBreakpoint> {
  
  boolean create(E eventProcessor, B breakpoint);
  void remove(E eventProcessor, B breakpoint);
  @NotNull ASBreakpointKind getBreakpointKind();
  @NotNull String getEventProcessorId();
  
}
