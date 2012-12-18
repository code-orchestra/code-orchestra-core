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
package jetbrains.mps.lang.actions;

import jetbrains.mps.smodel.IOperationContext;

import java.util.Map;
import java.util.HashMap;

public class SmartActionContext {
  private IOperationContext myOperationContext;
  private Map<String, Object[]> myMap = new HashMap<String, Object[]>();

  public SmartActionContext(IOperationContext operationContext) {
    myOperationContext = operationContext;
  }

  public IOperationContext getOperationContext() {
    return myOperationContext;
  }

  public Object[] get(String key) {
    Object[] objects = myMap.get(key);
    if (objects == null) {
      objects = new Object[1];
      myMap.put(key, objects);
    }
    return objects;
  }
}
