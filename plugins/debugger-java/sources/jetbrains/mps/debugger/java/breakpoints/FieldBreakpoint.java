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
package jetbrains.mps.debugger.java.breakpoints;

import com.intellij.openapi.project.Project;
import com.sun.jdi.*;
import com.sun.jdi.request.AccessWatchpointRequest;
import com.sun.jdi.request.ModificationWatchpointRequest;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.debug.breakpoints.JavaBreakpoint;
import jetbrains.mps.debug.breakpoints.JavaBreakpointKind;
import jetbrains.mps.debug.evaluation.EvaluationUtils;
import jetbrains.mps.debug.runtime.DebugVMEventsProcessor;
import jetbrains.mps.debug.runtime.RequestManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

public class FieldBreakpoint extends JavaBreakpoint implements ILocationBreakpoint {
  private static final Logger LOG = Logger.getLogger(FieldBreakpoint.class);
  private final BreakpointLocation myLocation;
  private String myFieldName;

  public FieldBreakpoint(@NotNull SNodePointer nodePointer, Project project) {
    super(project);
    myLocation = new BreakpointLocation(nodePointer);
  }

  public FieldBreakpoint(@NotNull SNode node, Project project) {
    this(new SNodePointer(node), project);
  }

  private boolean updateFieldName() {
    if (myFieldName != null) return true;
    myFieldName = myLocation.getTargetCodePosition().getPropertyString();
    return myFieldName != null;
  }

  @NotNull
  @Override
  public BreakpointLocation getLocation() {
    return myLocation;
  }

  @Override
  protected String getClassNameToPrepare() {
    return myLocation.getTargetUnitName();
  }

  @NotNull
  @Override
  public JavaBreakpointKind getKind() {
    return JavaBreakpointKind.FIELD_BREAKPOINT;
  }

  @Override
  public String getPresentation() {
    return myLocation.getPresentation();
  }

  @Override
  protected void createRequestForPreparedClass(DebugVMEventsProcessor debugProcess, ReferenceType classType) {
    RequestManager requestManager = debugProcess.getRequestManager();

    if (!updateFieldName()) return;

    try {
      Field field = EvaluationUtils.findField((ClassType) classType, myFieldName);
      AccessWatchpointRequest fieldAccessRequest = requestManager.createFieldAccessRequest(this, field);
      ModificationWatchpointRequest fieldModificationRequest = requestManager.createFieldModificationRequest(this, field);
      requestManager.enableRequest(fieldAccessRequest);
      requestManager.enableRequest(fieldModificationRequest);
    } catch (ClassNotPreparedException ex) {
      LOG.warning("ClassNotPreparedException: " + ex.getMessage());
      // there's a chance to add a breakpoint when the class is prepared
    } catch (ObjectCollectedException ex) {
      LOG.warning("ObjectCollectedException: " + ex.getMessage());
    } catch (InternalException ex) {
      LOG.error(ex);
    } catch (Exception ex) {
      LOG.error(ex);
    }
  }
}
