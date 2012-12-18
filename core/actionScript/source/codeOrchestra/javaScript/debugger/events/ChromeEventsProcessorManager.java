package codeOrchestra.javaScript.debugger.events;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import codeOrchestra.javaScript.debugger.listener.JSDebugProcessListener;
import codeOrchestra.javaScript.debugger.session.JSDebugSession;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.util.misc.hash.HashMap;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class ChromeEventsProcessorManager implements ProjectComponent {

  private Map<ChromeEventsProcessor, JSDebugSession> eventsProcessorToSessionMap = new HashMap<ChromeEventsProcessor, JSDebugSession>();
  private final JSDebugProcessListener myListener = new MyDebugProcessesMulticaster();
  private final List<JSDebugProcessListener> myAllProcessListeners = new ArrayList<JSDebugProcessListener>();
  private DebugSessionManagerComponent myDebugManager;

  public static ChromeEventsProcessorManager getInstance(Project project) {
    return project.getComponent(ChromeEventsProcessorManager.class);
  }

  public ChromeEventsProcessorManager(DebugSessionManagerComponent component) {
    this.myDebugManager = component;
  }

  public ChromeEventsProcessor getDebugVMEventsProcessor(JSDebugSession session) {
    synchronized (eventsProcessorToSessionMap) {
      for (ChromeEventsProcessor p : eventsProcessorToSessionMap.keySet()) {
        if (eventsProcessorToSessionMap.get(p) == session) {
          return p;
        }
      }
      return null;
    }
  }

  private Set<ChromeEventsProcessor> getDebugProcesses() {
    synchronized (eventsProcessorToSessionMap) {
      return new HashSet<ChromeEventsProcessor>(eventsProcessorToSessionMap.keySet());
    }
  }

  private void removeDebugProcess(ChromeEventsProcessor process) {
    synchronized (eventsProcessorToSessionMap) {
      JSDebugSession debugSession = eventsProcessorToSessionMap.remove(process);
      myDebugManager.removeDebugSession(debugSession);
    }
    process.removeDebugProcessListener(myListener);
  }

  public void addDebugSession(JSDebugSession debugSession) {
    ChromeEventsProcessor process = debugSession.getEventsProcessor();
    synchronized (eventsProcessorToSessionMap) {
      eventsProcessorToSessionMap.put(process, debugSession);
    }
    process.addDebugProcessListener(myListener);
  }

  public void performAllDebugProcessesAction(final AllDebugProcessesAction action) {
    for (final ChromeEventsProcessor processor : getDebugProcesses()) {
      processor.getManagerThread().invoke(new DebuggerCommand() {
        @Override
        protected void action() throws Exception {
          action.run(processor);
        }
      });
    }
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Chrome Events Processors Manager";
  }

  public interface AllDebugProcessesAction {
    public void run(ChromeEventsProcessor processor);
  }

  private class MyDebugProcessesMulticaster implements JSDebugProcessListener {

    @Override
    public void paused(@NotNull JSSuspendContext suspendContext) {
      for (JSDebugProcessListener listener : getAllProcessListeners()) {
        listener.paused(suspendContext);
      }
    }

    @Override
    public void resumed(@NotNull JSSuspendContext suspendContext) {
      for (JSDebugProcessListener listener : getAllProcessListeners()) {
        listener.resumed(suspendContext);
      }
    }

    @Override
    public void processDetached(@NotNull ChromeEventsProcessor process, boolean closedByUser) {
      for (JSDebugProcessListener listener : getAllProcessListeners()) {
        listener.processDetached(process, closedByUser);
      }
      removeDebugProcess(process);
    }

    @Override
    public void processAttached(@NotNull ChromeEventsProcessor process) {
      for (JSDebugProcessListener listener : getAllProcessListeners()) {
        listener.processAttached(process);
      }
    }
  }

  public void addAllProcessListener(JSDebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.add(listener);
    }
  }

  public void removeAllProcessListener(JSDebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.remove(listener);
    }
  }

  public List<JSDebugProcessListener> getAllProcessListeners() {
    synchronized (myAllProcessListeners) {
      return new ArrayList<JSDebugProcessListener>(myAllProcessListeners);
    }
  }

}
