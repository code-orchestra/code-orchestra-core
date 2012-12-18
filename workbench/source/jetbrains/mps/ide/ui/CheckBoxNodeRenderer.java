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

import jetbrains.mps.smodel.ModelAccess;

import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeCellEditor;
import javax.swing.tree.TreeCellRenderer;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class CheckBoxNodeRenderer implements TreeCellRenderer {
  private final JPanelWithCheckBox myPanel;

  public CheckBoxNodeRenderer() {
    this(false);
  }

  public CheckBoxNodeRenderer(boolean isCheckboxLeft) {
    myPanel = new JPanelWithCheckBox(isCheckboxLeft);
  }

  public boolean isSelected() {
    return myPanel.myCheckBox.isSelected();
  }

  public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, final boolean expanded, boolean leaf, int row, boolean hasFocus) {
    String text = tree.convertValueToText(value, selected, expanded, leaf, row, hasFocus);
    Object userObject = ((DefaultMutableTreeNode) value).getUserObject();
    myPanel.updateView(tree.isEnabled(), selected, expanded, userObject, text);
    return myPanel;
  }

  private static class JPanelWithCheckBox extends JPanel {
    private final JLabel myIconLabel = new JLabel();
    private final JLabel myTextLabel = new JLabel();
    private final JCheckBox myCheckBox = new JCheckBox();

    public JPanelWithCheckBox(boolean isCheckboxLeft) {
      super(new BorderLayout());
      Font font = UIManager.getFont("Tree.font");
      if (font != null) {
        myTextLabel.setFont(font);
      }
      Boolean iconBorder = (Boolean) UIManager.get("Tree.drawsFocusBorderAroundIcon");
      setOpaque(true);
      myCheckBox.setFocusPainted((iconBorder != null) && iconBorder);
      add(myCheckBox, isCheckboxLeft ? BorderLayout.WEST : BorderLayout.CENTER);
      add(myIconLabel, isCheckboxLeft ? BorderLayout.CENTER : BorderLayout.WEST);
      add(myTextLabel, BorderLayout.EAST);
    }

    public void addItemListener(ItemListener listener) {
      myCheckBox.addItemListener(listener);
    }

    public void updateView(boolean enabled, boolean selected, final boolean expanded, final Object userObject, final String text) {

      myCheckBox.setEnabled(enabled);

      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          if (userObject instanceof NodeData) {
            NodeData data = (NodeData) userObject;
            myIconLabel.setIcon(data.getIcon(expanded));
            Color color = data.getColor();
            if (color != null) {
              myCheckBox.setForeground(color);
              myTextLabel.setForeground(color);
            }
            myTextLabel.setText(data.getText());
            myCheckBox.setSelected(data.isSelected());
          } else {
            myIconLabel.setIcon(null);
            myTextLabel.setText(text);
            myCheckBox.setSelected(false);
          }
        }
      });

      myCheckBox.setForeground(getForeground(selected));
      myCheckBox.setBackground(getBackground(selected));
      setForeground(getForeground(selected));
      setBackground(getBackground(selected));

    }

    private Color getBackground(boolean selected) {
      return selected ? UIManager.getColor("Tree.selectionBackground") : UIManager.getColor("Tree.textBackground");
    }

    private Color getForeground(boolean selected) {
      return selected ? UIManager.getColor("Tree.selectionForeground") : UIManager.getColor("Tree.textForeground");
    }

  }

  public static interface NodeData {
    Icon getIcon(boolean expanded);

    Color getColor();

    String getText();

    boolean isSelected();

    void setSelected(boolean selected); 
  }

  public static abstract class CheckBoxNodeEditor<N extends NodeData> extends AbstractCellEditor implements TreeCellEditor {
    private final CheckBoxNodeRenderer myRenderer;
    private N myObject;

    public CheckBoxNodeEditor() {
      this(false);
    }

    public CheckBoxNodeEditor(boolean isCheckboxLeft) {
      myRenderer = new CheckBoxNodeRenderer(isCheckboxLeft);
    }

    public Object getCellEditorValue() {
      return createNodeData(myRenderer.isSelected());
    }

    protected abstract N createNodeData(boolean selected);

    public Component getTreeCellEditorComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row) {
      Component editor = myRenderer.getTreeCellRendererComponent(tree, value, true, expanded, leaf, row, true);

      DefaultMutableTreeNode node = (DefaultMutableTreeNode) value;
      myObject = (N) node.getUserObject();

      ItemListener itemListener = new ItemListener() {
        public void itemStateChanged(ItemEvent itemEvent) {
          if (stopCellEditing()) {
            fireEditingStopped();
          }
        }
      };
      if (editor instanceof JPanelWithCheckBox) {
        ((JPanelWithCheckBox) editor).addItemListener(itemListener);
      }
      return editor;
    }

    public N getObject() {
      return myObject;
    }
  }
}
