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
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.traceInfo.TraceInfoManager;
import jetbrains.mps.traceInfo.TraceablePositionInfo;
import jetbrains.mps.util.Mapper;
import jetbrains.mps.util.Mapper2;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.ToRemove;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DebugInfoManager implements ApplicationComponent {
  private static Logger LOG = Logger.getLogger(DebugInfoManager.class);

  private final TraceInfoManager myTraceInfoManager;

  public static DebugInfoManager getInstance() {
    return ApplicationManager.getApplication().getComponent(DebugInfoManager.class);
  }

  private final Map<String, Mapper2<SNode, Project, ILocationBreakpoint>> myDebuggableConcepts = new HashMap<String, Mapper2<SNode, Project, ILocationBreakpoint>>();

  @NotNull
  public String getComponentName() {
    return "Debug Info Manager";
  }

  public DebugInfoManager(TraceInfoManager manager) {
    myTraceInfoManager = manager;
  }

  @Deprecated
  public void addDebuggableConcept(String fqName) {
    addDebuggableConcept(fqName, null);
  }

  public void addConceptBreakpointCreator(String fqName, Mapper2<SNode, Project, ILocationBreakpoint> breakpointCreator) {
    myDebuggableConcepts.put(fqName, breakpointCreator);
  }

  @Deprecated
  @ToRemove(version = 2.0)
  public void addDebuggableConcept(String fqName, final Mapper2<SNode, Project, AbstractMPSBreakpoint> breakpointCreator) {
    // legacy
    myDebuggableConcepts.put(fqName, new Mapper2<SNode, Project, ILocationBreakpoint>() {
      @Override
      public ILocationBreakpoint value(SNode key1, Project key2) {
        return (ILocationBreakpoint) breakpointCreator.value(key1, key2);
      }
    });
  }

  public void removeConceptBreakpointCreator(String fqName) {
    myDebuggableConcepts.remove(fqName);
  }

  @Deprecated
  @ToRemove(version = 2.0)
  public void removeDebuggableConcept(String fqName) {
    removeConceptBreakpointCreator(fqName);
  }

  @Deprecated
  public void addScopeConcept(String fqName, Mapper<SNode, List<SNode>> varsGetter) {
    myTraceInfoManager.addScopeConcept(fqName, varsGetter);
  }

  @Deprecated
  public void removeScopeConcept(String fqName) {
    myTraceInfoManager.removeScopeConcept(fqName);
  }

  @Deprecated
  public void addUnitConcept(String fqName, Mapper<SNode, String> nameGetter) {
    myTraceInfoManager.addUnitConcept(fqName, nameGetter);
  }

  @Deprecated
  public void removeUnitConcept(String fqName) {
    myTraceInfoManager.removeUnitConcept(fqName);
  }

  public boolean isDebuggableNode(@Nullable SNode node) {
    if (node == null) {
      return false;
    }
    for (String concept : myDebuggableConcepts.keySet()) {
      if (SNodeOperations.isInstanceOf(node, concept)) return true;
    }
    return false;
  }

  private ILocationBreakpoint createBreakpoint(String concept, SNode node, Project project) {
    Mapper2<SNode, Project, ILocationBreakpoint> mapper2 = myDebuggableConcepts.get(concept);
    if (mapper2 == null) {
      LOG.warning("Could not create breakpoint for node " + node);
      return null;
    }
    return mapper2.value(node, project);
  }

  @Nullable
  public ILocationBreakpoint createBreakpoint(SNode node, Project project) {
    for (String concept : myDebuggableConcepts.keySet()) {
      if (SNodeOperations.isInstanceOf(node, concept)) {
        return createBreakpoint(concept, node, project);
      }
    }

    DebugInfo debugInfo = TraceInfoCache.getInstance().get(node.getModel().getModelDescriptor());
    if (debugInfo != null) {
      TraceablePositionInfo position = debugInfo.getPositionForNode(node.getId());
      if (position != null) {
        String conceptFqName = position.getConceptFqName();
        if (conceptFqName == null) return null;
        List<SNode> superConcepts = SConceptOperations.getAllSuperConcepts(SConceptOperations.findConceptDeclaration(conceptFqName), true);
        for (SNode superConcept : superConcepts) {
          String superConceptFqName = NameUtil.nodeFQName(superConcept);
          if (myDebuggableConcepts.keySet().contains(superConceptFqName)) {
            return createBreakpoint(superConceptFqName, node, project);
          }
        }
      }
    }
    return null;
  }

  public void initComponent() {
  }

  public void disposeComponent() {
  }
}
