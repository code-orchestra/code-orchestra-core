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
package codeOrchestra.actionscript.util.ArchivingUtility.SelectItemDialog;

import javax.swing.Icon;
import javax.swing.UIManager;
import java.awt.Component;
import java.awt.Graphics;

public class AUSelectItemDownIcon implements Icon {
  private int mySize;
  private int myXoff = 4;
  private int myYoff = 4;

  public AUSelectItemDownIcon(int size) {
    mySize = size;
  }
  @Override
  public void paintIcon(Component c, Graphics g, int x, int y) {
    g.setColor(UIManager.getColor("controlDkShadow"));
    g.fillPolygon(new int[]{myXoff + 0, myXoff + mySize, myXoff + mySize / 2}, new int[]{myYoff + 0, myYoff + 0, myYoff + (int) (mySize * 0.87)}, 3);
  }
  @Override
  public int getIconWidth() {
    return mySize + myXoff;
  }
  @Override
  public int getIconHeight() {
    return mySize + myYoff;
  }
}