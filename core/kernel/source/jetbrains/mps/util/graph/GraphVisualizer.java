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

import jetbrains.mps.util.Pair;

import java.awt.Color;
import java.awt.Graphics;

public class GraphVisualizer implements IGraphVisualizer {
  public static final int VERTEX_RADIUS = 8;

  public void paint(IGraph graph, Graphics g) {
    g.setColor(Color.black);

    for (IEdge edge : graph.getEdges()) {
      int x1 = (int) Math.round(edge.getFirst().getX());
      int y1 = (int) Math.round(edge.getFirst().getY());
      int x2 = (int) Math.round(edge.getSecond().getX());
      int y2 = (int) Math.round(edge.getSecond().getY());
      g.drawLine(x1, y1, x2, y2);
    }

    for (IVertex vertex : graph.getVertices()) {
      g.setColor(Color.white);
      int x = (int) Math.round(vertex.getX()) - VERTEX_RADIUS;
      int y = (int) Math.round(vertex.getY()) - VERTEX_RADIUS;
      g.fillOval(x, y, 2 * VERTEX_RADIUS, 2 * VERTEX_RADIUS);
      g.setColor(Color.black);
      g.drawString(vertex.getName(), x + 3, y + 2 * VERTEX_RADIUS);
    }

    Pair<Integer, Integer> baricenter = graph.getBaricenter();
    g.setColor(Color.red);
    Integer xb = baricenter.o1;
    Integer yb = baricenter.o2;
    g.fillOval(xb - 2, yb - 2, 4, 4);
  }

}
