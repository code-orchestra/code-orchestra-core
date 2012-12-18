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
package jetbrains.mps.stubs;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.project.SModelRoot.ManagerNotFoundException;
import jetbrains.mps.project.structure.model.ModelRootManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.nodeidmap.ForeignNodeIdMap;
import jetbrains.mps.smodel.persistence.AbstractModelRootManager;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.*;

//one myThisManager per stub path MUST be created
public abstract class BaseStubModelRootManager extends AbstractModelRootManager {
  private static final Logger LOG = Logger.getLogger(BaseStubModelRootManager.class);
  private static final Object LOCK = new Object();

  @CodeOrchestraPatch
  private Object cacheMonitor = new Object();
  @CodeOrchestraPatch
  private Map<StubLocation, Set<IStubRootNodeDescriptor>> stubDescriptorsCache = new HashMap<StubLocation, Set<IStubRootNodeDescriptor>>();

  private Set<BaseStubModelDescriptor> myDescriptorsWithListener = new HashSet<BaseStubModelDescriptor>();
  private ModelUpdater myInitializationListener = new ModelUpdater() {
    public void updateModel(BaseStubModelDescriptor sm, SModel model) {
      updateModelInLoadingState(sm, model);
      sm.removeModelUpdater(this);
      myDescriptorsWithListener.remove(sm);
    }
  };

  private StubLocation myLocation;
  private ModelRootManager myThisManager;

  protected BaseStubModelRootManager() {
    myThisManager = new ModelRootManager(getSelfModuleId(), this.getClass().getName());
  }

  public final void updateModels(@NotNull SModelRoot root, @NotNull IModule module) {
    updateModels(root.getPath(), root.getPrefix(), module);
  }

  public final Set<BaseStubModelDescriptor> updateModels(String path, String prefix, @NotNull IModule module) {
    myLocation = new StubLocation(path, prefix, module.getModuleReference());

    Set<BaseStubModelDescriptor> models = new HashSet<BaseStubModelDescriptor>();

    try {
      models = getModelDescriptors(myLocation);
    } catch (Throwable t) {
      LOG.error(t);
    }

    updateModels(path, prefix, module, models);

    return models;
  }

  @CodeOrchestraPatch
  public Set<IStubRootNodeDescriptor> getCachedRootNodeDescriptors(StubLocation location) {
    synchronized (cacheMonitor) {
      Set<IStubRootNodeDescriptor> stubDescriptors = stubDescriptorsCache.get(location);
      if (stubDescriptors == null) {
        stubDescriptors = getRootNodeDescriptors(location);
        stubDescriptorsCache.put(location, stubDescriptors);
      }

      return stubDescriptors;
    }
  }

  public void updateModels(String path, String prefix, @NotNull IModule module, Set<BaseStubModelDescriptor> models) {
    if (myLocation == null) {
      myLocation = new StubLocation(path, prefix, module.getModuleReference());
    }

    SModelRepository repository = SModelRepository.getInstance();
    for (BaseStubModelDescriptor descriptor : models) {
      descriptor.addStubPath(new StubPath(myLocation.getPath(), myThisManager));

      SModelDescriptor oldDescr = repository.getModelDescriptor(descriptor.getSModelReference());
      if (oldDescr == null) {
        repository.registerModelDescriptor(descriptor, module);
      } else {
        descriptor = (BaseStubModelDescriptor) oldDescr;

        // RE-2059
        SModelRepository.getInstance().addOwnerForDescriptor(descriptor, module);
        //LOG.assertLog(oldDescr.getModule() == module, descriptor.getSModelReference().toString() + " :: " + oldDescr.getModule().getModuleFqName() + " --->> " + module.getModuleFqName());
      }

      descriptor.setModelRootManager(this);
      if (descriptor.getLoadingState() == ModelLoadingState.NOT_LOADED) {
        if (!myDescriptorsWithListener.contains(descriptor)) {
          descriptor.addModelUpdater(myInitializationListener);
          myDescriptorsWithListener.add(descriptor);
        }
      } else {
        updateModelInLoadingState(descriptor, descriptor.getSModel());
      }
    }
  }

  @NotNull
  public final SModel loadModel(@NotNull SModelDescriptor modelDescriptor) {
    SModel model = new SModel(modelDescriptor.getSModelReference(), new ForeignNodeIdMap());

    model.setLoading(true);
    try {
      Set<Language> languages = new HashSet<Language>();

      try {
        languages = getLanguagesToImport();
      } catch (Throwable t) {
        LOG.error(t);
      }

      for (Language l : languages) {
        model.addLanguage(l.getModuleReference());
      }
    } catch (Throwable t) {
      LOG.error(t);
    } finally {
      model.setLoading(false);
    }

    return model;
  }

  public final SModel saveModel(@NotNull SModelDescriptor modelDescriptor) {
    return null;
  }

  @CodeOrchestraPatch
  public final void dispose() {
    for (BaseStubModelDescriptor sm : myDescriptorsWithListener) {
      sm.removeModelUpdater(myInitializationListener);
    }

    stubDescriptorsCache.clear(); // RE-1419
  }

  private void updateModelInLoadingState(BaseStubModelDescriptor descriptor, SModel model) {
    if (!StubReloadManager.getInstance().needsUpdate(descriptor, myLocation)) return;

    synchronized (LOCK){
      boolean wasLoading = model.isLoading();
      model.setLoading(true);
      try {
        updateModel(myLocation, model, descriptor.getSource());
      } catch (Throwable t) {
        LOG.error(t);
      } finally {
        model.setLoading(wasLoading);
      }
    }
  }

  public Set<IStubRootNodeDescriptor> getRootNodeDescriptors(StubLocation location) {
    return Collections.emptySet();
  }

  protected abstract Set<BaseStubModelDescriptor> getModelDescriptors(StubLocation location);

  @Deprecated
  protected synchronized void updateModel(StubLocation location, SModel model) {
  }

  protected synchronized void updateModel(StubLocation location, SModel model, StubSource source) {
    updateModel(location, model);
  }

  protected abstract Set<Language> getLanguagesToImport();

  protected abstract String getSelfModuleId();

  public static IModelRootManager create(String moduleId, String className) throws ManagerNotFoundException {
    AbstractModule mod = ((AbstractModule) MPSModuleRepository.getInstance().getModuleById(ModuleId.fromString(moduleId)));
    if (mod == null) {
      String msg = "Module with id " + moduleId + " not found for stubs loader " + className + ". Some stub models won't be loaded.";
      throw new ManagerNotFoundException(msg);
    }

    return create(mod, className);
  }

  public static IModelRootManager create(AbstractModule mod, String className) throws ManagerNotFoundException {
    // TODO: fixme
    // hack -- avoid "harmless exceptions" to be reported if the module hasn't been loaded yet
    if (!(MPSModuleRepository.getInstance().isKnownModule(mod))) {
      return null;
    }
    Class managerClass = mod.getClass(className);
    if (managerClass == null) {
      throw new ManagerNotFoundException("Manager class " + className + " not found in module " + mod.getModuleFqName());
    }

    try {
      return (IModelRootManager) managerClass.newInstance();
    } catch (Throwable t) {
      throw new ManagerNotFoundException("Problems during instantiating manager " + className, t);
    }
  }
}
