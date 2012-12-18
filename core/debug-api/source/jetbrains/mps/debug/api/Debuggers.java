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
package jetbrains.mps.debug.api;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

public class Debuggers implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(Debuggers.class);
  private final List<IDebugger> myDebuggers = new ArrayList<IDebugger>();

  @NotNull
  @Override
  public String getComponentName() {
    return "Debuggers";
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  public void registerDebugger(@NotNull IDebugger debugger) {
    synchronized (myDebuggers) {
      myDebuggers.add(debugger);
    }
  }

  public void unRegisterDebugger(@NotNull IDebugger debugger) {
    boolean removed;
    synchronized (myDebuggers) {
     removed = myDebuggers.remove(debugger);
    }
    if (!removed) {
      LOG.warning("Debugger " + debugger.getName() + " was not registered.");
    }
  }

  public List<IDebugger> getDebuggers() {
    synchronized (myDebuggers) {
      List<IDebugger> debuggers;
      debuggers = new ArrayList<IDebugger>(myDebuggers);
      return debuggers;
    }
  }

  @Nullable
  public IDebugger getDebuggerByName(@NotNull String name) {
    for (IDebugger debugger : getDebuggers()) {
      if (name.equals(debugger.getName())) {
        return debugger;
      }
    }
    return null;
  }

  @NotNull
  public IDebugger getDebuggerByNameSafe(@NotNull String name) throws DebuggerNotPresentException {
    IDebugger debugger = getDebuggerByName(name);
    if (debugger != null) {
      return debugger;
    }
    throw new DebuggerNotPresentException("Cannot find debugger " + name);
  }

  public static Debuggers getInstance() {
    return ApplicationManager.getApplication().getComponent(Debuggers.class);
  }
}
