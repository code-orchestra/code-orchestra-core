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
package codeOrchestra.actionScript.debugger.breakpoint;

import jetbrains.mps.debug.api.BreakpointInfo;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;

public class ASBreakpointInfo extends BreakpointInfo {
  public boolean myIsLogMessage;

  public ASBreakpointInfo(ASBreakpoint breakpoint, BreakpointLocation location) {
    super(breakpoint, location);
    myIsLogMessage = breakpoint.isLogMessage();
  }

  public ASBreakpointInfo() {
  }

  public void initBreakpoint(ASBreakpoint breakpoint) {
    super.initBreakpoint(breakpoint);
    breakpoint.setLogMessage(myIsLogMessage);
  }
}
