package codeOrchestra.actionScript.debugger.command;

import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASSuspendContextCommand extends DebuggerCommand {
  private final ASSuspendContext mySuspendContext;

  public ASSuspendContextCommand(@NotNull ASSuspendContext suspendContext) {
    mySuspendContext = suspendContext;
  }

  public ASSuspendContext getSuspendContext() {
    return mySuspendContext;
  }
}
