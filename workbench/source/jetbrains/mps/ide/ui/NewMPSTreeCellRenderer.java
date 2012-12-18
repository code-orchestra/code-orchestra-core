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

import jetbrains.mps.ide.util.ColorAndGraphicsUtil;

import javax.swing.*;
import javax.swing.plaf.basic.BasicGraphicsUtils;
import javax.swing.tree.TreeCellRenderer;
import java.awt.*;


public class NewMPSTreeCellRenderer extends JPanel implements TreeCellRenderer {
  private JLabel myMainTextLabel = new JLabel();
  private JLabel myAdditionalTextLabel = new JLabel();
  private boolean mySelected;
  private boolean myHasFocus;
  private MPSTreeNode myNode;

  public NewMPSTreeCellRenderer() {
    setLayout(new BorderLayout());
    setOpaque(false);
    add(myMainTextLabel, BorderLayout.CENTER);
    add(myAdditionalTextLabel, BorderLayout.EAST);
  }

  public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus) {
    Color foreground;
    Color additionalForeground;
    setOpaque(false);
    if (selected) {
      foreground = UIManager.getColor("Tree.selectionForeground");
      additionalForeground = foreground;
    } else {
      foreground = UIManager.getColor("Tree.textForeground");
      additionalForeground = Color.GRAY;
    }
    myMainTextLabel.setForeground(foreground);
    myAdditionalTextLabel.setForeground(additionalForeground);

    Icon icon = null;
    String text = value.toString();
    String additionalText = null;
    if (value instanceof MPSTreeNode) {
      MPSTreeNode treeNode = (MPSTreeNode) value;
      icon = treeNode.getIcon(expanded);
      text = treeNode.getText();
      additionalText = treeNode.getAdditionalText();

      Font newFont = tree.getFont().deriveFont(treeNode.getFontStyle());
      newFont = newFont.deriveFont(treeNode.getFontAttributes());
      myMainTextLabel.setFont(newFont);
      myAdditionalTextLabel.setFont(tree.getFont());

      if (!selected) {
        myMainTextLabel.setForeground(treeNode.getColor());
      }
      myNode = treeNode;
    } else {
      myMainTextLabel.setFont(tree.getFont());
      myAdditionalTextLabel.setFont(tree.getFont());
      myNode = null;
    }

    myMainTextLabel.setText(text);
    if (additionalText != null) {
      myAdditionalTextLabel.setText(" (" + additionalText + ") ");
    } else {
      myAdditionalTextLabel.setText(" ");
    }

    if (icon == null) {
      if (leaf) {
        icon = UIManager.getIcon("Tree.leafIcon");
      } else if (expanded) {
        icon = UIManager.getIcon("Tree.openIcon");
      } else {
        icon = UIManager.getIcon("Tree.closedIcon");
      }
    }
    myMainTextLabel.setIcon(icon);
    mySelected = selected;
    myHasFocus = hasFocus;

    return this;
  }

  public void paint(Graphics g) {
    Color background;
    if (mySelected) {
      background = UIManager.getColor("Tree.selectionBackground");
    } else {
      background = UIManager.getColor("Tree.textBackground");
      if (background == null) {
        background = getBackground();
      }
    }

    int imageOffset;
    Icon icon = myMainTextLabel.getIcon();
    if (icon != null) {
      imageOffset = icon.getIconWidth() + Math.max(0, myMainTextLabel.getIconTextGap() - 1);
    } else {
      imageOffset = 0;
    }

    if (background != null) {
      g.setColor(background);
      g.fillRect(imageOffset, 0, getWidth() - imageOffset, getHeight());
    }

    if (myHasFocus) {
      Boolean drawDashedFocusIndicator = (Boolean) UIManager.get("Tree.drawDashedFocusIndicator");
      if (drawDashedFocusIndicator != null && drawDashedFocusIndicator) {
        BasicGraphicsUtils.drawDashedRect(g, imageOffset, 0, getWidth() - imageOffset - 1, getHeight() - 1);
      } else {
        g.setColor(UIManager.getColor("Tree.selectionBorderColor"));
        g.drawRect(imageOffset, 0, getWidth() - imageOffset - 1, getHeight() - 1);
      }
    }

    super.paint(g);

    if (myNode != null && myNode.getAggregatedErrorState() != ErrorState.NONE) {
      if (myNode.getAggregatedErrorState() == ErrorState.ERROR) {
        g.setColor(Color.RED);
      } else {
        g.setColor(Color.YELLOW);
      }
      ColorAndGraphicsUtil.drawWave(g, imageOffset, getWidth(), getHeight() - ColorAndGraphicsUtil.WAVE_HEIGHT - 1);
    }
  }
}
