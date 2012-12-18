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
package jetbrains.mps.ide;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;

/**
 * @author Kostik
 */
public class MemoryIndicator extends JPanel {
  public static final int MEGABYTE = 1024 * 1024;

  private long myTotalMemory = 10;
  private long myUsedMemeory = 10;

  private JLabel myMemoryLabel = new JLabel("", JLabel.RIGHT) {
    protected void paintComponent(Graphics g) {
      g.setColor(Color.WHITE);
      g.fillRect(0, 0, getWidth(), getHeight());
      g.setColor(UIManager.getColor("List.selectionBackground"));

      g.fillRect(0, 0, (int) (getWidth() * myUsedMemeory / myTotalMemory), getHeight());
      g.setColor(Color.BLACK);
      g.drawRect(0, 0, getWidth() - 1, getHeight() - 1);
      super.paintComponent(g);
    }
  };
  private Timer myTimer = new Timer(1000, new AbstractAction() {
    public void actionPerformed(ActionEvent e) {
      updateMemory();
    }
  });

  public MemoryIndicator() {
    super(new BorderLayout());
    add(myMemoryLabel, BorderLayout.CENTER);
    add(new JButton(new AbstractAction("GC") {
      public void actionPerformed(ActionEvent e) {
        System.gc();
        updateMemory();
      }
    }) {

      {
        setFocusable(false);
      }

      public Dimension getPreferredSize() {
        return new Dimension(super.getPreferredSize().width, myMemoryLabel.getPreferredSize().height);
      }

    }, BorderLayout.EAST);
  }

  private void updateMemory() {
    Runtime runtime = Runtime.getRuntime();
    myTotalMemory = runtime.totalMemory() / MEGABYTE;
    myUsedMemeory = myTotalMemory - runtime.freeMemory() / MEGABYTE;
    myMemoryLabel.setText("         " + myUsedMemeory + "M of " + myTotalMemory + "M         ");
  }


  public void addNotify() {
    super.addNotify();
    myTimer.start();
  }

  public void removeNotify() {
    super.removeNotify();
    myTimer.stop();
  }


}
