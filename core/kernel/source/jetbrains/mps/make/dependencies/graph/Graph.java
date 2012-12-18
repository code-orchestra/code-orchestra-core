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
package jetbrains.mps.make.dependencies.graph;

import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

public class Graph<V extends IVertex> {
  private static final Logger LOG = Logger.getLogger(Graph.class);
  private final Set<V> myData = new LinkedHashSet<V>();

  public Graph() {
  }

  public void add(@NotNull V vertex) {
    myData.add(vertex);
    for (IVertex next : vertex.getNexts()) {
      if (next == null) {
        LOG.error("Next of vertex " + vertex + " is null.");
      } else if (!myData.contains((V) next)) {
        add((V) next);
      }
    }
  }

  public int getNVertexes() {
    return myData.size();
  }

  public Set<V> getData() {
    return Collections.unmodifiableSet(myData);
  }

  @Override
  public String toString() {
    StringBuffer sb = new StringBuffer();

    for (V vertex : myData) {
      sb.append(vertex);
      sb.append(" -> ");
      int j = 0;
      Set<? extends IVertex> nexts = vertex.getNexts();
      for (IVertex next : nexts) {
        sb.append(next);
        if (j < nexts.size() - 1) {
          sb.append(", ");
        }
        j++;
      }
      sb.append("\n");
    }

    return sb.toString();
  }

}
