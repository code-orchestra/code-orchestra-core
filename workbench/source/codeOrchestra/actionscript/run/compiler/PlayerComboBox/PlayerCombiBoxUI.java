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
package codeOrchestra.actionscript.run.compiler.PlayerComboBox;

import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.plaf.basic.BasicComboBoxUI;
import java.awt.Component;
import java.awt.Graphics;

/**
 * @author olegchir
 */
public class PlayerCombiBoxUI extends BasicComboBoxUI {

  public PlayerCombiBoxUI() {
    super();
  }

  public void paint(Graphics g, JComponent c) {
    JComboBox cb = comboBox;
    super.paint(g, cb);
    Object item = cb.getSelectedItem();
    Component renderer = cb.getRenderer().getListCellRendererComponent(null, item, cb.getSelectedIndex(), true, true);
    renderer.setBounds(0, 0, cb.getBounds().width, cb.getBounds().height);
    renderer.paint(g);
  }
}
