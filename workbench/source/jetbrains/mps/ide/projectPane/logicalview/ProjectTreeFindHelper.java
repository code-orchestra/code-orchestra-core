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
import jetbrains.mps.ide.projectPane.NamespaceTextNode;
import jetbrains.mps.ide.projectPane.SModelsSubtree.StubsTreeNode;
import jetbrains.mps.ide.projectPane.SModelsSubtree.TestsTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.AccessoriesModelTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectLanguageTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectLanguageTreeNode.AllModelsTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModulesPoolTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.dependency.LanguageDependenciesManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.NotNull;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeNode;
import java.util.Set;

public abstract class ProjectTreeFindHelper {
  public ProjectModuleTreeNode findMostSuitableModuleTreeNode(final @NotNull IModule module) {
    ProjectModuleTreeNode result = findModuleTreeNodeInProject(module);
    if (result != null) return result;

    ProjectModulesPoolTreeNode modulesPoolNode = getTree().getModulesPoolNode();
    if (!modulesPoolNode.isInitialized()) {
      modulesPoolNode.init();
    }

    return findModuleTreeNodeAnywhere(module);
  }

  protected ProjectModuleTreeNode findModuleTreeNodeInProject(final @NotNull IModule module) {
    return (ProjectModuleTreeNode) findTreeNode(getTree().getRootNode(),
      new ModuleInProjectCondition(),
      new NodeForModuleCondition(module));
  }

  protected ProjectModuleTreeNode findModuleTreeNodeAnywhere(@NotNull IModule module) {
    return (ProjectModuleTreeNode) findTreeNode(getTree().getRootNode(),
      new ModuleEverywhereCondition(),
      new NodeForModuleCondition(module));
  }

  public SModelTreeNode findMostSuitableModelTreeNode(@NotNull SModelDescriptor model) {
    MPSProject project = getProject().getComponent(MPSProject.class);

    IModule module = getModuleForModel(project, model);
    if (module == null) return findModelTreeNodeAnywhere(model, getTree().getRootNode());

    ProjectModuleTreeNode moduleTreeNode = findMostSuitableModuleTreeNode(module);
    if (moduleTreeNode == null) return findModelTreeNodeAnywhere(model, getTree().getRootNode());

    return findModelTreeNodeInModule(model, moduleTreeNode);
  }

  protected SModelTreeNode findModelTreeNodeInModule(final @NotNull SModelDescriptor model, @NotNull ProjectModuleTreeNode moduleNode) {
    return (SModelTreeNode) findTreeNode(moduleNode, new ModelInModuleCondition(), new NodeForModelCondition(model));
  }

  protected SModelTreeNode findModelTreeNodeAnywhere(@NotNull SModelDescriptor model, @NotNull MPSTreeNode parentNode) {
    return (SModelTreeNode) findTreeNode(parentNode, new ModelEverywhereCondition(), new NodeForModelCondition(model));
  }

  public MPSTreeNodeEx findMostSuitableSNodeTreeNode(@NotNull SNode node) {
    SModel model = node.getModel();
    if (model == null) return null;
    SModelTreeNode modelNode = findMostSuitableModelTreeNode(model.getModelDescriptor());
    if (modelNode == null) return null;

    return findSNodeTreeNodeInParent(node, modelNode);
  }

  //todo rewrite using findTreeNode
  protected MPSTreeNodeEx findSNodeTreeNodeInParent(@NotNull SNode node, @NotNull MPSTreeNode parent) {
    if (!parent.isInitialized() && !parent.hasInfiniteSubtree()) parent.init();
    if (parent instanceof SNodeTreeNode) {
      SNodeTreeNode parentSNodeTreeNode = (SNodeTreeNode) parent;
      if (node == parentSNodeTreeNode.getSNode()) {
        return parentSNodeTreeNode;
      }
    }
    for (MPSTreeNode childNode : parent) {
      MPSTreeNodeEx foundNode = findSNodeTreeNodeInParent(node, childNode);
      if (foundNode != null) {
        return foundNode;
      }
    }
    return null;
  }

  protected MPSTreeNode findTreeNode(MPSTreeNode root, Condition<MPSTreeNode> descendCondition, Condition<MPSTreeNode> resultCondition) {
    if (resultCondition.met(root)) {
      return root;
    }

    if (descendCondition.met(root)) {
      if (!root.isInitialized()) {
        root.init();
      }
      for (MPSTreeNode node : root) {
        MPSTreeNode result = findTreeNode(node, descendCondition, resultCondition);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }

  //----find next queries----

  //todo: will work bad e.g. if operating with project data from modules pool
  public MPSTreeNode findNextTreeNode(SNode node) {
    MPSTreeNode foundNode = findMostSuitableSNodeTreeNode(node);
    if (foundNode == null) return null;
    DefaultMutableTreeNode parentNode = (DefaultMutableTreeNode) foundNode.getParent();
    TreeNode result = parentNode.getChildAfter(foundNode);
    if (result == null) result = parentNode.getChildBefore(foundNode);
    if (result == null) result = parentNode;
    return (MPSTreeNode) result;
  }

  //todo: will work bad e.g. if operating with project data from modules pool
  public MPSTreeNode findNextTreeNode(SModelDescriptor modelDescriptor) {
    SModelTreeNode sModelNode = findMostSuitableModelTreeNode(modelDescriptor);
    if (sModelNode == null) return null;
    DefaultMutableTreeNode parentNode = (DefaultMutableTreeNode) sModelNode.getParent();
    TreeNode result = parentNode.getChildAfter(sModelNode);
    if (result == null) result = parentNode.getChildBefore(sModelNode);
    if (result == null) result = parentNode;
    return (MPSTreeNode) result;
  }

  //----node find conditions----

  private static class ModuleInProjectCondition extends ModuleEverywhereCondition {
    public boolean met(MPSTreeNode object) {
      if (!super.met(object)) return false;
      return !(object instanceof jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModulesPoolTreeNode);
    }
  }

  private static class ModuleEverywhereCondition implements Condition<MPSTreeNode> {
    public boolean met(MPSTreeNode node) {
      if (node instanceof ProjectModuleTreeNode && !(node instanceof ProjectLanguageTreeNode)) return false;
      if (node instanceof SModelTreeNode) return false;
/*
      todo: extract optimal module finding process. Used method only works when there is a single ability of selection
      //need to go into devkits
      if (node instanceof ProjectDevKitTreeNode) return true;
*/
      return true;
    }
  }

  private static class ModelInModuleCondition extends ModelEverywhereCondition {
    public boolean met(MPSTreeNode node) {
      if (!super.met(node)) return false;

      if (node instanceof SModelTreeNode) {
        SModelTreeNode modelNode = (SModelTreeNode) node;
        if (modelNode.hasModelsUnder()) return true;
      }

      boolean descent = false;

      if (node instanceof ProjectModuleTreeNode) descent = true;
      if (node instanceof NamespaceTextNode) descent = true;
      if (node instanceof AccessoriesModelTreeNode) descent = true;
      if (node instanceof StubsTreeNode) descent = true;
      if (node instanceof AllModelsTreeNode) descent = true;
      if (node instanceof TestsTreeNode) descent = true;

      if (!descent) return false;

      if (!node.isInitialized() && !node.hasInfiniteSubtree()) {
        node.init();
        return true;
      }

      return node.isInitialized();
    }
  }

  private static class ModelEverywhereCondition implements Condition<MPSTreeNode> {
    public boolean met(MPSTreeNode node) {
      if (node instanceof SNodeTreeNode) return false;
      if (node instanceof SModelTreeNode) return true;
      if (!node.isInitialized() && !node.hasInfiniteSubtree()) {
        node.init();
        return true;
      }
      return node.isInitialized();
    }
  }

  private static class NodeForModuleCondition implements Condition<MPSTreeNode> {
    private final IModule myModule;

    public NodeForModuleCondition(IModule module) {
      myModule = module;
    }

    public boolean met(MPSTreeNode treeNode) {
      if (!(treeNode instanceof ProjectModuleTreeNode)) return false;
      IOperationContext nodeContext = treeNode.getOperationContext();
      return nodeContext != null && nodeContext.getModule() == myModule;
    }
  }

  private static class NodeForModelCondition implements Condition<MPSTreeNode> {
    private final SModelDescriptor myModel;

    public NodeForModelCondition(SModelDescriptor model) {
      myModel = model;
    }

    public boolean met(MPSTreeNode node) {
      if (!(node instanceof SModelTreeNode)) return false;
      SModelTreeNode modelNode = (SModelTreeNode) node;
      SModelDescriptor modelDescriptor = modelNode.getSModelDescriptor();
      SModelReference modelReference = modelDescriptor.getSModelReference();
      return modelReference.equals(myModel.getSModelReference());
    }
  }

  //-----------getters----------

  protected Project getProject() {
    return getTree().getProject();
  }

  protected abstract ProjectTree getTree();

  //-----------find module by model------------

  public static IModule getModuleForModel(MPSProject project, SModelDescriptor model) {
    //language's and solution's own models (+generator models in language)
    IModule owner = model.getModule();
    IModule mainModule = owner instanceof Generator ? ((Generator) owner).getSourceLanguage() : owner;
    if (project.isProjectModule(mainModule)) return owner;

    //accessories models in languages
    /*
      //with this enabled, alt-f1 does not work in case node is in non-owned accessory model to a project language
      for (Language l : project.getProjectLanguages()) {
        if (l.isAccessoryModel(model.getSModelReference())) return l;
      }
    */

    //runtime models in languages
    for (Language l : project.getProjectModules(Language.class)) {
      for (ModuleReference depModule : l.getRuntimeModulesReferences()) {
        if (depModule.equals(mainModule.getModuleReference())) return owner;
      }
    }

    //accessories models in devkits

    //runtime models in devkits

    return owner;
  }

  public static IModule getModuleForModelAndRoot(MPSProject project, SModelDescriptor model, SNode node) {
    Set<String> sourceModuleUIDs = node.getSourceModuleUIDs();
    if (sourceModuleUIDs.isEmpty()) {
      return getModuleForModel(project, model);
    }

    for (IModule owner : model.getModules()) {
      if (sourceModuleUIDs.contains(owner.getModuleDescriptor().getUUID()) && project.isProjectModule(owner)) return owner;
    }

    return model.getModule();
  }

}
