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

import jetbrains.mps.debug.api.breakpoints.IBreakpointKind;
import org.jetbrains.annotations.NonNls;

public enum JavaBreakpointKind implements IBreakpointKind<JavaBreakpoint> {
  LINE_BREAKPOINT("Java Line Breakpoint"),
  EXCEPTION_BREAKPOINT("Java Exception Breakpoint"),
  METHOD_BREAKPOINT("Java Method Breakpoint"),
  FIELD_BREAKPOINT("Java Field Breakpoint");
  private static final String LANGUAGE_PREFIX = "JAVA_";
  private final String myPresentation;

  JavaBreakpointKind(String presentation) {
    myPresentation = presentation;
  }

  @Override
  public boolean supportsDisable() {
    return true;
  }

  @Override
  public String getName() {
    return LANGUAGE_PREFIX + toString(); // presentations should be unique
  }

  @Override
  @NonNls
  public String getPresentation() {
    return myPresentation;
  }
}
