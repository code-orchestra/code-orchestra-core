package codeOrchestra.actionScript.debugger.events;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessListener;
import codeOrchestra.actionScript.debugger.session.ASDebugSession;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.util.misc.hash.HashMap;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class FDBEventsProcessorManager implements ProjectComponent {

  private Map<FDBEventsProcessor, ASDebugSession> eventsProcessorToSessionMap = new HashMap<FDBEventsProcessor, ASDebugSession>();
  private final ASDebugProcessListener myListener = new MyDebugProcessesMulticaster();
  private final List<ASDebugProcessListener> myAllProcessListeners = new ArrayList<ASDebugProcessListener>();
  private DebugSessionManagerComponent myDebugManager;

  public static FDBEventsProcessorManager getInstance(Project project) {
    return project.getComponent(FDBEventsProcessorManager.class);
  }

  public FDBEventsProcessorManager(DebugSessionManagerComponent component) {
    this.myDebugManager = component;
  }

  public FDBEventsProcessor getDebugVMEventsProcessor(ASDebugSession session) {
    synchronized (eventsProcessorToSessionMap) {
      for (FDBEventsProcessor p : eventsProcessorToSessionMap.keySet()) {
        if (eventsProcessorToSessionMap.get(p) == session) {
          return p;
        }
      }
      return null;
    }
  }

  private Set<FDBEventsProcessor> getDebugProcesses() {
    synchronized (eventsProcessorToSessionMap) {
      return new HashSet<FDBEventsProcessor>(eventsProcessorToSessionMap.keySet());
    }
  }

  private void removeDebugProcess(FDBEventsProcessor process) {
    synchronized (eventsProcessorToSessionMap) {
      ASDebugSession debugSession = eventsProcessorToSessionMap.remove(process);
      myDebugManager.removeDebugSession(debugSession);
    }
    process.removeDebugProcessListener(myListener);
  }

  public void addDebugSession(ASDebugSession debugSession) {
    FDBEventsProcessor process = debugSession.getFDBEventsProcessor();
    synchronized (eventsProcessorToSessionMap) {
      eventsProcessorToSessionMap.put(process, debugSession);
    }
    process.addDebugProcessListener(myListener);
  }

  public void performAllDebugProcessesAction(final AllDebugProcessesAction action) {
    for (final FDBEventsProcessor processor : getDebugProcesses()) {
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
    return "FDB Events Processors Manager";
  }

  public interface AllDebugProcessesAction {
    public void run(FDBEventsProcessor processor);
  }

  private class MyDebugProcessesMulticaster implements ASDebugProcessListener {

    @Override
    public void paused(@NotNull ASSuspendContext suspendContext) {
      for (ASDebugProcessListener listener : getAllProcessListeners()) {
        listener.paused(suspendContext);
      }
    }

    @Override
    public void resumed(@NotNull ASSuspendContext suspendContext) {
      for (ASDebugProcessListener listener : getAllProcessListeners()) {
        listener.resumed(suspendContext);
      }
    }

    @Override
    public void processDetached(@NotNull FDBEventsProcessor process, boolean closedByUser) {
      for (ASDebugProcessListener listener : getAllProcessListeners()) {
        listener.processDetached(process, closedByUser);
      }
      removeDebugProcess(process);
    }

    @Override
    public void processAttached(@NotNull FDBEventsProcessor process) {
      for (ASDebugProcessListener listener : getAllProcessListeners()) {
        listener.processAttached(process);
      }
    }
  }

  public void addAllProcessListener(ASDebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.add(listener);
    }
  }

  public void removeAllProcessListener(ASDebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.remove(listener);
    }
  }

  public List<ASDebugProcessListener> getAllProcessListeners() {
    synchronized (myAllProcessListeners) {
      return new ArrayList<ASDebugProcessListener>(myAllProcessListeners);
    }
  }

}
