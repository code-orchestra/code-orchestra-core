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

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreePath;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;

/**
 * Ripped from IDEA
 */
public class TreeScrollingUtil {
  public static void selectPath(JTree tree, TreePath path) {
    tree.makeVisible(path);
    showRowCentred(tree, tree.getRowForPath(path));
  }

  public static void moveDown(JTree tree) {
    int size = tree.getRowCount();
    int row = getSelectedRow(tree);
    if (row < size - 1) {
      row++;
      showAndSelect(tree, row, row + 2, row, true);
    }
  }

  public static void moveUp(JTree tree) {
    int row = getSelectedRow(tree);
    if (row > 0) {
      row--;
      showAndSelect(tree, row - 2, row, row, true);
    }
  }

  public static void movePageUp(JTree tree) {
    int visible = getVisibleRowCount(tree);
    if (visible <= 0) {
      moveHome(tree);
      return;
    }
    int decrement = visible - 1;
    int row = Math.max(getSelectedRow(tree) - decrement, 0);
    int top = getFirstVisibleRow(tree) - decrement;
    int bottom = top + visible - 1;
    showAndSelect(tree, top, bottom, row, true);
  }

  public static void movePageDown(JTree tree) {
    int visible = getVisibleRowCount(tree);
    if (visible <= 0) {
      moveEnd(tree);
      return;
    }
    int size = tree.getRowCount();
    int increment = visible - 1;
    int index = Math.min(getSelectedRow(tree) + increment, size - 1);
    int top = getFirstVisibleRow(tree) + increment;
    int bottom = top + visible - 1;
    showAndSelect(tree, top, bottom, index, true);
  }

  public static void moveHome(JTree tree) {
    showRowCentred(tree, 0);
  }

  public static void moveEnd(JTree tree) {
    showRowCentred(tree, tree.getRowCount() - 1);
  }

  private static void showRowCentred(JTree tree, int row) {
    showRowCentred(tree, row, true);
  }

  public static void showRowCentred(JTree tree, int row, boolean centerHorizontally) {
    int visible = getVisibleRowCount(tree);
    int top = visible > 0 ? row - (visible - 1) / 2 : row;
    int bottom = visible > 0 ? top + visible - 1 : row;
    showAndSelect(tree, top, bottom, row, centerHorizontally);
  }

  private static void showAndSelect(JTree tree, int top, int bottom, int row,
                                    boolean centerHorizontally) {
    int size = tree.getRowCount();
    if (size == 0) {
      tree.clearSelection();
      return;
    }
    if (top < 0) {
      top = 0;
    }
    if (bottom >= size) {
      bottom = size - 1;
    }
    Rectangle topBounds = tree.getRowBounds(top);
    Rectangle bottomBounds = tree.getRowBounds(bottom);
    Rectangle bounds;
    if (topBounds == null) {
      bounds = bottomBounds;
    } else if (bottomBounds == null) {
      bounds = topBounds;
    } else {
      bounds = topBounds.union(bottomBounds);
    }
    if (bounds != null) {
      TreePath path = tree.getPathForRow(row);
      if (path != null && path.getParentPath() != null) {
        Rectangle parentBounds = tree.getPathBounds(path.getParentPath());
        if (parentBounds != null) {
          bounds.x = parentBounds.x;
        }
      }
      if (!centerHorizontally) {
        bounds.x = 0;
        bounds.width = tree.getWidth();
      } else {
        bounds.width = Math.min(bounds.width, tree.getVisibleRect().width);
      }
      tree.scrollRectToVisible(bounds);
    }
    tree.setSelectionRow(row);
  }

  private static int getSelectedRow(JTree tree) {
    return tree.getRowForPath(tree.getSelectionPath());
  }

  private static int getFirstVisibleRow(JTree tree) {
    Rectangle visible = tree.getVisibleRect();
    int row = -1;
    for (int i = 0; i < tree.getRowCount(); i++) {
      Rectangle bounds = tree.getRowBounds(i);
      if (visible.y <= bounds.y && visible.y + visible.height >= bounds.y + bounds.height) {
        row = i;
        break;
      }
    }
    return row;
  }

  private static int getVisibleRowCount(JTree tree) {
    Rectangle visible = tree.getVisibleRect();
    int count = 0;
    for (int i = 0; i < tree.getRowCount(); i++) {
      Rectangle bounds = tree.getRowBounds(i);
      if (visible.y <= bounds.y && visible.y + visible.height >= bounds.y + bounds.height) {
        count++;
      }
    }
    return count;
  }

  public static void installActions(final JTree tree) {
    tree.getActionMap().put("scrollUpChangeSelection", new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        movePageUp(tree);
      }
    });
    tree.getActionMap().put("scrollDownChangeSelection", new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        movePageDown(tree);
      }
    });
    tree.getActionMap().put("selectPrevious", new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        moveUp(tree);
      }
    });
    tree.getActionMap().put("selectNext", new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        moveDown(tree);
      }
    });
    Action action = tree.getActionMap().get("selectLast");
    if (action != null) {
      tree.getActionMap().put("selectLastChangeLead", action);
    }
  }

  public static void collapseAll(JTree tree, int keepSelectionLevel) {
    TreePath leadSelectionPath = tree.getLeadSelectionPath();
    // Collapse all
    int row = tree.getRowCount() - 1;
    while (row >= 0) {
      tree.collapseRow(row);
      row--;
    }
    DefaultMutableTreeNode root = (DefaultMutableTreeNode) tree.getModel().getRoot();
    tree.expandPath(new TreePath(root));
    if (leadSelectionPath != null) {
      Object[] path = leadSelectionPath.getPath();
      Object[] pathToSelect = new Object[path.length > keepSelectionLevel ? keepSelectionLevel : path.length];
      System.arraycopy(path, 0, pathToSelect, 0, pathToSelect.length);
      TreeScrollingUtil.selectPath(tree, new TreePath(pathToSelect));
    }
  }
}
