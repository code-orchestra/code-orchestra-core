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
import com.intellij.openapi.util.Computable;
import jetbrains.mps.debug.api.breakpoints.*;
import jetbrains.mps.debug.api.breakpoints.AbstractBreakpoint;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.traceInfo.PositionInfo;
import jetbrains.mps.util.annotation.ToRemove;
import org.jetbrains.annotations.NotNull;

@Deprecated
@ToRemove(version = 2.0)
public abstract class AbstractMPSBreakpoint extends AbstractBreakpoint implements ILocationBreakpoint {
  private static final Logger LOG = Logger.getLogger(AbstractMPSBreakpoint.class);
  private final BreakpointLocation myLocation;
  protected final Project myProject;

  protected AbstractMPSBreakpoint(@NotNull SNodePointer nodePointer, Project project) {
    super(project);
    myProject = project;
    myLocation = new BreakpointLocation(nodePointer);
  }

  @Override
  public String getPresentation() {
    return myLocation.getPresentation();
  }

  @NotNull
  @Override
  public IBreakpointKind getKind() {
    return DefaultKind.getInstance();
  }

  public SNodePointer getNodePointer() {
    return myLocation.getNodePointer();
  }

  public SNode getSNode() {
    return myLocation.getSNode();
  }

  public PositionInfo getTargetCodePosition() {
    return myLocation.getTargetCodePosition();
  }

  public String getTargetUnitName() {
    return myLocation.getTargetUnitName();
  }

  public boolean isValid() {
    return myLocation.isValid();
  }

  public int getLineIndexInFile() {
    return myLocation.getLineIndexInFile();
  }

  public String getFileName() {
    return myLocation.getFileName();
  }

  public SModelReference getModelReference() {
    return myLocation.getModelReference();
  }

  public boolean supportsDisable() {
    return false;
  }

  @NotNull
  @Override
  public BreakpointLocation getLocation() {
    return myLocation;
  }

  public BreakpointInfo createBreakpointInfo() {
    return new BreakpointInfo(this, myLocation);
  }


  public static AbstractMPSBreakpoint fromBreakpointInfo(final BreakpointInfo breakpointInfo, final Project project) {
    AbstractMPSBreakpoint abstractMPSBreakpoint = ModelAccess.instance().runReadAction(new Computable<AbstractMPSBreakpoint>() {
      @Override
      public AbstractMPSBreakpoint compute() {
        SNodePointer pointer = new SNodePointer(breakpointInfo.myModelReference, breakpointInfo.myNodeId);
        return fromPointer(pointer, project);
      }
    });
    if (abstractMPSBreakpoint != null) {
      abstractMPSBreakpoint.setCreationTime(breakpointInfo.myCreationTime);
    }
    return abstractMPSBreakpoint;
  }

  public static AbstractMPSBreakpoint fromPointer(SNodePointer pointer, Project project) {
    SNode node = pointer.getNode();
    if (node == null) return null;
    return fromNode(node, project);
  }

  public static AbstractMPSBreakpoint fromNode(@NotNull SNode node, Project project) {
    try {
      return (AbstractMPSBreakpoint) DebugInfoManager.getInstance().createBreakpoint(node, project);
    } catch (ClassCastException e) {
      LOG.warning("Class " + AbstractMPSBreakpoint.class.getName() + " is deprecated and soon will be removed. See MPS users guide for transition to the new debug api.");
      return null;
    }
  }
}
