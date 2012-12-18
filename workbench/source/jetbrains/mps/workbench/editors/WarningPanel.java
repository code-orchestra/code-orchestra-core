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
package jetbrains.mps.workbench.editors;

import com.intellij.ui.HyperlinkLabel;
import com.intellij.ui.LightColors;

import javax.swing.BorderFactory;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.event.HyperlinkEvent;
import javax.swing.event.HyperlinkListener;
import java.awt.BorderLayout;

class WarningPanel extends JPanel {
  WarningPanel(String text) {
    this(text, null, null);
  }

  public WarningPanel(String text, String linkText, final Runnable handler) {
    setLayout(new BorderLayout());

    setBackground(LightColors.YELLOW);
    setBorder(BorderFactory.createEmptyBorder(0, 4, 0, 4));

    add(new JLabel(text), BorderLayout.CENTER);

    if (linkText != null && handler != null) {
      HyperlinkLabel hyperlinkLabel = new HyperlinkLabel(linkText);
      hyperlinkLabel.setOpaque(false);
      hyperlinkLabel.addHyperlinkListener(new HyperlinkListener() {
        public void hyperlinkUpdate(HyperlinkEvent e) {
          handler.run();
        }
      });
      add(hyperlinkLabel, BorderLayout.EAST);
    }
  }
}
