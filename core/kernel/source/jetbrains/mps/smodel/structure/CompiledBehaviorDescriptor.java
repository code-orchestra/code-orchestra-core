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

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class CompiledBehaviorDescriptor extends BehaviorDescriptor {
  private Map<String, Method> methods;
  private final Object lock = new Object();

  private Method getMethod(String methodName, Class[] parametersTypes) {
    if (methods != null && methods.containsKey(methodName)) {
      return methods.get(methodName);
    }

    synchronized (lock) {
      if (methods == null) {
        methods = new ConcurrentHashMap<String, Method>();
      }

      Method method;
      try {
        method = this.getClass().getMethod(methodName, parametersTypes);
      } catch (NoSuchMethodException e) {
        throw new RuntimeException(e);
      }

      methods.put(methodName, method);

      return method;
    }
  }

  @Override
  public <T> T invoke(Class<T> returnType, SNode node, String methodName, Class[] parametersTypes, Object... parameters) {
    if (node == null) {
      return defaultValue(returnType);
    }

    if (methodName.startsWith("virtual_")) {
      Object[] params = new Object[parameters.length + 1];
      params[0] = node;
      System.arraycopy(parameters, 0, params, 1, parameters.length);

      try {
        return (T) getMethod(methodName, parametersTypes).invoke(this, params);
      } catch (IllegalAccessException e) {
        throw new RuntimeException(e);
      } catch (InvocationTargetException e) {
        throw new RuntimeException(e);
      }
    } else {
      return super.invoke(returnType, node, methodName, parametersTypes, parameters);
    }
  }
}
