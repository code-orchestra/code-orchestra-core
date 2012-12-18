package codeOrchestra.javaScript.debugger.listener;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public interface JSDebugProcessListener {

  //executed in manager thread

  void paused(@NotNull JSSuspendContext suspendContext);

  //executed in manager thread

  void resumed(@NotNull JSSuspendContext suspendContext);

  //executed in manager thread

  void processDetached(@NotNull ChromeEventsProcessor eventsProcessor, boolean closedByUser);

  //executed in manager thread

  void processAttached(@NotNull ChromeEventsProcessor eventsProcessor);

}
