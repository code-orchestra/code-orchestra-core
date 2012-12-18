package codeOrchestra.javaScript.debugger.command;

import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public abstract class JSSuspendContextCommand extends DebuggerCommand {
  private final JSSuspendContext mySuspendContext;

  public JSSuspendContextCommand(@NotNull JSSuspendContext suspendContext) {
    mySuspendContext = suspendContext;
  }

  public JSSuspendContext getSuspendContext() {
    return mySuspendContext;
  }
}
