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
package jetbrains.mps.migration20.stages;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.migration20.stages.util.ModelResolveCache;
import jetbrains.mps.migration20.stages.util.ModelResolveCache.ModelResolveRes;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

import java.util.*;


public class StubConversionStage implements MigrationStage {
  public String title() {
    return "Stubs Conversion";
  }

  public void execute(MPSProject p) {
    for (Language l : p.getProjectModules(Language.class)) {
      Set<SModelReference> toRemove = new HashSet<SModelReference>();
      Set<SModelReference> toAdd = new HashSet<SModelReference>();

      List<SModelReference> acc = l.getModuleDescriptor().getAccessoryModels();
      for (SModelReference ref : acc) {
        if (!(ref.getSModelId() instanceof SModelId.ForeignSModelId)) continue;

        toRemove.add(ref);

        for (SModelDescriptor md : l.getScope().getModelDescriptors()) {
          if (md.getLongName().equals(ref.getLongName())) {
            toAdd.add(md.getSModelReference());
            break;
          }
        }
      }

      acc.removeAll(toRemove);
      acc.addAll(toAdd);

      l.save();
    }

    reResolveStubRefs(p);
    SModelRepository.getInstance().saveAll();

    for (IModule module : p.getModules()) {
      module.save();
    }
    SModelRepository.getInstance().saveAll();
    ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
  }

  public boolean needsCommand() {
    return true;
  }

  public String messageBefore() {
    return "As the stubs model format was changed, MPS will now try to correct references to stub models.\n" +
      "Now MPS will find all references to stub models and try to resolve them in the scope of containing module, then in global scope.";
  }

  public String messageAfter() {
    return null;
  }

  //------------------------

  private static Res reResolveStubRefs(MPSProject p) {
    Res res = new Res();
    boolean reloadNeeded = false;

    ModelResolveCache cache = new ModelResolveCache();
    for (IModule module : collectModulesWithGenerators(p)) {
      cache.clearModuleCache();

      for (SModelDescriptor d : module.getOwnModelDescriptors()) {
        if (!(d instanceof EditableSModelDescriptor)) continue;
        if (!(SModelStereotype.isUserModel(d))) continue;

        Set<SModelReference> toRemove = new HashSet<SModelReference>();
        for (SNode node : d.getSModel().nodes()) {
          for (SReference ref : node.getReferences()) {
            SModelReference targetModel = ref.getTargetSModelReference();
            if (targetModel == null) continue;

            SModelId modelId = targetModel.getSModelId();
            SNodeId nodeId = ref.getTargetNodeId();

            if (modelId instanceof SModelId.RegularSModelId) continue;
            if (ref.getTargetNode() != null) continue;

            String oldId = ((SModelId.ForeignSModelId) modelId).getId();
            ModelResolveRes replacement = cache.resolveModel(module, oldId, nodeId);
            if (replacement.needReload) {
              SModelDescriptor model = SModelRepository.getInstance().getModelDescriptor(replacement.replacement);
              ModuleReference moduleRef = model.getModule().getModuleReference();
              module.addDependency(moduleRef, false);
              reloadNeeded = true;
            }

            if (replacement.replacement != null) {
              toRemove.add(targetModel);

              d.getSModel().addModelImport(replacement.replacement, false);
              ref.setTargetSModelReference(replacement.replacement);

              res.fixed++;
            } else {
              res.failed++;
            }
          }
        }
      }
    }
    if (reloadNeeded) {
      ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
    }
    return res;
  }

  private static List<IModule> collectModulesWithGenerators(MPSProject p) {
    List<IModule> modules = p.getModules();
    List<IModule> generators = new ArrayList<IModule>();
    for (IModule m : modules) {
      if (m instanceof Language) {
        generators.addAll(((Language) m).getGenerators());
      }
    }
    modules.addAll(generators);
    return modules;
  }

  private static class Res {
    int fixed = 0;
    int failed = 0;
  }
}
