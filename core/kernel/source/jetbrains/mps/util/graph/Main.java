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

import javax.swing.JComponent;
import javax.swing.JFrame;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.HeadlessException;

public class Main extends JFrame {
  public static final int CENTER = 300;

  public Main(IGraph graph) throws HeadlessException {
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setSize(600, 600);
    getContentPane().add(new MyJComponent(graph));
    new PhysicalGraphLayouter().relayoutPhysicallyCompletely(graph, CENTER, CENTER);
    setVisible(true);
  }

  public static void main(String[] args) {
    new Main(GraphSamples.getEtan());
  }

  private class MyJComponent extends JComponent {
    IGraph myGraph;
    IGraphVisualizer myVisualizer;

    public MyJComponent(IGraph graph) {
      setSize(590, 590);
      myGraph = graph;
      myVisualizer = new GraphVisualizer();
    }


    public void paint(Graphics g) {
      g.setColor(Color.white);
      g.fillRect(0, 0, getWidth(), getHeight());
      myVisualizer.paint(myGraph, g);
    }
  }
}
