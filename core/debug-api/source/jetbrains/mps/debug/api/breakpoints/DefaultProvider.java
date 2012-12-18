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

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import com.intellij.util.xmlb.XmlSerializer;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.AbstractMPSBreakpoint;
import jetbrains.mps.debug.api.BreakpointInfo;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.ToRemove;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import java.util.Collections;
import java.util.List;

@Deprecated
@ToRemove(version = 2.0)
public class DefaultProvider implements IBreakpointsProvider<AbstractMPSBreakpoint, DefaultKind>, ApplicationComponent {
  private final BreakpointProvidersManager myProvidersManager;

  public DefaultProvider(BreakpointProvidersManager providersManager) {
    myProvidersManager = providersManager;
  }
  @NotNull
  @Override
  public List<DefaultKind> getAllKinds() {
    return Collections.singletonList(DefaultKind.getInstance());
  }

  @Override
  public boolean canCreateFromUi(@NotNull DefaultKind kind) {
    return false;
  }

  @Override
  public boolean canCreateFromNode(@NotNull DefaultKind kind) {
    return false;
  }

  @Override
  public AbstractMPSBreakpoint createFromUi(@NotNull DefaultKind kind, Project project) {
    return null;
  }

  @Override
  public AbstractMPSBreakpoint createFromNode(@NotNull SNode node, @NotNull DefaultKind kind, Project project) {
    return null;
  }

  @Override
  public IBreakpointPropertiesUi<AbstractMPSBreakpoint> createPropertiesEditor(@NotNull DefaultKind kind) {
    return null;
  }

  @Override
  public AbstractMPSBreakpoint loadFromState(Element state, DefaultKind kind, Project project) {
    return AbstractMPSBreakpoint.fromBreakpointInfo(XmlSerializer.deserialize(state, BreakpointInfo.class), project);
  }

  @Override
  public Element saveToState(@NotNull AbstractMPSBreakpoint breakpoint) {
    return XmlSerializer.serialize(breakpoint.createBreakpointInfo());
  }

  @Override
  public Icon getIcon(@NotNull AbstractMPSBreakpoint breakpoint, @Nullable AbstractDebugSession session) {
    return null;
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Default Breakpoints Provider";
  }

  @Override
  public void initComponent() {
    myProvidersManager.registerProvider(this);
  }

  @Override
  public void disposeComponent() {
    myProvidersManager.unregisterProvider(this);
  }
}
