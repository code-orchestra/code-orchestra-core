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

import com.sun.jdi.Method;
import com.sun.jdi.ThreadReference;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import jetbrains.mps.debug.runtime.java.programState.JavaWatchablesCategory;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;
import java.util.Collections;
import java.util.List;

public class JavaMethodWatchable extends JavaBreakpointWatchable {
  private final Method myMethod;
  private final boolean myIsEnter;

  public JavaMethodWatchable(Method method, boolean enter, String classFQName, ThreadReference threadReference) {
    super(classFQName, threadReference);
    myMethod = method;
    myIsEnter = enter;
  }

  @Override
  public String getName() {
    return (myIsEnter ? "entered method" : "exited method" );
  }

  @Override
  public WatchablesCategory getCategory() {
    return JavaWatchablesCategory.METHOD;
  }

  @Override
  public IValue getValue() {
    return new JavaMethodValue();
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.METHOD_BREAKPOINT;
  }

  @Override
  public SNode getNode() {
    // todo from location???
    return null;
  }

  private class JavaMethodValue implements IValue {
    @Override
    public String getValuePresentation() {
      return myMethod.declaringType().name() + "." + myMethod.name();
    }

    @Override
    public Icon getPresentationIcon() {
      return Icons.METHOD_BREAKPOINT;
    }

    @Override
    public boolean isStructure() {
      return false;
    }

    @Override
    public List<IWatchable> getSubvalues() {
      return Collections.emptyList();
    }
  }
}
