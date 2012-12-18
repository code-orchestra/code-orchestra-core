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
package jetbrains.mps.project.structure;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.generator.TransientModelNodeFinder;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.project.*;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.stub.ProjectStructureBuilder;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.nodeidmap.ForeignNodeIdMap;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * evgeny, 3/18/11
 */
public class ProjectStructureModule extends AbstractModule implements ApplicationComponent {

//  private static final Logger LOG = Logger.getLogger(ProjectStructureModule.class);
  private static final ModuleReference MODULE_REFERENCE = ModuleReference.fromString("642f71f8-327a-425b-84f9-44ad58786d27(jetbrains.mps.lang.project.modules)");

  private Map<SModelReference, ProjectStructureSModelDescriptor> myModels = new ConcurrentHashMap<SModelReference, ProjectStructureSModelDescriptor>();

  public static ProjectStructureModule getInstance() {
    return ApplicationManager.getApplication().getComponent(ProjectStructureModule.class);
  }

  public ProjectStructureModule(MPSModuleRepository repository, SModelRepository modelRepository) {
    setModuleReference(MODULE_REFERENCE);
    repository.addModuleRepositoryListener(new ModuleRepositoryAdapter() {
      @Override
      public void moduleAdded(IModule module) {
        refreshModule(module, false);
      }

      @Override
      public void moduleRemoved(IModule module) {
        refreshModule(module, true);
      }

      @Override
      public void moduleInitialized(IModule module) {
        refreshModule(module, false);
      }

      @Override
      public void moduleChanged(IModule module) {
        refreshModule(module, false);
      }

      @Override
      public void repositoryChanged() {
        refresh();
      }
    });
  }

  private void refreshModule(IModule module, boolean isDeleted) {
    ModelAccess.assertLegalWrite();

    if(!(module instanceof Solution || module instanceof Language || module instanceof DevKit)) {
      return;
    }

    SModelReference ref = getSModelReference(module);
    if (isDeleted) {
      ProjectStructureSModelDescriptor descriptor = myModels.get(ref);
      if (descriptor != null) {
        removeModel(descriptor);
      }
    } else if (myModels.containsKey(ref)) {
      ProjectStructureSModelDescriptor descriptor = myModels.get(ref);
      descriptor.dropModel();
    } else {
      createModel(module);
    }
  }

  public SModel getModelByModule(IModule module) {
    ModelAccess.assertLegalRead();

    if(module == null) return null;
    SModelReference ref = getSModelReference(module);

    ProjectStructureSModelDescriptor descriptor = myModels.get(ref);
    return descriptor == null ? null : descriptor.getSModel();
  }

  private void refresh() {
    ModelAccess.assertLegalWrite();

    Set<SModelReference> old = new HashSet<SModelReference>(myModels.keySet());
    for (IModule module : MPSModuleRepository.getInstance().getAllModules()) {
      if(!(module instanceof Solution || module instanceof Language || module instanceof DevKit)) {
        continue;
      }

      SModelReference ref = getSModelReference(module);
      if (myModels.containsKey(ref)) {
        old.remove(ref);
        ProjectStructureSModelDescriptor descriptor = myModels.get(ref);
        descriptor.dropModel();
      } else {
        createModel(module);
      }
    }

    for (SModelReference mm : old) {
      ProjectStructureSModelDescriptor model = myModels.get(mm);
      if (model != null) {
        removeModel(model);
      }
    }
  }

  @Override
  public void initComponent() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        MPSModuleRepository.getInstance().addModule(ProjectStructureModule.this, new MPSModuleOwner() {
        });
      }
    });
  }

  @Override
  public void disposeComponent() {
    clearAll();
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        MPSModuleRepository.getInstance().removeModule(ProjectStructureModule.this);
      }
    });
  }

  public void dispose() {
    super.dispose();
    clearAll();
  }

  public void clearAll() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        removeAll();
        SModelRepository.getInstance().unRegisterModelDescriptors(ProjectStructureModule.this);
        invalidateCaches();
        myModels.clear();
      }
    });
  }

  private void removeAll() {
    List<SModelDescriptor> models = this.getOwnModelDescriptors();
    for (SModelDescriptor model : models) {
      removeModel(model);
    }
  }

  public Class getClass(String fqName) {
    return null;
  }

  public ModuleDescriptor getModuleDescriptor() {
    return null;
  }

  public void setModuleDescriptor(ModuleDescriptor moduleDescriptor, boolean reloadClasses) {
    throw new UnsupportedOperationException();
  }

  public String getGeneratorOutputPath() {
    return null;
  }

  public String getTestsGeneratorOutputPath() {
    return null;
  }

  public void save() {
    // nothing
  }

  @Override
  public List<ModuleReference> getUsedLanguagesReferences() {
    return Collections.singletonList(BootstrapLanguages.PROJECT);
  }

  private void removeModel(SModelDescriptor md) {
    if (myModels.remove(md.getSModelReference()) != null) {
      SModelRepository.getInstance().removeModelDescriptor(md);
      if (md instanceof ProjectStructureSModelDescriptor) {
        ((ProjectStructureSModelDescriptor) md).dropModel();
      }
    }
  }

  public ProjectStructureSModelDescriptor createModel(IModule module) {
    ProjectStructureSModelDescriptor result = new ProjectStructureSModelDescriptor(getSModelReference(module), module, this);
    myModels.put(result.getSModelReference(), result);
    SModelRepository.getInstance().registerModelDescriptor(result, this);
    invalidateCaches();
    return result;
  }

  private static SModelFqName getModelFqName(IModule module) {
    return new SModelFqName(MODULE_REFERENCE.getModuleFqName(), "module." + module.getModuleFqName(), SModelStereotype.getStubStereotypeForId("project"));
  }

  private static SModelReference getSModelReference(IModule module) {
    SModelFqName fqName = getModelFqName(module);
    ModuleId moduleId = module.getModuleReference().getModuleId();
    SModelId id = moduleId != null ? SModelId.foreign("project", moduleId.toString()) : null;
    return new SModelReference(fqName, id);
  }

  public String toString() {
    return getModuleFqName();
  }

  public List<SModelDescriptor> getOwnModelDescriptors() {
    return new ArrayList<SModelDescriptor>(myModels.values());
  }

  protected ModuleScope createScope() {
    return new ProjectStructureModuleScope();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Project Structure Models Provider";
  }

  public class ProjectStructureModuleScope extends ModuleScope {
    protected Set<IModule> getInitialModules() {
      Set<IModule> result = new HashSet<IModule>();
      result.add(ProjectStructureModule.this);
      return result;
    }
  }

  public static class ProjectStructureSModelDescriptor extends BaseSModelDescriptor {
    private final IModule myModule;
    private final ProjectStructureModule myProjectStructureModule;

    private ProjectStructureSModelDescriptor(SModelReference ref, IModule module, @NotNull ProjectStructureModule projectStructureModule) {
      super(IModelRootManager.NULL_MANAGER, ref, false);
      myModule = module;
      myProjectStructureModule = projectStructureModule;
    }

    protected ModelLoadResult initialLoad() {
      ProjectStructureSModel model = new ProjectStructureSModel(getSModelReference());
      model.setLoading(true);
      final ModuleDescriptor moduleDescriptor = myModule.getModuleDescriptor();
      IFile file = myModule.getDescriptorFile();

      if (file != null && moduleDescriptor != null) {
        new ProjectStructureBuilder(moduleDescriptor, file, model) {
          @Override
          public Iterable<SModelReference> loadReferences(SNode m, ModuleDescriptor descriptor) {
            IModule module = moduleDescriptor == descriptor ? myModule :
              MPSModuleRepository.getInstance().getModule(descriptor.getModuleReference());
            if(module == null) {
              return Collections.emptyList();
            }

            return Sequence.<SModelDescriptor>fromIterable(module.getOwnModelDescriptors()).
              where(new IWhereFilter<SModelDescriptor>() {
                @Override
                public boolean accept(SModelDescriptor o) {
                  return SModelStereotype.isUserModel(o);
                }
              }).
              select(new ISelector<SModelDescriptor, SModelReference>() {
                @Override
                public SModelReference select(SModelDescriptor o) {
                  return o.getSModelReference();
                }
              });
          }
        }.convert();
      }
      return new ModelLoadResult(model, ModelLoadingState.FULLY_LOADED);
    }

    private void dropModel() {
      if (mySModel == null) return;
      final SModel oldSModel = mySModel;
      oldSModel.setModelDescriptor(null);
      mySModel = null;
      setLoadingState(ModelLoadingState.NOT_LOADED);

      Runnable modelReplacedNotifier = new Runnable() {
        public void run() {
          fireModelReplaced();
          oldSModel.dispose();
        }
      };
      if (ModelAccess.instance().isInEDT()) {
        modelReplacedNotifier.run();
      } else {
        ModelAccess.instance().runWriteInEDT(modelReplacedNotifier);
      }
    }

    @Override
    public IModule getModule() {
      return myProjectStructureModule;
    }

    @Override
    public SModelDescriptor resolveModel(SModelReference reference) {
      return myProjectStructureModule.myModels.get(reference);
    }
  }


  public static class ProjectStructureSModel extends SModel {
    public ProjectStructureSModel(@NotNull SModelReference modelReference) {
      super(modelReference, new ForeignNodeIdMap());
    }

    @Override
    protected FastNodeFinder createFastNodeFinder() {
      return new TransientModelNodeFinder(this);
    }
  }
}
