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
package jetbrains.mps.ide.findusages.view.util;

import javax.swing.AbstractAction;
import javax.swing.Icon;
import javax.swing.JToggleButton;
import java.awt.event.ActionEvent;

public abstract class AnonymToggleButton extends JToggleButton {
  public AnonymToggleButton(Icon icon, String tooltip) {
    setAction(new AbstractAction("", icon) {
      public void actionPerformed(ActionEvent e) {
        change();
        if (getModel().isSelected()) {
          actionSelected();
        } else {
          actionDeselected();
        }
      }
    });
    if (tooltip != null) {
      setToolTipText(tooltip);
    }
  }

  public void setState(boolean state) {
    if (getModel().isSelected() != state) {
      doClick();
    }
  }

  public boolean getState() {
    return getModel().isSelected();
  }

  public abstract void actionSelected();

  public abstract void actionDeselected();

  public abstract void change();
}
