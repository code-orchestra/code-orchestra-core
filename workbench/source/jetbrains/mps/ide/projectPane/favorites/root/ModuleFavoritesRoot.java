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
package jetbrains.mps.ide.projectPane.favorites.root;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.List;

class ModuleFavoritesRoot extends FavoritesRoot<ModuleReference> {
  public ModuleFavoritesRoot(ModuleReference value) {
    super(value);
  }

  public MPSTreeNode getTreeNode(IOperationContext context) {
    IModule module = MPSModuleRepository.getInstance().getModule(getValue());
    if (module == null) return null;
    MPSProject mpsProject = context.getProject().getComponent(MPSProject.class);
    if (mpsProject == null) return null;
    ProjectModuleTreeNode moduleTreeNode = ProjectModuleTreeNode.createFor(mpsProject, module);
    return moduleTreeNode;
  }

  public List<SNode> getAvaliableNodes() {
    List<SNode> result = new ArrayList<SNode>();
    IModule module = MPSModuleRepository.getInstance().getModule(getValue());
    if (module == null) return result;
    for (final SModelDescriptor md : module.getOwnModelDescriptors()) {
      SModel model = ModelAccess.instance().runReadAction(new Computable<SModel>() {
        public SModel compute() {
          return md.getSModel();
        }
      });
      if (model == null) continue;

      for (SNode node:model.roots()){
        result.add(node);
      }
    }
    return result;
  }
}
