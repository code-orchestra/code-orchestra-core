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
package jetbrains.mps.util.graph;

import java.util.HashMap;
import java.util.Map;

public class Edge implements IEdge {
  IVertex myFirst;
  IVertex mySecond;
  private Map myUserObjects = new HashMap();

  public Edge(IVertex first, IVertex second) {
    myFirst = first;
    mySecond = second;
    first.addEdge(this);
    second.addEdge(this);
  }

  public IVertex getFirst() {
    return myFirst;
  }

  public IVertex getSecond() {
    return mySecond;
  }

  public Object getUserObject(Object key) {
    return myUserObjects.get(key);
  }

  public void putUserObject(Object key, Object value) {
    myUserObjects.put(key, value);
  }
}
