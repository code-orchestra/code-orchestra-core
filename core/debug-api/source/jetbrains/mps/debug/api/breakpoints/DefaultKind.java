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

import jetbrains.mps.debug.api.AbstractMPSBreakpoint;
import jetbrains.mps.util.annotation.ToRemove;

@Deprecated
@ToRemove(version = 2.0)
public final class DefaultKind implements IBreakpointKind<AbstractMPSBreakpoint> {
  private static final DefaultKind myInstance = new DefaultKind();

  public static DefaultKind getInstance() {
    return myInstance;
  }

  private DefaultKind(){}

  @Override
  public boolean supportsDisable() {
    return true;
  }

  @Override
  public String getName() {
    return "MPSLegacyBreakpoint";
  }

  @Override
  public String getPresentation() {
    return "Breakpoint";
  }
}
