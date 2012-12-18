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
package jetbrains.mps.debug.runtime.java.programState.watchables;

import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import jetbrains.mps.debug.runtime.java.programState.JavaWatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaObjectValue;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

public class JavaExceptionWatchable extends JavaBreakpointWatchable {
  private final ObjectReference myException;

  public JavaExceptionWatchable(ObjectReference exception, String classFQName, ThreadReference threadReference) {
    super(classFQName, threadReference);
    myException = exception;
  }

  @Override
  public String getName() {
    return "exception";
  }

  @Override
  public WatchablesCategory getCategory() {
    return JavaWatchablesCategory.THROWN_EXCEPTION;
  }

  @Override
  public IValue getValue() {
    return new JavaObjectValue(myException, myClassFQName, myThreadReference);
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.EXCEPTION_BREAKPOINT;
  }

  @Override
  public SNode getNode() {
    return null;
  }
}
