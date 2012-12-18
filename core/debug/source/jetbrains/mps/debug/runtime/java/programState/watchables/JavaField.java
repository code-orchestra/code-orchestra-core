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
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.api.programState.WatchablesCategory;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaValue;
import jetbrains.mps.debug.runtime.java.programState.proxies.ProxyForJava;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;

public class JavaField extends JavaBreakpointWatchable implements IWatchable {
  private static Logger LOG = Logger.getLogger(ProxyForJava.class);

  private final Field myField;
  private final ObjectReference myParent;
  private JavaValue myCachedValue;

  public JavaField(Field field, ObjectReference parent, String classFqName, ThreadReference threadReference) {
    super(classFqName, threadReference);
    myField = field;
    myParent = parent;
    myCachedValue = JavaValue.fromJDIValue(myParent.getValue(myField), classFqName, threadReference);
  }

  public Field getField() {
    return myField;
  }

  @Override
  public String getName() {
    String name = myField.name();
    if (myField.isStatic() && !myField.declaringType().name().equals(myParent.referenceType().name())) {
      name = name + " (" + myField.declaringType().name() + ")";
    }
    return name;
  }

  @Override
  public IValue getValue() {
    return myCachedValue;
  }

  @Override
  public Icon getPresentationIcon() {
    return getValue().getPresentationIcon();
  }

  @Override
  public SNode getNode() {
    return null;
  }

  @Override
  public WatchablesCategory getCategory() {
    return WatchablesCategory.NONE;
  }
}
