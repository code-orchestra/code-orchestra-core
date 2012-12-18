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
package jetbrains.mps.ide.projectPane.favorites;

import com.intellij.ide.SelectInContext;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.projectPane.AbstractProjectViewSelectInTarget;
import jetbrains.mps.ide.projectPane.favorites.root.FavoritesRoot;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;

import java.util.ArrayList;
import java.util.List;

public class FavoritesSelectInTarget extends AbstractProjectViewSelectInTarget {
  public FavoritesSelectInTarget(Project project) {
    super(project, FavoritesProjectPane.ID, 0, FavoritesProjectPane.ID);
  }

  private List<SNode> getAvailableNodes(List<Object> objects) {
    List<SNode> result = new ArrayList<SNode>();
    if (objects == null) return result;
    for (Object o : objects) {
      FavoritesRoot favoritesRoot = FavoritesRoot.createForValue(o);
      if (favoritesRoot == null) continue;
      result.addAll(favoritesRoot.getAvaliableNodes());
    }
    return result;
  }

  private MPSTreeNode findTreeNode(MPSTreeNode treeNode, Object userObject) {
    if (treeNode.getUserObject() == userObject) return treeNode;
    if (!treeNode.isInitialized()) treeNode.init();
    for (MPSTreeNode child : treeNode) {
      MPSTreeNode result = findTreeNode(child, userObject);
      if (result != null) return result;
    }
    return null;
  }

  private void select(MPSTreeNode treeNode, MPSTree tree) {
    if (treeNode == null) return;
    tree.selectNode(treeNode);
  }

  public boolean canSelect(SelectInContext context) {
    VirtualFile file = context.getVirtualFile();
    if (!(file instanceof MPSNodeVirtualFile)) return false;
    MPSNodeVirtualFile nodeVirtualFile = (MPSNodeVirtualFile) file;
    Project project = getProject();
    FavoritesProjectPane currentFavoritesPane = FavoritesUtil.getCurrentPane(project);
    if (currentFavoritesPane != null) {
      MPSFavoritesManager favoritesManager = project.getComponent(MPSFavoritesManager.class);
      if (favoritesManager == null) return false;
      String name = currentFavoritesPane.getSubId();
      List<Object> objects = favoritesManager.getRoots(name);
      if (getAvailableNodes(objects).contains(nodeVirtualFile.getNode())) {
        return true;
      }
    }
    return false;
  }

  @Override
  protected void doSelectIn(SelectInContext context, boolean requestFocus) {
    Project project = getProject();
    MPSNodeVirtualFile nodeVirtualFile = (MPSNodeVirtualFile) context.getVirtualFile();
    final SNode nodeToSelect = nodeVirtualFile.getNode();
    SModelDescriptor model = ModelAccess.instance().runReadAction(new Computable<SModelDescriptor>() {
      public SModelDescriptor compute() {
        return nodeToSelect.getModel().getModelDescriptor();
      }
    });
    IModule module = model.getModule();
    FavoritesProjectPane pane = (FavoritesProjectPane) ProjectView.getInstance(project).getCurrentProjectViewPane();
    MPSTree tree = pane.getTree();
    MPSTreeNode mainRoot = tree.getRootNode();
    for (MPSTreeNode root : mainRoot) {
      Object userObject = root.getUserObject();
      if (userObject.equals(nodeToSelect)) {
        select(root, tree);
      } else if (userObject.equals(model) || userObject.equals(module)) {
        select(findTreeNode(root, nodeToSelect), tree);
      }
    }
  }
}
