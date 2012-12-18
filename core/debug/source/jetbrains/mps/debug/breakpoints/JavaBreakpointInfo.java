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

import jetbrains.mps.debug.api.BreakpointInfo;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;

public class JavaBreakpointInfo extends BreakpointInfo {
  public int mySuspendPolicy;
  public boolean myIsLogMessage;

  public JavaBreakpointInfo(JavaBreakpoint breakpoint, BreakpointLocation location) {
    super(breakpoint, location);
    mySuspendPolicy = breakpoint.getSuspendPolicy();
    myIsLogMessage = breakpoint.isLogMessage();
  }

  public JavaBreakpointInfo() {
  }

  public void initBreakpoint(JavaBreakpoint breakpoint) {
    super.initBreakpoint(breakpoint);
    breakpoint.setSuspendPolicy(mySuspendPolicy);
    breakpoint.setLogMessage(myIsLogMessage);
  }
}
