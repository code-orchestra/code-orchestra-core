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

import jetbrains.mps.smodel.ModelAccess;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;

public class ChooseItemWindowCellRenderer<Item> extends JPanel implements ListCellRenderer {
  private JLabel myTextLabel;
  private JLabel myDescriptionLabel;
  private ChooseItemComponent<Item> myChooseItemComponent;

  public ChooseItemWindowCellRenderer(ChooseItemComponent<Item> chooseItemComponent) {
    myChooseItemComponent = chooseItemComponent;

    setLayout(new BorderLayout());

    myTextLabel = new JLabel();
    add(myTextLabel, BorderLayout.CENTER);

    myDescriptionLabel = new JLabel();
    myDescriptionLabel.setForeground(Color.GRAY);
    add(myDescriptionLabel, BorderLayout.EAST);
  }

  public Component getListCellRendererComponent(final JList list, final Object value, int index, final boolean isSelected, boolean cellHasFocus) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        Item item = (Item) value;
        setIcon(myChooseItemComponent.getItemIcon(item));
        if (isSelected) {
          setBackground(list.getSelectionBackground());
          setForeground(list.getSelectionForeground());
          myDescriptionLabel.setForeground(null);
        } else {
          setBackground(Color.WHITE);
          setForeground(myChooseItemComponent.getItemColor(item));
          myDescriptionLabel.setForeground(Color.GRAY);
        }
        setText(myChooseItemComponent.getItemPresentation(item));
        setDescription(myChooseItemComponent.getItemDescription(item));
        setEnabled(list.isEnabled());
        setFont(list.getFont());
      }
    });
    return this;
  }

  private void setIcon(Icon icon) {
    myTextLabel.setIcon(icon);
  }

  private void setText(String description) {
    myTextLabel.setText(description);
  }

  private void setDescription(String description) {
    myDescriptionLabel.setText(description);
  }
}
