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

import com.sun.jdi.Field;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import jetbrains.mps.debug.runtime.java.programState.JavaWatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaValue;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.List;

public class JavaWatchpointWatchable extends JavaBreakpointWatchable {
  private final Field myField;
  private final JavaValue myCurrentValue;
  private final JavaValue myNewValue;
  private final boolean myAccess;

  public JavaWatchpointWatchable(Field field, Value currentValue, Value newValue, String classFqName, ThreadReference threadReference) {
    super(classFqName, threadReference);
    myField = field;
    myCurrentValue = JavaValue.fromJDIValue(currentValue, myClassFQName, threadReference);
    myNewValue = JavaValue.fromJDIValue(newValue, myClassFQName, threadReference);
    myAccess = false;
  }

  public JavaWatchpointWatchable(Field field, Value currentValue, String classFqName, ThreadReference threadReference) {
    super(classFqName, threadReference);
    myField = field;
    myCurrentValue = JavaValue.fromJDIValue(currentValue, myClassFQName, threadReference);
    myNewValue = null;
    myAccess = true;
  }

  @Override
  public String getName() {
    return "field watchpoint";
  }

  @Override
  public WatchablesCategory getCategory() {
    return JavaWatchablesCategory.FIELD_WATCHPOINT;
  }

  @Override
  public IValue getValue() {
    return new FieldWatchpointValue();
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.VARIABLE_OBJECT;
  }

  @Override
  public SNode getNode() {
    return null;
  }

  private class FieldWatchpointValue implements IValue {
    @Override
    public String getValuePresentation() {
      return myField.name();
    }

    @Override
    public Icon getPresentationIcon() {
      return Icons.FIELD_BREAKPOINT;
    }

    @Override
    public boolean isStructure() {
      return true;
    }

    @Override
    public List<IWatchable> getSubvalues() {
      List<IWatchable> result = new ArrayList<IWatchable>();
      result.add(new JavaWatchpointValue(myCurrentValue, true, myClassFQName, myThreadReference));
      if (!myAccess) {
        result.add(new JavaWatchpointValue(myNewValue, false, myClassFQName, myThreadReference));
      }
      return result;
    }
  }
}
