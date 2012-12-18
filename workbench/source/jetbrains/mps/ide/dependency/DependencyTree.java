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
package jetbrains.mps.ide.dependency;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.actions.ModuleProperties_Action;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextMPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.workbench.MPSDataKeys;
import org.jetbrains.annotations.NonNls;

import javax.swing.JPopupMenu;
import javax.swing.tree.TreePath;

public class DependencyTree extends MPSTree implements DataProvider {
  private Project myProject;
  private IModule myModule = null;

  public DependencyTree(Project project) {
    myProject = project;
  }

  protected MPSTreeNode rebuild() {
    if (myModule == null) {
      setRootVisible(false);
      return new TextMPSTreeNode("No Contents", null);
    }

    setRootVisible(true);

    ModuleTreeNode root = new ModuleTreeNode(myProject, myModule);
    expandPath(new TreePath(root.getPath()));
    return root;
  }

  public void setModule(IModule module) {
    myModule = module;
  }

  @Override
  protected JPopupMenu createPopupMenu(MPSTreeNode treeNode) {
    DefaultActionGroup group = new DefaultActionGroup();
    String id = new ModuleProperties_Action().getActionId();
    if (id == null) return null;
    AnAction action = ActionManager.getInstance().getAction(id);
    if (action == null) return null;
    group.add(action);
    return ActionManager.getInstance().createActionPopupMenu(ActionPlaces.UNKNOWN, group).getComponent();
  }

  public Object getData(@NonNls String dataId) {
    if (dataId.equals(MPSDataKeys.MODULE.getName())) {
      MPSTreeNode treeNode = getCurrentNode();
      if (!(treeNode instanceof ModuleTreeNode)) return null;
      ModuleTreeNode node = (ModuleTreeNode) treeNode;
      return node.getModule();
    }
    return null;
  }
}
