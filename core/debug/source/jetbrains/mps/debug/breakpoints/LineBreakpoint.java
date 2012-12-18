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
package jetbrains.mps.debug.breakpoints;

import com.intellij.openapi.project.Project;
import com.sun.jdi.*;
import com.sun.jdi.event.LocatableEvent;
import com.sun.jdi.request.BreakpointRequest;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.debug.runtime.DebugVMEventsProcessor;
import jetbrains.mps.debug.runtime.RequestManager;
import jetbrains.mps.debug.runtime.SuspendContextCommand;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class LineBreakpoint extends JavaBreakpoint implements ILocationBreakpoint {
  private static final Logger LOG = Logger.getLogger(LineBreakpoint.class);
  protected final BreakpointLocation myLocation;

  public LineBreakpoint(@NotNull SNodePointer nodePointer, Project project) {
    super(project);
    myLocation = new BreakpointLocation(nodePointer);
  }

  public LineBreakpoint(@NotNull SNode node, Project project) {
    this(new SNodePointer(node), project);
  }

  @Override
  protected void createRequestForPreparedClass(DebugVMEventsProcessor debugProcess, final ReferenceType classType) {
    RequestManager requestManager = debugProcess.getRequestManager();

    try {
      int lineIndex = myLocation.getLineIndexInFile();
      List<Location> locs = classType.locationsOfLine(lineIndex);
      if (locs.size() > 0) {
        for (final Location location : locs) {
          BreakpointRequest request = requestManager.createBreakpointRequest(this, location);
          requestManager.enableRequest(request);
        }
      } else {
        // there's no executable code in this class
        requestManager.setInvalid(this, "no executable code found");
        String message = "No locations of type " + classType.name() + " found at line " + myLocation.getLineIndexInFile();
        LOG.warning(message);
      }
    } catch (ClassNotPreparedException ex) {
      LOG.warning("ClassNotPreparedException: " + ex.getMessage());
      // there's a chance to add a breakpoint when the class is prepared
    } catch (ObjectCollectedException ex) {
      LOG.warning("ObjectCollectedException: " + ex.getMessage());
      // there's a chance to add a breakpoint when the class is prepared
    } catch (InvalidLineNumberException ex) {
      requestManager.setInvalid(this, "no executable code found");
      LOG.warning("InvalidLineNumberException: " + ex.getMessage());
    } catch (InternalException ex) {
      LOG.error(ex);
    } catch (Exception ex) {
      LOG.error(ex);
    }
  }


  @Override
  //called when breakpoint is hit
  public boolean processLocatableEvent(SuspendContextCommand action, LocatableEvent event) {
    boolean result = super.processLocatableEvent(action, event);
    if (!result) return false;
//    try {
      //todo conditions - later
      /*  final EvaluationContextImpl evaluationContext = new EvaluationContextImpl(
        action.getSuspendContext(),
        frameProxy,
        getThisObject(context, event)
      );

      if(!evaluateCondition(evaluationContext, event)) {
        return false;
      }*/
      //todo here some expressions may be evaluated; later
      // runAction(evaluationContext, event);
//    } catch (IncompatibleThreadStateException ex) {
//      LOG.error(ex);
//      return false;
//    }
    return true;
  }

  protected String getClassNameToPrepare() {
    String className = myLocation.getTargetUnitName();

    if (className == null) {
      // todo when this case does actually happen?
      String fileName = myLocation.getFileName();
      if (fileName.endsWith(".java")) {
        fileName = fileName.substring(0, fileName.length() - ".java".length());
      }
      className = myLocation.getNodePointer().getModelReference().getLongName() + "." + fileName;
    }
    return className;
  }

  @NotNull
  @Override
  public JavaBreakpointKind getKind() {
    return JavaBreakpointKind.LINE_BREAKPOINT;
  }

  @Override
  public boolean isValid() {
    return myLocation.getTargetCodePosition() != null;
  }

  @Override
  public String getPresentation() {
    return myLocation.getPresentation();
  }

  @NotNull
  @Override
  public BreakpointLocation getLocation() {
    return myLocation;
  }
}
