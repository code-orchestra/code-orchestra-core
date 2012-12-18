package codeOrchestra.javaScript.debugger.listener;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugProcessMulticaster {

  private static Logger LOG = Logger.getLogger(JSDebugProcessMulticaster.class);

  private List<JSDebugProcessListener> listeners = new ArrayList<JSDebugProcessListener>();

  private List<JSDebugProcessListener> getListeners() {
    synchronized (listeners) {
      return new ArrayList<JSDebugProcessListener>(listeners);
    }
  }

  public void addListener(@NotNull JSDebugProcessListener listener) {
    synchronized (listeners) {
      listeners.add(listener);
    }
  }

  public void removeListener(@NotNull JSDebugProcessListener listener) {
    synchronized (listeners) {
      listeners.remove(listener);
    }
  }

  public void paused(@NotNull JSSuspendContext suspendContext) {
    for (JSDebugProcessListener listener : getListeners()) {
      try {
        listener.paused(suspendContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void resumed(@NotNull JSSuspendContext suspendContext) {
    for (JSDebugProcessListener listener : getListeners()) {
      try {
        listener.resumed(suspendContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void processDetached(@NotNull ChromeEventsProcessor eventsProcessor, boolean closedByUser) {
    for (JSDebugProcessListener listener : getListeners()) {
      try {
        listener.processDetached(eventsProcessor, closedByUser);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void processAttached(@NotNull ChromeEventsProcessor eventsProcessor) {
    for (JSDebugProcessListener listener : getListeners()) {
      try {
        listener.processAttached(eventsProcessor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

}
