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
package jetbrains.mps.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Stack;

/**
 * <code>int[][] graph;</code> defines an oriented graph of {graph.length} vertices, where
 * graph[i] is an array of edges from vertex i (Adjacency list)
 * <p/>
 * Evgeny Gryaznov, Jan 11, 2010
 */
public class GraphUtil {

  public static int[] setToList(int[] set) {
    int size = 0;
    for (int i = 0; i < set.length; i++) {
      if (set[i] == 1) {
        size++;
      }
    }
    int[] res = new int[size];
    int e = 0;
    for (int i = 0; i < set.length; i++) {
      if (set[i] == 1) {
        res[e++] = i;
      }
    }
    return res;
  }

  public static int[][] removeOrientation(int[][] graph) {
    return merge(transpose(graph), graph);
  }

  public static int[][] transpose(int[][] graph) {
    int count = graph.length;
    int[] size = new int[count];
    Arrays.fill(size, 0);
    for (int vertex = 0; vertex < count; vertex++) {
      for (int target : graph[vertex]) {
        size[target]++;
      }
    }

    int[][] result = new int[count][];
    for (int vertex = 0; vertex < count; vertex++) {
      result[vertex] = new int[size[vertex]];
      size[vertex] = 0;
    }
    for (int vertex = 0; vertex < count; vertex++) {
      for (int target : graph[vertex]) {
        result[target][size[target]++] = vertex;
      }
    }
    return result;
  }

  public static int[][] merge(int[][] graph1, int[][] graph2) {
    int count = graph1.length;
    int[] data = new int[count];
    int[][] result = new int[count][];

    for (int vertex = 0; vertex < count; vertex++) {
      int size = mergeSortedArrays(data, graph1[vertex], graph2[vertex]);
      result[vertex] = new int[size];
      System.arraycopy(data, 0, result[vertex], 0, size);
    }
    return result;
  }

  private static int mergeSortedArrays(int[] target, int[] source1, int[] source2) {
    int size = 0, i1 = 0, i2 = 0;
    while (i1 < source1.length && i2 < source2.length) {
      if (source1[i1] < source2[i2]) {
        target[size++] = source1[i1++];
      } else if (source1[i1] > source2[i2]) {
        target[size++] = source2[i2++];
      } else {
        target[size++] = source1[i1];
        i1++;
        i2++;
      }
    }
    while (i1 < source1.length) {
      target[size++] = source1[i1++];
    }
    while (i2 < source2.length) {
      target[size++] = source2[i2++];
    }
    return size;
  }

  public static int[][] components(int[][] graph) {
    int count = graph.length;
    List<int[]> result = new ArrayList<int[]>();

    if (count < 2) {
      if (count == 1) {
        result.add(new int[]{0});
      }
      return result.toArray(new int[result.size()][]);
    }

    int[] component = new int[count];

    int[] state = new int[count];
    Arrays.fill(state, 0);
    Stack<Integer> stack = new Stack<Integer>();
    int nextVertex = 0;

    while (nextVertex < count) {
      int componentSize = 0;
      stack.add(nextVertex);
      state[nextVertex] = 1;
      nextVertex++;
      while (!stack.isEmpty()) {
        int current = stack.pop();
        component[componentSize++] = current;
        for (int target : graph[current]) {
          if (state[target] == 0) {
            state[target] = 1;
            stack.push(target);
          }
        }
      }
      int[] res = new int[componentSize];
      System.arraycopy(component, 0, res, 0, componentSize);
      result.add(res);

      while (nextVertex < count && state[nextVertex] != 0) {
        nextVertex++;
      }
    }
    return result.toArray(new int[result.size()][]);
  }

  private static class Tarjan {

    List<int[]> result = new ArrayList<int[]>();
    int[] stack;
    int[] index;
    int[] lowlink;
    int[][] graph;
    boolean[] onstack;
    int current = 0;
    int stackTop = 0;

    public Tarjan(int[][] graph) {
      index = new int[graph.length];
      Arrays.fill(index, -1);
      lowlink = new int[graph.length];
      Arrays.fill(lowlink, 0);
      onstack = new boolean[graph.length];
      Arrays.fill(onstack, false);
      stack = new int[graph.length];
      this.graph = graph;
    }

    private int[][] run() {
      if (graph.length < 2) {
        if (graph.length == 1) {
          result.add(new int[]{0});
        }
        return result.toArray(new int[result.size()][]);
      }

      for (int v = 0; v < graph.length; v++) {
        if (index[v] == -1) {
          tarjan(v);
        }
      }
      return result.toArray(new int[result.size()][]);
    }

    private void tarjan(int v) {
      index[v] = current;
      lowlink[v] = current;
      current++;
      stack[stackTop++] = v;
      onstack[v] = true;
      for (int vt : graph[v]) {
        if (index[vt] == -1) {
          tarjan(vt);
          lowlink[v] = Math.min(lowlink[v], lowlink[vt]);
        } else if (onstack[vt]) {
          lowlink[v] = Math.min(lowlink[v], index[vt]);
        }
      }
      if (lowlink[v] == index[v]) {
        int stackSize = stackTop;
        do {
          stackTop--;
          onstack[stack[stackTop]] = false;
        } while (stack[stackTop] != v);
        int[] res = new int[stackSize - stackTop];
        System.arraycopy(stack, stackTop, res, 0, stackSize - stackTop);
        result.add(res);
      }
    }
  }

  public static int[][] tarjan(int[][] graph) {
    return new Tarjan(graph).run();
  }

  public static void printGraph(int[][] graph, Object[] associated) {
    for (int v = 0; v < graph.length; v++) {
      System.out.println(v + " (" + (associated != null ? associated[v] : "?") + ")");
      System.out.print("     ");
      for (int i : graph[v]) {
        System.out.print(" ");
        System.out.print(i);
      }
      System.out.println();
    }
  }
}
