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
package jetbrains.mps.debugger.api.ui.breakpoints;

import jetbrains.mps.debug.api.breakpoints.IBreakpoint;

import javax.swing.*;
import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

class JPanelWithCheckbox extends JPanel {
  private final JCheckBox myCheckBox;
  protected final JLabel myLabel;

  public JPanelWithCheckbox() {
    this.setLayout(new GridBagLayout());
    myCheckBox = new JCheckBox();
    myCheckBox.setMargin(new Insets(0, 0, 0, 0));
    myLabel = new JLabel();
    myLabel.setHorizontalAlignment(SwingConstants.LEFT);

    GridBagConstraints constraints = new GridBagConstraints();
    constraints.gridy = 0;
    constraints.gridx = 0;
    constraints.weighty = 1;
    constraints.weightx = 0;
    add(myCheckBox, constraints);
    constraints.gridx = 1;
    constraints.weightx = 1;
    constraints.anchor = GridBagConstraints.WEST;
    add(myLabel, constraints);
  }

  public void update(IBreakpoint breakpoint, boolean isSelected) {
    Color bg;
    if (isSelected) {
      bg = UIManager.getColor("Table.selectionBackground");
    } else {
      bg = UIManager.getColor("Table.background");
    }
    this.setBackground(bg);
    myCheckBox.setSelected(breakpoint.isEnabled());
    myCheckBox.setBackground(bg);
    myLabel.setText(breakpoint.getPresentation());
    myLabel.setIcon(BreakpointIconRenderer.getIconFor(breakpoint));
  }

  public JCheckBox getCheckBox() {
    return myCheckBox;
  }
}