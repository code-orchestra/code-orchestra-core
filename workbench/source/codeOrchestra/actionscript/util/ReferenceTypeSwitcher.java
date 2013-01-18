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
package codeOrchestra.actionscript.util;

import codeOrchestra.actionScript.scope.ActionScriptScopes;
import codeOrchestra.actionScript.stubs.ASForeignNodeIds;
import com.intellij.openapi.project.Project;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleId;
import jetbrains.mps.project.ModuleId.Foreign;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.SModelId.RegularSModelId;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ReferenceTypeSwitcher {

  private static final Logger LOG = Logger.getLogger(ReferenceTypeSwitcher.class);

  private Project project;
  private IModule referencedModule;
  private List<IModule> affectedModules = new ArrayList<IModule>();
  private List<EditableSModelDescriptor> affectedModels = new ArrayList<EditableSModelDescriptor>();
  private Map<SModelReference, SModelReference> modelReferenceMap = new HashMap<SModelReference, SModelReference>();

  public ReferenceTypeSwitcher(Project project, IModule referencedModule) {
    this.project = project;
    this.referencedModule = referencedModule;
  }

  public void makeAllReferencesForeign() {
    makeModuleDependenciesForeign();
    if (affectedModules.isEmpty()) {
      return;
    }
    makeModelImportsForeign();
    if (affectedModels.isEmpty()) {
      save();
      return;
    }
    makeNodeReferencesForeign();
    save();
  }

  private void makeModuleDependenciesForeign() {
    ModuleReference oldReference = referencedModule.getModuleReference();

    if (oldReference.getModuleId() instanceof Foreign) {
      return;
    }

    String moduleFqName = referencedModule.getModuleFqName();
    ModuleReference newReference = new ModuleReference(moduleFqName, ModuleId.fromString(Foreign.PREFIX + moduleFqName));

    Iterable<IModule> visibleModules = ActionScriptScopes.getActionScriptSolutionScope(project.getComponent(ProjectScope.class), false, referencedModule).getVisibleModules();

    for (IModule module : visibleModules) {
      List<Dependency> dependencies = module.getDependencies();
      boolean changed = false;
      for (Dependency dependency : dependencies) {
        if (dependency.getModuleRef().equals(oldReference)) {
          dependency.setModuleRef(newReference);
          changed = true;
        }
      }
      if (changed) {
        affectedModules.add(module);
      }
    }
  }

  private void makeModelImportsForeign() {
    for (SModelDescriptor importedDescriptor : SModelRepository.getInstance().getModelDescriptors(referencedModule)) {
      SModelReference reference = importedDescriptor.getSModelReference();
      if (reference.getSModelId() instanceof RegularSModelId) {
        String longName = reference.getLongName();
        SModelId foreignId = SModelId.foreign(SModelStereotype.SWC_STUB, longName);
        SModelFqName fqName = new SModelFqName(longName, SModelStereotype.SWC_STUB);
        modelReferenceMap.put(reference, new SModelReference(fqName, foreignId));
      }
    }

    for (IModule module : affectedModules) {
      for (SModelDescriptor descriptor : SModelRepository.getInstance().getModelDescriptors(module)) {
        if (!(descriptor instanceof EditableSModelDescriptor)) {
          LOG.warning("Model descriptor is not editable: " + descriptor.getLongName());
          continue;
        }

        boolean changed = false;
        for (ImportElement importElement : descriptor.getSModel().importedModels()) {
          for (SModelReference regularRef : modelReferenceMap.keySet()) {
            if (importElement.getModelReference().equals(regularRef)) {
              importElement.setModelReference(modelReferenceMap.get(regularRef));
              changed = true;
            }
          }
        }

        if (changed) {
          affectedModels.add((EditableSModelDescriptor) descriptor);
        }
      }
    }
  }

  private void makeNodeReferencesForeign() {
    for (EditableSModelDescriptor modelDescriptor : affectedModels) {
      SModel model = modelDescriptor.getSModel();
      for (SNode root : model.roots()) {
        List<SNode> nodes = root.getDescendants();
        for (SNode node : nodes) {
          List<SReference> references = node.getReferences();
          if (references.isEmpty()) {
            continue;
          }
          for (SReference reference : references) {
            if (reference instanceof StaticReference) {
              SModelReference targetSModelReference = reference.getTargetSModelReference();
              if (!modelReferenceMap.containsKey(targetSModelReference)) {
                continue;
              }
              SNode targetNode = reference.getTargetNodeSilently();
              if (targetNode == null) {
                LOG.warning("Skipped broken reference" + reference.getResolveInfo());
                continue;
              }
              SNodeId newId = ASForeignNodeIds.getId(targetNode);
              reference.setTargetSModelReference(modelReferenceMap.get(targetSModelReference));
              ((StaticReference) reference).setTargetNodeId(newId);
            } else {
              LOG.warning("Skipped non-static reference" + reference.getResolveInfo());
            }
          }
        }
      }
    }
  }

  private void save() {
    for (IModule affectedModule : affectedModules) {
      affectedModule.save();
    }
    for (EditableSModelDescriptor affectedModel : affectedModels) {
      affectedModel.save();
      affectedModel.reloadFromDisk();
    }
  }

}
