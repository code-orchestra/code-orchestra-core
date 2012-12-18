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

import com.intellij.ui.SpeedSearchBase;

import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreePath;

/**
 * Ripped from IDEA
 */
public class TreeSpeedSearch extends SpeedSearchBase {

  public TreeSpeedSearch(JTree tree) {
    super(tree);
  }

  protected void selectElement(Object element, String selectedText) {
    TreeScrollingUtil.selectPath((JTree) myComponent, (TreePath) element);
  }

  protected int getSelectedIndex() {
    int[] selectionRows = ((JTree) myComponent).getSelectionRows();
    return selectionRows == null || selectionRows.length == 0 ? -1 : selectionRows[0];
  }

  protected Object[] getAllElements() {
    JTree tree = (JTree) myComponent;
    TreePath[] paths = new TreePath[tree.getRowCount()];
    for (int i = 0; i < paths.length; i++) {
      paths[i] = tree.getPathForRow(i);
    }
    return paths;
  }

  protected String getElementText(Object element) {
    DefaultMutableTreeNode node = (DefaultMutableTreeNode) ((TreePath) element).getLastPathComponent();
    return node.toString();
  }
}
