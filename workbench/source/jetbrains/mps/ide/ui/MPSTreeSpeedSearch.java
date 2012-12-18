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

import javax.swing.JTree;
import javax.swing.tree.TreePath;

/**
 * @author Kostik
 */
public class MPSTreeSpeedSearch extends TreeSpeedSearch {
  public MPSTreeSpeedSearch(JTree tree) {
    super(tree);
  }

  protected String getElementText(Object element) {
    TreePath path = (TreePath) element;
    MPSTreeNode last = (MPSTreeNode) path.getLastPathComponent();
    return last.getText();
  }
}
