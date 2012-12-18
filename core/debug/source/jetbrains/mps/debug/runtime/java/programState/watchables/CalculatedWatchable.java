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

import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.JavaWatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaValue;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public class CalculatedWatchable extends JavaBreakpointWatchable implements IWatchable {
  private final JavaValue myValue;
  private final String myName;

  public CalculatedWatchable(String name, Value value, @NotNull String classFqName, ThreadReference threadReference) {
    super(classFqName, threadReference);
    myName = name;
    myValue = JavaValue.fromJDIValue(value, myClassFQName, threadReference);
  }

  @Override
  public WatchablesCategory getCategory() {
    return JavaWatchablesCategory.CALCULATED_VALUE;
  }

  @Override
  public String getName() {
    return myName;
  }

  @Override
  public IValue getValue() {
    return myValue;
  }

  @Override
  public Icon getPresentationIcon() {
    return myValue.getPresentationIcon();
  }

  @Override
  public SNode getNode() {
    return null;
  }
}
