/*
 * Copyright 2013 Oleg Chiruhin
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
package codeOrchestra.actionscript.util;

import java.awt.*;

/**
 * Helper class for centering Swing components on multi-monitor configurations
 * (adopted from this thread: http://stackoverflow.com/questions/213266/how-do-i-center-a-jdialog-on-screen)
 */

public class ScreenHelper {

  public static int getScreenID(Component c) {
    int scrID = 1;
    GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
    GraphicsDevice[] gd = ge.getScreenDevices();
    for (int i = 0; i < gd.length; i++) {
      GraphicsConfiguration gc = gd[i].getDefaultConfiguration();
      Rectangle r = gc.getBounds();
      if (r.contains(c.getLocation())) {
        scrID = i + 1;
      }
    }
    return scrID;
  }

  public static Dimension getScreenDimension(int scrID) {
    Dimension d = new Dimension(0, 0);
    if (scrID > 0) {
      GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
      DisplayMode mode = ge.getScreenDevices()[scrID - 1].getDisplayMode();
      d.setSize(mode.getWidth(), mode.getHeight());
    }
    return d;
  }

  public static int getScreenWidth(int scrID) {
    Dimension d = ScreenHelper.getScreenDimension(scrID);
    return d.width;
  }

  public static int getScreenHeight(int scrID) {
    Dimension d = ScreenHelper.getScreenDimension(scrID);
    return d.height;
  }

  public static void centerOnScreen(final Component c, final boolean absolute) {
    final int width = c.getWidth();
    final int height = c.getHeight();
    final Dimension screenSize = ScreenHelper.getScreenDimension(ScreenHelper.getScreenID(c));
    int x = (screenSize.width / 2) - (width / 2);
    int y = (screenSize.height / 2) - (height / 2);
    if (!(absolute)) {
      x /= 2;
      y /= 2;
    }
    c.setLocation(x, y);
  }
}
