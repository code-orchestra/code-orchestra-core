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
import com.sun.jdi.event.LocatableEvent;
import com.sun.jdi.request.ExceptionRequest;
import jetbrains.mps.debug.breakpoints.JavaBreakpoint;
import jetbrains.mps.debug.breakpoints.JavaBreakpointKind;
import jetbrains.mps.debug.runtime.DebugVMEventsProcessor;
import jetbrains.mps.debug.runtime.RequestManager;
import jetbrains.mps.debug.runtime.SuspendContextCommand;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

public class ExceptionBreakpoint extends JavaBreakpoint {
  private static final Logger LOG = Logger.getLogger(ExceptionBreakpoint.class);
  private final String myExceptionName;

  public ExceptionBreakpoint(String exceptionName, Project project) {
    super(project);
    myExceptionName = exceptionName;
  }

  @Override
  protected String getClassNameToPrepare() {
    return myExceptionName;
  }

  @Override
  protected void createRequestForPreparedClass(DebugVMEventsProcessor debugProcess, ReferenceType classType) {
    RequestManager requestManager = debugProcess.getRequestManager();

    try {
      ExceptionRequest request = requestManager.createExceptionRequest(this, classType);
      requestManager.enableRequest(request);
    } catch (ClassNotPreparedException ex) {
      LOG.warning("ClassNotPreparedException: " + ex.getMessage());
      // there's a chance to add a breakpoint when the class is prepared
    } catch (ObjectCollectedException ex) {
      LOG.warning("ObjectCollectedException: " + ex.getMessage());
      // there's a chance to add a breakpoint when the class is prepared
    } catch (InternalException ex) {
      LOG.error(ex);
    } catch (Exception ex) {
      LOG.error(ex);
    }
  }

  @Override
  public boolean processLocatableEvent(SuspendContextCommand action, LocatableEvent event) {
    return true;
  }

  @NotNull
  @Override
  public JavaBreakpointKind getKind() {
    return JavaBreakpointKind.EXCEPTION_BREAKPOINT;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  @Override
  public String getPresentation() {
    return myExceptionName;
  }

  public static class ExceptionBreakpointInfo {
    public String myExceptionName;
    public long myCreationTime;
    public int mySuspendPolicy;
    public boolean myIsLogMessage;
    public boolean myIsEnabled;

    public ExceptionBreakpointInfo(ExceptionBreakpoint breakpoint) {
      myExceptionName = breakpoint.myExceptionName;
      myCreationTime = breakpoint.myCreationTime;
      myIsEnabled = breakpoint.isEnabled();
      mySuspendPolicy = breakpoint.getSuspendPolicy();
      myIsLogMessage = breakpoint.isLogMessage();
    }

    public ExceptionBreakpointInfo() {
    }

    public void initBreakpoint(ExceptionBreakpoint breakpoint) {
      breakpoint.setEnabled(myIsEnabled);
      breakpoint.setCreationTime(myCreationTime);
      breakpoint.setSuspendPolicy(mySuspendPolicy);
      breakpoint.setLogMessage(myIsLogMessage);
    }
  }
}
