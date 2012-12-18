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

import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;

public class BreakpointInfo {
  public String myModelReference;
  public String myNodeId;
  public long myCreationTime = -1;
  public boolean myIsEnabled;

  public BreakpointInfo(IBreakpoint breakpoint, BreakpointLocation location) {
    myModelReference = location.getModelReference().toString();
    myNodeId = location.getNodePointer().getNodeId().toString();
    myCreationTime = breakpoint.getCreationTime();
    myIsEnabled = breakpoint.isEnabled();
  }

  public BreakpointInfo() {
  }

  public void initBreakpoint(IBreakpoint breakpoint) {
    breakpoint.setCreationTime(myCreationTime);
    breakpoint.setEnabled(myIsEnabled);
  }

  public boolean isValid() {
    return myModelReference != null && !myModelReference.isEmpty() && myNodeId != null && !myNodeId.isEmpty();
  }
}
