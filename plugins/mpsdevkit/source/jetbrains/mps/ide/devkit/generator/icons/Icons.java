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
package jetbrains.mps.ide.devkit.generator.icons;

import jetbrains.mps.ide.devkit.generator.TracerNode;
import jetbrains.mps.ide.devkit.generator.TracerNode.Kind;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNode;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.awt.Component;
import java.awt.Graphics;

public class Icons {
  // view
  public static final Icon CLOSE = new ImageIcon(Icons.class.getResource("close.png"));
  public static final Icon AUTOSCROLL_TO_SOURCE = new ImageIcon(Icons.class.getResource("autoscrollToSource.png"));

  // nodes
  public static final Icon INPUT = new ImageIcon(Icons.class.getResource("input.png"));
  public static final Icon OUTPUT = new ImageIcon(Icons.class.getResource("output.png"));
  public static final Icon RULE = new ImageIcon(Icons.class.getResource("rule.png"));
  public static final Icon COPY_OPERATION = new ImageIcon(Icons.class.getResource("copy-operation.png"));
  public static final Icon MACRO = new ImageIcon(Icons.class.getResource("macro.png"));
  public static final Icon RULE_CONSEQUENCE = new ImageIcon(Icons.class.getResource("rule-consequence.png"));
  public static final Icon SWITCH = new ImageIcon(Icons.class.getResource("switch.png"));
  public static final Icon TEMPALTE = new ImageIcon(Icons.class.getResource("template.png"));
  public static final Icon MAPPING_SCRIPT = new ImageIcon(Icons.class.getResource("mapping-script.png"));


  public static Icon getIcon(TracerNode tracerNode) {
    Icon mainIcon = getMainIcon(tracerNode);
    Icon kindIcon = getKindIcon(tracerNode);
    return new CompositeIcon(mainIcon, kindIcon);
  }

  private static Icon getMainIcon(TracerNode tracerNode) {
    SNodePointer nodePointer = tracerNode.getNodePointer();
    if (nodePointer != null) {
      SNode node = nodePointer.getNode();
      if (node != null) {
        Icon icon = IconManager.getIconFor(node);
        if (icon != null) {
          return icon;
        }
      }
    }
    return jetbrains.mps.ide.projectPane.Icons.DEFAULT_ICON;
  }

  private static Icon getKindIcon(TracerNode tracerNode) {
    Kind kind = tracerNode.getKind();
    if (kind == Kind.INPUT) return Icons.INPUT;
    if (kind == Kind.OUTPUT) return Icons.OUTPUT;
    if (kind == Kind.APPROXIMATE_OUTPUT) return Icons.OUTPUT;
    if (kind == Kind.APPROXIMATE_INPUT) return Icons.INPUT;
    if (kind == Kind.RULE) return Icons.RULE;
    if (kind == Kind.RULE_CONSEQUENCE) return Icons.RULE_CONSEQUENCE;
    if (kind == Kind.MACRO) return Icons.MACRO;
    if (kind == Kind.TEMPLATE) return Icons.TEMPALTE;
    if (kind == Kind.SWITCH) return Icons.SWITCH;
    if (kind == Kind.COPY_OPERATION) return Icons.COPY_OPERATION;
    if (kind == Kind.MAPPING_SCRIPT) return Icons.MAPPING_SCRIPT;
    return null;
  }

  private static class CompositeIcon implements Icon {
    private Icon myMainIcon;
    private Icon myMarkerIcon; // 12 x 12

    private CompositeIcon(Icon mainIcon, Icon markerIcon) {
      myMainIcon = mainIcon;
      myMarkerIcon = markerIcon;
    }

    public void paintIcon(Component c, Graphics g, int x, int y) {
      if (myMainIcon != null) {
        myMainIcon.paintIcon(c, g, x + 12, y);
      }
      if (myMarkerIcon != null) {
        myMarkerIcon.paintIcon(c, g, x, y + (getIconHeight() - myMarkerIcon.getIconHeight()) / 2);
      }
    }

    public int getIconWidth() {
      int mainIconWidth = 18;
      if (myMainIcon != null) {
        mainIconWidth = Math.max(18, myMainIcon.getIconWidth());
      }
      return mainIconWidth + 12;
    }

    public int getIconHeight() {
      if (myMainIcon != null) {
        return Math.max(18, myMainIcon.getIconHeight());
      }
      return 18;
    }
  }
}
