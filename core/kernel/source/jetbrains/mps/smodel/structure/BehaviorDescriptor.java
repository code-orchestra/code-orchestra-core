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
package jetbrains.mps.smodel.structure;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.behaviour.OldBehaviorManager;

import java.util.HashMap;
import java.util.Map;

public abstract class BehaviorDescriptor {
  private static final Map<Class, Object> OUR_DEFAULT_VALUE = new HashMap<Class, Object>();

  static {
    OUR_DEFAULT_VALUE.put(Byte.class, (byte) 0);
    OUR_DEFAULT_VALUE.put(Short.class, (short) 0);
    OUR_DEFAULT_VALUE.put(Integer.class, (int) 0);
    OUR_DEFAULT_VALUE.put(Long.class, (long) 0);
    OUR_DEFAULT_VALUE.put(Float.class, (float) 0);
    OUR_DEFAULT_VALUE.put(Double.class, (double) 0);
    OUR_DEFAULT_VALUE.put(Boolean.class, false);
    OUR_DEFAULT_VALUE.put(Void.class, null);
  }

  public static <T> T defaultValue(Class<T> returnValueClass) {
    if (OUR_DEFAULT_VALUE.containsKey(returnValueClass)) {
      return (T) OUR_DEFAULT_VALUE.get(returnValueClass);
    } else {
      return null;
    }
  }

  public void initNode(SNode node) {
    if (node == null) {
      throw new IllegalArgumentException("initNode on null node");
    } else {
      OldBehaviorManager.getInstance().initNode(node);
    }
  }

  public <T> T invoke(Class<T> returnType, SNode node, String methodName, Class[] parametersTypes, Object... parameters) {
    return node == null ? defaultValue(returnType) : OldBehaviorManager.getInstance().invoke(returnType, node, methodName, parametersTypes, parameters);
  }

  public <T> T invokeSuper(Class<T> returnType, SNode node, String callerConceptFqName, String methodName, Class[] parametersTypes, Object... parameters) {
    return node == null ? defaultValue(returnType) : OldBehaviorManager.getInstance().invokeSuper(returnType, node, callerConceptFqName, methodName, parametersTypes, parameters);
  }
}
