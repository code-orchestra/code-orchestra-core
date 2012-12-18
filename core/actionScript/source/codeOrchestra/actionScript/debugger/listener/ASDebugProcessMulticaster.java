package codeOrchestra.actionScript.debugger.listener;

import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugProcessMulticaster {

  private static Logger LOG = Logger.getLogger(ASDebugProcessMulticaster.class);

  private List<ASDebugProcessListener> listeners = new ArrayList<ASDebugProcessListener>();

  private List<ASDebugProcessListener> getListeners() {
    synchronized (listeners) {
      return new ArrayList<ASDebugProcessListener>(listeners);
    }
  }

  public void addListener(@NotNull ASDebugProcessListener listener) {
    synchronized (listeners) {
      listeners.add(listener);
    }
  }

  public void removeListener(@NotNull ASDebugProcessListener listener) {
    synchronized (listeners) {
      listeners.remove(listener);
    }
  }

  public void paused(@NotNull ASSuspendContext suspendContext) {
    for (ASDebugProcessListener listener : getListeners()) {
      try {
        listener.paused(suspendContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void resumed(@NotNull ASSuspendContext suspendContext) {
    for (ASDebugProcessListener listener : getListeners()) {
      try {
        listener.resumed(suspendContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void processDetached(@NotNull FDBEventsProcessor eventsProcessor, boolean closedByUser) {
    for (ASDebugProcessListener listener : getListeners()) {
      try {
        listener.processDetached(eventsProcessor, closedByUser);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void processAttached(@NotNull FDBEventsProcessor eventsProcessor) {
    for (ASDebugProcessListener listener : getListeners()) {
      try {
        listener.processAttached(eventsProcessor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

}
