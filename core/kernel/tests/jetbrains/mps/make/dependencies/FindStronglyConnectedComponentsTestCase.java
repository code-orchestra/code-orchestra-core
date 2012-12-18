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
import jetbrains.mps.make.dependencies.graph.Graphs;
import jetbrains.mps.make.dependencies.graph.IVertex;

import java.util.*;

import org.junit.Test;
import org.junit.Assert;

public class FindStronglyConnectedComponentsTestCase {
  @Test
  public void oneItem() {
    IntGraph g = new IntGraph(2);
    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(1)), Arrays.asList(new IntVertex(0))),
      condensation);
  }

  @Test
  public void dependencyWithoutCycle() {
    IntGraph g = new IntGraph(2);
    g.addEdges(1, 0);

    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(1)), Arrays.asList(new IntVertex(0))),
      condensation);
  }

  @Test
  public void dependencyWithoutCycleOtherWay() {
    IntGraph g = new IntGraph(2);
    g.addEdges(0, 1);

    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(0)), Arrays.asList(new IntVertex(1))),
      condensation);
  }

  @Test
  public void cycle() {
    IntGraph g = new IntGraph(2);
    g.addEdges(0, 1);
    g.addEdges(1, 0);

    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(0), new IntVertex(1))),
      condensation);
  }

  @Test
  public void moduleWithTwoDependents() {
    IntGraph g = new IntGraph(3);
    g.addEdges(1, 0);
    g.addEdges(2, 0);

    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(2)), Arrays.asList(new IntVertex(1)), Arrays.asList(new IntVertex(0))),
      condensation);
  }


  @Test
  public void cycleWhichContainsCrossEdges() {
    IntGraph g = new IntGraph(3);
    g.addEdges(0, 1);
    g.addEdges(0, 2);
    g.addEdges(2, 1);
    g.addEdges(1, 0);

    List<List<IVertex>> condensation = Graphs.findStronglyConnectedComponents(g.getGraph());
    Assert.assertEquals(
      Arrays.asList(Arrays.asList(new IntVertex(0), new IntVertex(1), new IntVertex(2))),
      condensation);
  }
}
