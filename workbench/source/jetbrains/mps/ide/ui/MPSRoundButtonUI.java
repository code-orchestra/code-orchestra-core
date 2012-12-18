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
package jetbrains.mps.ide.ui;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.plaf.basic.BasicButtonUI;
import java.awt.Color;
import java.awt.Graphics;

public class MPSRoundButtonUI extends BasicButtonUI {
  public void paint(Graphics g, JComponent c) {

    JButton b = (JButton) c;

    //  if ()

    super.paint(g, c);


    if (!b.getModel().isRollover()) {
      g.setColor(new Color(150, 220, 220, 50));
      g.fillOval(0, 0, b.getWidth(), b.getHeight());
      g.setColor(new Color(250, 250, 250, 80));
      g.drawOval(1, 1, b.getWidth() - 2, b.getHeight() - 2);
    }
  }

}
