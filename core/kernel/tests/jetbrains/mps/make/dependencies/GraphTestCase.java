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

import jetbrains.mps.make.dependencies.IntGraph.IntVertex;
import jetbrains.mps.make.dependencies.graph.Graph;
import jetbrains.mps.make.dependencies.graph.Graphs;
import jetbrains.mps.make.dependencies.graph.IVertex;
import jetbrains.mps.util.GraphUtil;
import junit.framework.TestCase;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class GraphTestCase extends TestCase {
  private IntGraph myGraph;
  private static final int N = 6;

  @Override
  public void setUp() {
    myGraph = new IntGraph(N);
    myGraph.addEdges(0, 1, 2);
    myGraph.addEdges(1, 3);
    myGraph.addEdges(3, 2);
    myGraph.addEdges(4, 5);
  }

  public void testCreation1() {
    assertEquals("0 -> 1, 2\n" +
      "1 -> 3\n" +
      "2 -> \n" +
      "3 -> 2\n" +
      "4 -> 5\n" +
      "5 -> \n", myGraph.getGraph().toString());
  }

  public void testTranspose1() {
    Graph transposed = getTransposed(myGraph.getGraph());
    assertEquals("0 -> \n" +
      "1 -> 0\n" +
      "2 -> 0, 3\n" +
      "3 -> 1\n" +
      "4 -> \n" +
      "5 -> 4\n", transposed.toString());
  }

  public void testStronglyConnectedComponents1() {
    myGraph.addEdges(5, 0);
    List<List<IntVertex>> components = Graphs.findStronglyConnectedComponents(myGraph.getGraph());

    assertEquals(N, components.size());

    assertEquals(1, components.get(0).size());
    assertTrue(components.get(0).contains(new IntVertex(4)));

    assertEquals(1, components.get(1).size());
    assertTrue(components.get(1).contains(new IntVertex(5)));

    assertEquals(1, components.get(2).size());
    assertTrue(components.get(2).contains(new IntVertex(0)));

    assertEquals(1, components.get(3).size());
    assertTrue(components.get(3).contains(new IntVertex(1)));

    assertEquals(1, components.get(4).size());
    assertTrue(components.get(4).contains(new IntVertex(3)));

    assertEquals(1, components.get(5).size());
    assertTrue(components.get(5).contains(new IntVertex(2)));
  }

  public void testStronglyConnectedComponents2() {
    myGraph.addEdges(5, 4);
    myGraph.addEdges(4, 0);
    myGraph.addEdges(2, 0);
    List<List<Integer>> components = Graphs.findStronglyConnectedComponents(myGraph.getGraph());

    assertEquals(2, components.size());

    assertEquals(2, components.get(0).size());
    assertEquals(N - 2, components.get(1).size());

    assertTrue(components.get(0).contains(new IntVertex(5)));
    assertTrue(components.get(0).contains(new IntVertex(4)));
    assertTrue(components.get(1).contains(new IntVertex(0)));
    assertTrue(components.get(1).contains(new IntVertex(1)));
    assertTrue(components.get(1).contains(new IntVertex(2)));
    assertTrue(components.get(1).contains(new IntVertex(3)));
  }

  public <V extends IVertex> Graph<VertexDecorator<V>> getTransposed(Graph<V> graph0) {
    IVertex[] vertices = graph0.getData().toArray(new IVertex[graph0.getNVertexes()]);
    int[][] graph = Graphs.graphToIntInt(vertices);
    int[][] transposed = GraphUtil.transpose(graph);

    Graph result = new Graph();
    VertexDecorator<V>[] vertices_ = new VertexDecorator[vertices.length];
    for(int i = 0; i < vertices.length; i++) {
      vertices_[i] = new VertexDecorator<V>((V) vertices[i]);
      result.add(vertices_[i]);
    }

    for(int i = 0; i < vertices.length; i++) {
      for(int t : transposed[i]) {
        vertices_[i].addNext(vertices_[t]);
      }
    }
    return result;
  }

  public static class VertexDecorator<V extends IVertex> implements IVertex, Comparable<VertexDecorator<V>> {
    private final V myVertex;
    private final Set<VertexDecorator<V>> myNext = new LinkedHashSet<VertexDecorator<V>>();

    public VertexDecorator(V vertex) {
      myVertex = vertex;
    }

    private void addNext(VertexDecorator v) {
      myNext.add(v);
    }

    public Set<VertexDecorator<V>> getNexts() {
      return Collections.unmodifiableSet(myNext);
    }

    public V getVertex() {
      return myVertex;
    }

    @Override
    public String toString() {
      return myVertex.toString();
    }

    public boolean equals(Object obj) {
      if (obj instanceof VertexDecorator) {
        return myVertex.equals(((VertexDecorator) obj).getVertex());
      }
      return false;
    }

    public int hashCode() {
      return myVertex.hashCode();
    }

    public int compareTo(VertexDecorator<V> o) {
      return ((Comparable<V>) myVertex).compareTo(o.getVertex());
    }
  }
}
