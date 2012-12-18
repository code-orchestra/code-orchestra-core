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
package jetbrains.mps.debug.runtime.java.programState.proxies;

import com.sun.jdi.*;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.evaluation.EvaluationException;
import jetbrains.mps.debug.evaluation.EvaluationUtils;
import jetbrains.mps.debug.evaluation.InvalidEvaluatedExpressionException;
import jetbrains.mps.debug.evaluation.proxies.IObjectValueProxy;
import jetbrains.mps.debug.evaluation.proxies.MirrorUtil;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import jetbrains.mps.debug.runtime.java.programState.watchables.JavaField;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 19.06.2010
 * Time: 16:51:12
 * To change this template use File | Settings | File Templates.
 */
public class JavaObjectValue extends JavaValue {
  public JavaObjectValue(Value value, String classFQname, ThreadReference threadReference) {
    super(value, classFQname, threadReference);
  }

  @Override
  public List<IWatchable> getSubvalues() {
    List<IWatchable> watchables = new ArrayList<IWatchable>();
    ObjectReference ref = (ObjectReference) myValue;
    if (ref != null) {
      List<Field> fieldList = ref.referenceType().allFields();
      Collections.sort(fieldList, new Comparator<Field>() {
        @Override
        public int compare(Field o1, Field o2) {
          return o1.name().compareTo(o2.name());
        }
      });
      for (Field f : fieldList) {
        watchables.add(new JavaField(f, ref, myClassFQName, myThreadReference));
      }
    }
    return watchables;
  }

  @Override
  public Icon getPresentationIcon() {
    return Icons.VARIABLE_OBJECT;
  }

  @Override
  public boolean isStructure() {
    return true;
  }

  @Override
  public String getValuePresentation() {
    return ("{" + myValue.type().name() + "} ") + myValue.toString();
  }

  @Nullable
  public JavaValue getFieldValue(String fieldName) {
    try {
      ObjectReference ref = (ObjectReference) myValue;
      Field field = EvaluationUtils.findField((ClassType) ref.referenceType(), fieldName);
      return JavaValue.fromJDIValueRaw(ref.getValue(field), myClassFQName, myThreadReference);
    } catch (InvalidEvaluatedExpressionException e) {
      // we get NPE instead
      return null;
    }
  }

  public List<JavaValue> getFieldValues() {
    ObjectReference ref = (ObjectReference) myValue;
    List<Field> fieldList = ref.referenceType().fields();
    List<JavaValue> result = new ArrayList<JavaValue>();
    for (Field f : fieldList) {
      result.add(JavaValue.fromJDIValueRaw(ref.getValue(f), myClassFQName, myThreadReference));
    }
    return result;
  }

  @NotNull
  private IObjectValueProxy createValueProxy() {
    return (IObjectValueProxy) MirrorUtil.getValueProxy(myValue, myThreadReference);
  }

  @Nullable
  public JavaValue executeMethod(String methodName, String jniSignature, Object... args) {
    try {
      return JavaValue.fromJDIValueRaw(createValueProxy().invokeMethod(methodName, jniSignature, args).getJDIValue(), myClassFQName, myThreadReference);
    } catch (EvaluationException e) {
      return null;
    }
  }

  public String getClassFqName() {
    return ((ObjectReference) myValue).referenceType().name();
  }

  public String getClassName() {
    return NameUtil.shortNameFromLongName(getClassFqName());
  }

  public boolean isInstanceOf(String className) {
    try {
      return createValueProxy().isInstanceOf("L" + className + ";");
    } catch (EvaluationException e) {
      return false;
    }
  }
}
