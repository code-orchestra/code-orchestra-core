/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.debug.runtime;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * Date: 16.04.2010
 * Time: 20:24:44
 * To change this template use File | Settings | File Templates.
 */
public class VMEventsProcessorManagerComponent implements ProjectComponent {
  private final Map<DebugVMEventsProcessor, DebugSession> myEventProcessorToSessionMap = new HashMap<DebugVMEventsProcessor, DebugSession>(1);
  private final DebugProcessListener myListener = new MyDebugProcessesMulticaster();
  private final List<DebugProcessListener> myAllProcessListeners = new ArrayList<DebugProcessListener>();
  private final DebugSessionManagerComponent myDebugManager;

  public static VMEventsProcessorManagerComponent getInstance(Project project) {
    return project.getComponent(VMEventsProcessorManagerComponent.class);
  }

  public VMEventsProcessorManagerComponent(DebugSessionManagerComponent component) {
    myDebugManager = component;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "MPS Debug VM Events Processors Manager";
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  public DebugVMEventsProcessor getDebugVMEventsProcessor(DebugSession session) {
    synchronized (myEventProcessorToSessionMap) {
      for (DebugVMEventsProcessor p : myEventProcessorToSessionMap.keySet()) {
        if (myEventProcessorToSessionMap.get(p) == session) {
          return p;
        }
      }
      return null;
    }
  }

  private Set<DebugVMEventsProcessor> getDebugProcesses() {
    synchronized (myEventProcessorToSessionMap) {
      return new HashSet<DebugVMEventsProcessor>(myEventProcessorToSessionMap.keySet());
    }
  }

  private void removeDebugProcess(DebugVMEventsProcessor process) {
    synchronized (myEventProcessorToSessionMap) {
      DebugSession debugSession = myEventProcessorToSessionMap.remove(process);
      myDebugManager.removeDebugSession(debugSession);
    }
    process.removeDebugProcessListener(myListener);
  }

  public void performAllDebugProcessesAction(final AllDebugProcessesAction action) {
    for (final DebugVMEventsProcessor processor : getDebugProcesses()) {
      processor.getManagerThread().invoke(new DebuggerCommand() {
        @Override
        protected void action() throws Exception {
          action.run(processor);
        }
      });
    }
  }

  public void addDebugSession(DebugSession debugSession) {
    DebugVMEventsProcessor process = debugSession.getEventsProcessor();
    synchronized (myEventProcessorToSessionMap) {
      myEventProcessorToSessionMap.put(process, debugSession);
    }
    process.addDebugProcessListener(myListener);
  }


  public interface AllDebugProcessesAction {
    public void run(DebugVMEventsProcessor processor);
  }


  private class MyDebugProcessesMulticaster implements DebugProcessListener {
    @Override
    public void connectorIsReady() {
      for (DebugProcessListener listener : getAllProcessListeners()) {
        listener.connectorIsReady();
      }
    }

    @Override
    public void paused(@NotNull SuspendContext suspendContext) {
      for (DebugProcessListener listener : getAllProcessListeners()) {
        listener.paused(suspendContext);
      }
    }

    @Override
    public void resumed(@NotNull SuspendContext suspendContext) {
      for (DebugProcessListener listener : getAllProcessListeners()) {
        listener.resumed(suspendContext);
      }
    }

    @Override
    public void processDetached(@NotNull DebugVMEventsProcessor process, boolean closedByUser) {
      for (DebugProcessListener listener : getAllProcessListeners()) {
        listener.processDetached(process, closedByUser);
      }
      removeDebugProcess(process);
    }

    @Override
    public void processAttached(@NotNull DebugVMEventsProcessor process) {
      for (DebugProcessListener listener : getAllProcessListeners()) {
        listener.processAttached(process);
      }
    }
  }

  public void addAllProcessListener(DebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.add(listener);
    }
  }

  public void removeAllProcessListener(DebugProcessListener listener) {
    synchronized (myAllProcessListeners) {
      myAllProcessListeners.remove(listener);
    }
  }

  public List<DebugProcessListener> getAllProcessListeners() {
    synchronized (myAllProcessListeners) {
      return new ArrayList<DebugProcessListener>(myAllProcessListeners);
    }
  }
}
