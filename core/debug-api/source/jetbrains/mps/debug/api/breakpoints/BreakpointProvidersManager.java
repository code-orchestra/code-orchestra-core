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
package jetbrains.mps.debug.api.breakpoints;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class BreakpointProvidersManager implements ApplicationComponent {
  private final Map<IBreakpointKind, IBreakpointsProvider> myKindToProvider = new HashMap<IBreakpointKind, IBreakpointsProvider>();
  private final Map<String, IBreakpointKind> myNameToKind = new HashMap<String, IBreakpointKind>();

  public static BreakpointProvidersManager getInstance() {
    return ApplicationManager.getApplication().getComponent(BreakpointProvidersManager.class);
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Breakpoint Providers Manager Component";
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  public void registerProvider(IBreakpointsProvider<? extends IBreakpoint, ? extends IBreakpointKind<? extends IBreakpoint>> provider) {
    // I just love generics in java
    for (IBreakpointKind kind : provider.getAllKinds()) {
      myKindToProvider.put(kind, provider);
      myNameToKind.put(kind.getName(), kind);
    }
    for (Project project : ProjectManager.getInstance().getOpenProjects()) {
      BreakpointManagerComponent.getInstance(project).reReadState();
    }
  }

  public void unregisterProvider(IBreakpointsProvider<? extends IBreakpoint, ? extends IBreakpointKind<? extends IBreakpoint>> provider) {
    Map<BreakpointManagerComponent, Element> states = new HashMap<BreakpointManagerComponent, Element>();
    for (Project project : ProjectManager.getInstance().getOpenProjects()) {
      BreakpointManagerComponent component = BreakpointManagerComponent.getInstance(project);
      states.put(component, component.getState());
    }
    for (IBreakpointKind kind : provider.getAllKinds()) {
      myKindToProvider.remove(kind);
      myNameToKind.remove(kind.getName());
    }
    for (BreakpointManagerComponent component : states.keySet()) {
      component.loadState(states.get(component));
    }
  }

  @Nullable
  public IBreakpointsProvider getProvider(IBreakpointKind kind) {
    return myKindToProvider.get(kind);
  }

  @Nullable
  public IBreakpointKind getKind(String name) {
    return myNameToKind.get(name);
  }

  public Set<IBreakpointKind> getAllKinds() {
    return myKindToProvider.keySet();
  }
}
