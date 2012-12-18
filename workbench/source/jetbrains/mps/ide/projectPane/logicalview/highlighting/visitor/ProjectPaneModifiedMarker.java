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
package jetbrains.mps.ide.projectPane.logicalview.highlighting.visitor;

import com.intellij.ui.LayeredIcon;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.smodel.ModelLoadingState;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

import javax.swing.Icon;
import javax.swing.SwingUtilities;

public class ProjectPaneModifiedMarker extends TreeNodeVisitor {
  protected void visitModelNode(final SModelTreeNode node) {
    SModelDescriptor md = node.getSModelDescriptor();
    if (md.getLoadingState() == ModelLoadingState.NOT_LOADED) return;
    if (!(md instanceof EditableSModelDescriptor)) return;

    boolean changed = ((EditableSModelDescriptor) md).isChanged();
    updateNodeLater(node, changed ? new LayeredIcon(node.getDefaultIcon(), Icons.MODIFIED_ICON) : node.getDefaultIcon());
  }

  protected void visitModuleNode(final ProjectModuleTreeNode node) {

  }

  protected void visitProjectNode(final ProjectTreeNode node) {

  }

  private void updateNodeLater(final MPSTreeNode node, final Icon icon) {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        node.setIcon(icon);
        node.updateNodePresentationInTree();
      }
    });
  }
}
