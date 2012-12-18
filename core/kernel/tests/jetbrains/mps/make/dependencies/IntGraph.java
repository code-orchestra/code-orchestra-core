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
package jetbrains.mps.make.dependencies;

import jetbrains.mps.make.dependencies.graph.Graph;
import jetbrains.mps.make.dependencies.graph.IVertex;

import java.util.*;

public class IntGraph {

  private final Graph myGraph = new Graph();
  private final IntVertex[] myVertexes;

  public IntGraph(int n) {
    myVertexes = new IntVertex[n];
    for (int i = 0; i < n; i++) {
      myVertexes[i] = new IntVertex(i);
      myGraph.add(myVertexes[i]);
    }
  }

  public void addEdges(int from, int... to) {
    for (int i = 0; i < to.length; i++) {
      myVertexes[from].myNext.add(myVertexes[to[i]]);
    }
  }

  public static class IntVertex implements IVertex, Comparable<IntVertex> {

    private final Set<IntVertex> myNext = new TreeSet<IntVertex>();
    private final Integer myID;

    public Integer getID() {
      return myID;
    }

    public IntVertex(Integer id) {
      myID = id;
    }

    public Set<IntVertex> getNexts() {
      return Collections.unmodifiableSet(myNext);
    }

    public int compareTo(IntVertex o) {
      return myID.compareTo(o.myID);
    }

    public boolean equals(Object obj) {
      if (obj instanceof IntVertex) {
        return ((IntVertex) obj).myID.equals(myID);
      }
      return super.equals(obj);    //To change body of overridden methods use File | Settings | File Templates.
    }

    public int hashCode() {
      return myID.hashCode();    //To change body of overridden methods use File | Settings | File Templates.
    }

    @Override
    public String toString() {
      return "" + myID;    //To change body of overridden methods use File | Settings | File Templates.
    }
  }

  public Graph getGraph() {
    return myGraph;
  }
}
