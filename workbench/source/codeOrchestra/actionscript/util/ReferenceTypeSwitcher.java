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
import jetbrains.mps.project.ModuleId.Regular;
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
public abstract class ReferenceTypeSwitcher {

  private static final Logger LOG = Logger.getLogger(ReferenceTypeSwitcher.class);
  private static final String ERROR_MESSAGE = "Methods of ReferenceTypeSwitcher should be called only once";

  private Project project;
  private IModule referencedModule;
  private List<IModule> affectedModules = new ArrayList<IModule>();
  private List<EditableSModelDescriptor> affectedModels = new ArrayList<EditableSModelDescriptor>();

  /*
    In RegularToForeign this map contains regular -> foreign pairs
    In ForeignToRegular it contains foreign -> regular
   */
  protected Map<SModelReference, SModelReference> modelReferenceMap = new HashMap<SModelReference, SModelReference>();

  private boolean invoked = false;

  public ReferenceTypeSwitcher(Project project, IModule referencedModule) {
    this.project = project;
    this.referencedModule = referencedModule;
  }

  public void switchReferences() {
    if (invoked) {
      throw new RuntimeException(ERROR_MESSAGE);
    }
    invoked = true;

    final boolean[] needToSave = new boolean[1];
    needToSave[0] = false;

    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        switchModuleDependencies();
        if (affectedModules.isEmpty()) {
          return;
        }
        switchModelImports();
        if (affectedModels.isEmpty()) {
          needToSave[0] = true;
          return;
        }
        switchNodeReferences();
        needToSave[0] = true;
      }
    });

    if (needToSave[0]) {
      ModelAccess.instance().runWriteAction(new Runnable() {
        @Override
        public void run() {
          save();
        }
      });
    }
  }

  private void switchModuleDependencies() {
    ModuleReference regularReference = referencedModule.getModuleReference();

    if (!(regularReference.getModuleId() instanceof Regular)) return;

    String moduleFqName = referencedModule.getModuleFqName();
    ModuleReference foreignReference = new ModuleReference(moduleFqName, ModuleId.fromString(Foreign.PREFIX + moduleFqName));

    Iterable<IModule> visibleModules = ActionScriptScopes.getActionScriptSolutionScope(project.getComponent(ProjectScope.class), false, referencedModule).getVisibleModules();

    for (IModule module : visibleModules) {
      if (module == referencedModule) {
        continue;
      }

      List<Dependency> dependencies = module.getDependencies();
      boolean changed = false;
      for (Dependency dependency : dependencies) {
        changed = processModuleDependency(regularReference, foreignReference, changed, dependency);
      }
      if (changed) {
        affectedModules.add(module);
      }
    }
  }

  protected abstract boolean processModuleDependency(ModuleReference regularReference, ModuleReference foreignReference, boolean changed, Dependency dependency);

  private void switchModelImports() {
    for (SModelDescriptor ownModelDescriptor : SModelRepository.getInstance().getModelDescriptors(referencedModule)) {
      SModelReference regularModelRef = ownModelDescriptor.getSModelReference();
      if (regularModelRef.getSModelId() instanceof RegularSModelId) {
        String longName = regularModelRef.getLongName();
        SModelId foreignId = SModelId.foreign(SModelStereotype.SWC_STUB, longName);
        SModelFqName fqName = new SModelFqName(longName, SModelStereotype.SWC_STUB);
        SModelReference foreignModelRef = new SModelReference(fqName, foreignId);
        putReferencesToMap(regularModelRef, foreignModelRef);
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
          for (SModelReference ref : modelReferenceMap.keySet()) {
            if (importElement.getModelReference().equals(ref)) {
              importElement.setModelReference(modelReferenceMap.get(ref));
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

  protected abstract void putReferencesToMap(SModelReference regularModelRef, SModelReference foreignModelRef);

  private void switchNodeReferences() {
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
              if (!modelReferenceMap.containsKey(reference.getTargetSModelReference())) {
                continue;
              }
              processNodeReference(reference);
            } else {
              LOG.warning("Skipped non-static reference " + reference.getResolveInfo());
            }
          }
        }
      }
    }
  }

  protected abstract void processNodeReference(SReference reference);

  private void save() {
    for (IModule affectedModule : affectedModules) {
      affectedModule.save();
    }
    for (EditableSModelDescriptor affectedModel : affectedModels) {
      affectedModel.save();
      affectedModel.reloadFromDisk();
    }
  }

  public static class RegularToForeign extends ReferenceTypeSwitcher {

    public RegularToForeign(Project project, IModule referencedModule) {
      super(project, referencedModule);
    }

    protected boolean processModuleDependency(ModuleReference regularReference, ModuleReference foreignReference, boolean changed, Dependency dependency) {
      if (dependency.getModuleRef().equals(regularReference)) {
        dependency.setModuleRef(foreignReference);
        changed = true;
      }
      return changed;
    }

    protected void putReferencesToMap(SModelReference regularModelRef, SModelReference foreignModelRef) {
      modelReferenceMap.put(regularModelRef, foreignModelRef);
    }

    protected void processNodeReference(SReference reference) {
      SNode targetNode = reference.getTargetNodeSilently();
      if (targetNode == null) {
        LOG.warning("Skipped broken reference " + reference.getResolveInfo());
        return;
      }
      SNodeId newId = ASForeignNodeIds.getId(targetNode);
      reference.setTargetSModelReference(modelReferenceMap.get(reference.getTargetSModelReference()));
      ((StaticReference) reference).setTargetNodeId(newId);
    }
  }

  public static class ForeignToRegular extends ReferenceTypeSwitcher {

    public ForeignToRegular(Project project, IModule referencedModule) {
      super(project, referencedModule);
    }

    protected boolean processModuleDependency(ModuleReference regularReference, ModuleReference foreignReference, boolean changed, Dependency dependency) {
      if (dependency.getModuleRef().equals(foreignReference)) {
        IModule alreadyResolvedModule = MPSModuleRepository.getInstance().getModule(foreignReference);
        if (alreadyResolvedModule == null) {
          dependency.setModuleRef(regularReference);
          changed = true;
        }
      }
      return changed;
    }

    protected void putReferencesToMap(SModelReference regularModelRef, SModelReference foreignModelRef) {
      modelReferenceMap.put(foreignModelRef, regularModelRef);
    }

    protected void processNodeReference(SReference reference) {
      SNodeId targetNodeId = reference.getTargetNodeId();
      if (!(targetNodeId instanceof SNodeId.Foreign)) {
        LOG.warning("Non-foreign reference " + reference.getResolveInfo());
        return;
      }
      SModelReference targetSModelReference = reference.getTargetSModelReference();
      SNode targetNode = ASForeignNodeIds.findNode((SNodeId.Foreign) targetNodeId, modelReferenceMap.get(targetSModelReference));
      if (targetNode == null) {
        LOG.warning("Cannot resolve reference " + reference.getResolveInfo());
        return;
      }
      SNodeId newId = targetNode.getSNodeId();
      reference.setTargetSModelReference(modelReferenceMap.get(targetSModelReference));
      ((StaticReference) reference).setTargetNodeId(newId);
    }
  }

}
