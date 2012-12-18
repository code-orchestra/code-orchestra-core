package codeOrchestra.actionScript.debugger.listener;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugProcessAdapter implements ASDebugProcessListener {

  @Override
  public void paused(@NotNull ASSuspendContext suspendContext) {

  }

  @Override
  public void resumed(@NotNull ASSuspendContext suspendContext) {

  }

  @Override
  public void processDetached(@NotNull FDBEventsProcessor eventsProcessor, boolean closedByUser) {

  }

  @Override
  public void processAttached(@NotNull FDBEventsProcessor eventsProcessor) {

  }
}
