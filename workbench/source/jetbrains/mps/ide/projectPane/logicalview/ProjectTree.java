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
package jetbrains.mps.ide.projectPane.logicalview;

import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.TransientModelsComponent;
import jetbrains.mps.generator.TransientModelsModule;
import jetbrains.mps.ide.projectPane.DefaultNamespaceTreeBuilder;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModulesPoolTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.TransientModelsTreeNode;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.make.IMakeNotificationListener;
import jetbrains.mps.make.IMakeNotificationListener.Stub;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.make.MakeNotification;
import jetbrains.mps.project.*;
import jetbrains.mps.smodel.Language;

import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class ProjectTree extends MPSTree {
  private Project myProject;
  private ProjectTreeNode myProjectTreeNode;
  private jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModulesPoolTreeNode myModulesPoolTreeNode;
  private AtomicReference<IMakeNotificationListener> myMakeNotificationListener = new AtomicReference<IMakeNotificationListener>();

  public ProjectTree(Project project) {
    myProject = project;

    getSelectionModel().setSelectionMode(TreeSelectionModel.DISCONTIGUOUS_TREE_SELECTION);
    scrollsOnExpand = false;
  }

  protected MPSTreeNode rebuild() {
    if (myProject == null || myProject.isDisposed()) {
      return new TextTreeNode("Empty");
    }

    MPSProject project = myProject.getComponent(MPSProject.class);
    MPSTreeNode root = new TextTreeNode("Empty");
    ProjectTreeNode projectRoot = new ProjectTreeNode(project);

    setRootVisible(false);
    List<MPSTreeNode> moduleNodes = new ArrayList<MPSTreeNode>();

    for (Class<? extends IModule> cl: new Class[]{Solution.class,Language.class,Library.class,DevKit.class}){
      for (IModule module : project.getProjectModules(cl)) {
        moduleNodes.add(ProjectModuleTreeNode.createFor(project,module,false));
      }
    }

    ModulesNamespaceTreeBuilder builder = new ModulesNamespaceTreeBuilder(project);
    for (MPSTreeNode mtn : moduleNodes) {
      builder.addNode(mtn);
    }
    builder.fillNode(projectRoot);

    myModulesPoolTreeNode = new ProjectModulesPoolTreeNode(project);
    root.add(projectRoot);
    root.add(myModulesPoolTreeNode);
    if (!IMakeService.INSTANCE.get().isSessionActive()) {
      for(TransientModelsModule module : myProject.getComponent(TransientModelsComponent.class).getModules()) {
        root.add(new TransientModelsTreeNode(myProject, module));
      }
    }
    else {
      // postpone the update until the make session ends
      if (myMakeNotificationListener.compareAndSet(null, new Stub() {
        @Override
        public void sessionClosed(MakeNotification notification) {
          rebuildLater();
          IMakeService.INSTANCE.get().removeListener(this);
          myMakeNotificationListener.set(null);
        }
      }))
      {
        IMakeService.INSTANCE.get().addListener(myMakeNotificationListener.get());
      }
    }
    myProjectTreeNode = projectRoot;
    return root;
  }

  public void expandProjectNode() {
    this.expandPath(new TreePath(myProjectTreeNode.getPath()));
  }

  public ProjectModulesPoolTreeNode getModulesPoolNode() {
    return myModulesPoolTreeNode;
  }

  public Project getProject() {
    return myProject;
  }

  private class ModulesNamespaceTreeBuilder extends DefaultNamespaceTreeBuilder {
    private MPSProject myProject;

    protected ModulesNamespaceTreeBuilder(MPSProject project) {
      myProject = project;
    }

    protected String getNamespace(MPSTreeNode node) {
      String folder = null;

      if (node instanceof ProjectModuleTreeNode) {
        ProjectModuleTreeNode pmtn = (ProjectModuleTreeNode) node;
        folder = myProject.getFolderFor(pmtn.getModule());
      }

      if (folder != null) {
        return folder;
      }

      return "";
    }
  }
}
