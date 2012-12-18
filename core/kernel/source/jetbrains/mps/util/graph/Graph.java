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

import java.awt.Rectangle;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Graph implements IGraph {
  Set<IEdge> myEdges = new HashSet<IEdge>();
  Set<IVertex> myVertices = new HashSet<IVertex>();
  Map<Pair<IVertex, IVertex>, IEdge> myVerticesToConnectingEdges = new HashMap<Pair<IVertex, IVertex>, IEdge>();

  public Set<IEdge> getEdges() {
    return new HashSet<IEdge>(myEdges);
  }

  public Set<IVertex> getVertices() {
    return new HashSet<IVertex>(myVertices);
  }

  public void addVertex(IVertex vertex) {
    myVertices.add(vertex);
  }

  public boolean connect(IVertex vertex1, IVertex vertex2) {
    return connect(vertex1, vertex2, null, null);
  }

  public boolean connect(IVertex vertex1, IVertex vertex2, Object key, Object userObject) {
    if (!myVertices.contains(vertex1)) return false;
    if (!myVertices.contains(vertex2)) return false;
    boolean connected = isConnected(vertex1, vertex2);
    IEdge connectingEdge;
    if (connected) return false;
    connectingEdge = new Edge(vertex1, vertex2);
    connectingEdge.putUserObject(key, userObject);
    myEdges.add(connectingEdge);
    myVerticesToConnectingEdges.put(new Pair<IVertex, IVertex>(vertex1, vertex2), connectingEdge);
    myVerticesToConnectingEdges.put(new Pair<IVertex, IVertex>(vertex2, vertex1), connectingEdge);
    return true;
  }

  public boolean isConnected(IVertex vertex1, IVertex vertex2) {
    IEdge connectingEdge = myVerticesToConnectingEdges.get(new Pair<IVertex, IVertex>(vertex1, vertex2));
    return connectingEdge != null;
  }


  public Pair<Integer, Integer> getBaricenter() {
    double x = 0;
    double y = 0;
    for (IVertex vertex : myVertices) {
      x = x + vertex.getX();
      y = y + vertex.getY();
    }
    int bcx = (int) x / myVertices.size();
    int bcy = (int) y / myVertices.size();
    return new Pair<Integer, Integer>(bcx, bcy);
  }

  public int getVerticesCount() {
    return myVertices.size();
  }

  public int getEdgesCount() {
    return myEdges.size();
  }

  public void move(int deltaX, int deltaY) {
    for (IVertex vertex : myVertices) {
      vertex.setCoords(vertex.getX() + deltaX, vertex.getY() + deltaY);
    }
  }

  public Rectangle getFramingRectangle() {
    double minx = 0;
    double miny = 0;
    double maxx = 0;
    double maxy = 0;
    boolean first = true;
    for (IVertex vertex : myVertices) {
      int halfWidth = vertex.getWidth() / 2;
      int halfHeight = vertex.getHeight() / 2;
      if (first) {
        minx = vertex.getX() - halfWidth;
        maxx = vertex.getX() + halfWidth;
        miny = vertex.getY() - halfHeight;
        maxy = vertex.getY() + halfHeight;
        first = false;
      } else {
        minx = Math.min(minx, vertex.getX() - halfWidth);
        maxx = Math.max(maxx, vertex.getX() + halfWidth);
        miny = Math.min(miny, vertex.getY() - halfHeight);
        maxy = Math.max(maxy, vertex.getY() + halfWidth);
      }
    }
    int x = (int) Math.round(minx);
    int y = (int) Math.round(miny);
    int width = (int) Math.round(maxx - minx);
    int height = (int) Math.round(maxy - miny);
    return new Rectangle(x, y, width, height);
  }

  public void setUpperLeftCorner(int x, int y) {
    Rectangle rect = getFramingRectangle();
    move(x - rect.x, y - rect.y);
  }
}
