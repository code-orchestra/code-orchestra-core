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

public class GraphSamples {

  public static IGraph getMetan() {
    Graph result = new Graph();
    IVertex carbon = new Vertex(110, 110, "C");
    IVertex h1 = new Vertex(10, 110, "H");
    IVertex h2 = new Vertex(110, 210, "H");
    IVertex h3 = new Vertex(210, 110, "H");
    IVertex h4 = new Vertex(110, 10, "H");
    result.addVertex(carbon);
    result.addVertex(h1);
    result.addVertex(h2);
    result.addVertex(h3);
    result.addVertex(h4);
    result.connect(h1, carbon);
    result.connect(h2, carbon);
    result.connect(h3, carbon);
    result.connect(h4, carbon);
    return result;
  }

  public static IGraph getEtan() {
    Graph result = new Graph();
    IVertex c1 = new Vertex(110, 110, "C");
    IVertex c2 = new Vertex(110, 110, "C");
    IVertex h1 = new Vertex(10, 110, "H");
    IVertex h2 = new Vertex(110, 210, "H");
    IVertex h3 = new Vertex(210, 110, "H");
    IVertex h4 = new Vertex(110, 10, "H");
    IVertex h5 = new Vertex(110, 10, "H");
    IVertex h6 = new Vertex(110, 10, "H");
    result.addVertex(c1);
    result.addVertex(c2);
    result.addVertex(h1);
    result.addVertex(h2);
    result.addVertex(h3);
    result.addVertex(h4);
    result.addVertex(h5);
    result.addVertex(h6);
    result.connect(h1, c1);
    result.connect(h2, c1);
    result.connect(h3, c1);
    result.connect(h4, c2);
    result.connect(h5, c2);
    result.connect(h6, c2);
    result.connect(c1, c2);
    return result;
  }

  public static IGraph getPropan() {
    Graph result = new Graph();
    IVertex c1 = new Vertex(110, 110, "C");
    IVertex c2 = new Vertex(110, 110, "C");
    IVertex c3 = new Vertex(110, 110, "C");
    IVertex h1 = new Vertex(10, 110, "H");
    IVertex h2 = new Vertex(110, 210, "H");
    IVertex h3 = new Vertex(210, 110, "H");
    IVertex h4 = new Vertex(110, 10, "H");
    IVertex h5 = new Vertex(110, 10, "H");
    IVertex h6 = new Vertex(110, 10, "H");
    IVertex h7 = new Vertex(110, 10, "H");
    IVertex h8 = new Vertex(110, 10, "H");
    result.addVertex(c1);
    result.addVertex(c2);
    result.addVertex(c3);
    result.addVertex(h1);
    result.addVertex(h2);
    result.addVertex(h3);
    result.addVertex(h4);
    result.addVertex(h5);
    result.addVertex(h6);
    result.addVertex(h7);
    result.addVertex(h8);
    result.connect(h1, c1);
    result.connect(h2, c1);
    result.connect(h3, c1);
    result.connect(h4, c2);
    result.connect(h5, c2);
    result.connect(h6, c2);
    result.connect(c1, c3);
    result.connect(c3, c2);
    result.connect(c3, h7);
    result.connect(c3, h8);
    return result;
  }


  public static IGraph getBensol() {
    Graph result = new Graph();
    IVertex c1 = new Vertex(200, 200, "C");
    IVertex c2 = new Vertex(200, 200, "C");
    IVertex c3 = new Vertex(200, 200, "C");
    IVertex c4 = new Vertex(200, 200, "C");
    IVertex c5 = new Vertex(200, 200, "C");
    IVertex c6 = new Vertex(200, 200, "C");
    IVertex h1 = new Vertex(200, 200, "H");
    IVertex h2 = new Vertex(200, 200, "H");
    IVertex h3 = new Vertex(200, 200, "H");
    IVertex h4 = new Vertex(200, 200, "H");
    IVertex h5 = new Vertex(200, 200, "H");
    IVertex h6 = new Vertex(200, 200, "H");
    result.addVertex(c1);
    result.addVertex(c2);
    result.addVertex(c3);
    result.addVertex(c4);
    result.addVertex(c5);
    result.addVertex(c6);
    result.addVertex(h1);
    result.addVertex(h2);
    result.addVertex(h3);
    result.addVertex(h4);
    result.addVertex(h5);
    result.addVertex(h6);
    result.connect(c1, h1);
    result.connect(c2, h2);
    result.connect(c3, h3);
    result.connect(c4, h4);
    result.connect(c5, h5);
    result.connect(c6, h6);
    result.connect(c6, c1);
    result.connect(c1, c2);
    result.connect(c2, c3);
    result.connect(c3, c4);
    result.connect(c4, c5);
    result.connect(c5, c6);
    return result;
  }

  public static IGraph getStuff() {
    Graph result = new Graph();
    IVertex c1 = new Vertex(200, 200, "C");
    IVertex c2 = new Vertex(200, 200, "C");
    IVertex c3 = new Vertex(200, 200, "C");
    IVertex c4 = new Vertex(200, 200, "C");
    IVertex c5 = new Vertex(200, 200, "C");
    IVertex c6 = new Vertex(200, 200, "C");

    result.addVertex(c1);
    result.addVertex(c2);
    result.addVertex(c3);
    result.addVertex(c4);
    result.addVertex(c5);
    result.addVertex(c6);


    result.connect(c6, c1);
    result.connect(c1, c2);
    result.connect(c2, c3);
    result.connect(c3, c4);
    result.connect(c4, c5);
    result.connect(c5, c6);

    result.connect(c2, c5);

    return result;
  }

}
