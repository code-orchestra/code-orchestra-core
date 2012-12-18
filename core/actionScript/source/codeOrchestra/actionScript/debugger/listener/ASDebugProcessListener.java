package codeOrchestra.actionScript.debugger.listener;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public interface ASDebugProcessListener {

  //executed in manager thread

  void paused(@NotNull ASSuspendContext suspendContext);

  //executed in manager thread

  void resumed(@NotNull ASSuspendContext suspendContext);

  //executed in manager thread

  void processDetached(@NotNull FDBEventsProcessor eventsProcessor, boolean closedByUser);

  //executed in manager thread

  void processAttached(@NotNull FDBEventsProcessor eventsProcessor);

}
