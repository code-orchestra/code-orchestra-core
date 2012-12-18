package codeOrchestra.javaScript.debugger.listener;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugProcessAdapter implements JSDebugProcessListener {

  @Override
  public void paused(@NotNull JSSuspendContext suspendContext) {
  }

  @Override
  public void resumed(@NotNull JSSuspendContext suspendContext) {
  }

  @Override
  public void processDetached(@NotNull ChromeEventsProcessor eventsProcessor, boolean closedByUser) {
  }

  @Override
  public void processAttached(@NotNull ChromeEventsProcessor eventsProcessor) {
  }
}
