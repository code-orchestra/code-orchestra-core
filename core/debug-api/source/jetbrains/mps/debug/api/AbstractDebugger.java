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

import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.breakpoints.*;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

public abstract class AbstractDebugger<B extends IBreakpoint, K extends IBreakpointKind<B>> implements IDebugger<B, K> {
  @NotNull
  private final String myName;
  private final BreakpointProvidersManager myBreakpointsProviderManager;
  private final Debuggers myDebuggers;
  private IBreakpointsProvider<B, K> myBreakpointsProvider;

  public AbstractDebugger(String name, Debuggers debuggers, BreakpointProvidersManager breakpointsProviderManager) {
    myName = name;
    myDebuggers = debuggers;
    myBreakpointsProviderManager = breakpointsProviderManager;
  }

  public void init() {
    myBreakpointsProvider = getBreakpointsProvider();
    myDebuggers.registerDebugger(this);
    myBreakpointsProviderManager.registerProvider(myBreakpointsProvider);
  }

  public void dispose() {
    myBreakpointsProviderManager.unregisterProvider(myBreakpointsProvider);
    myDebuggers.unRegisterDebugger(this);
  }

  @NotNull
  @Override
  public String getName() {
    return myName;
  }

  @Override
  public ILocationBreakpoint createBreakpoint(SNode node, String kindName, Project project) {
    K kind = null;
    for (K k : myBreakpointsProvider.getAllKinds()) {
      if (k.getName().equals(kindName)) {
        kind = k;
        break;
      }
    }
    if (kind != null && myBreakpointsProvider.canCreateFromNode(kind)) {
      return myBreakpointsProvider.createFromNode(node, kind, project);
    }
    return null;
  }
}
