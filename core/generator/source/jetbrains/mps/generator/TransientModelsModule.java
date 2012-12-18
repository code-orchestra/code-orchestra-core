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
package jetbrains.mps.generator;

import com.intellij.util.containers.ConcurrentHashSet;
import jetbrains.mps.generator.TransientModelsComponent.TransientSwapSpace;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.AbstractModule;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class TransientModelsModule extends AbstractModule {
  private static final Logger LOG = Logger.getLogger(TransientModelsModule.class);

  private static final AtomicInteger ourModuleCounter = new AtomicInteger();

  private final IModule myOriginalModule;
  private final TransientModelsComponent myComponent;

  private Set<String> myModelsToKeep = new ConcurrentHashSet<String>();
  private Map<SModelFqName, SModelDescriptor> myModels = new ConcurrentHashMap<SModelFqName, SModelDescriptor>();
  private Set<SModelDescriptor> myPublished = new ConcurrentHashSet<SModelDescriptor>();

  //the second parameter is needed because there is a time dependency -
  //MPSProject must be disposed after TransientModelsModule for
  //the module's models to be disposed

  public TransientModelsModule(IModule original, TransientModelsComponent component) {
    myComponent = component;
    myOriginalModule = original;
    ModuleReference reference = ModuleReference.fromString(original.getModuleFqName() + "@transient" + ourModuleCounter.getAndIncrement());
    setModuleReference(reference);
  }

  public void initModule() {
    MPSModuleRepository.getInstance().addModule(TransientModelsModule.this, new MPSModuleOwner() {
    });
  }

  public void disposeModule() {
    clearAll();
    MPSModuleRepository.getInstance().removeModule(TransientModelsModule.this);
  }

  public void releaseModule () {
    MPSModuleRepository.getInstance().removeModule(TransientModelsModule.this);
  }

  public Class getClass(String fqName) {
    if (myOriginalModule == null) {
      throw new IllegalStateException();
    }
    return myOriginalModule.getClass(fqName);
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

  public boolean hasPublished() {
    return !myPublished.isEmpty();
  }

  public void dispose() {
    super.dispose();
    clearAll();
  }

  public void clearAll() {
    removeAll();
    SModelRepository.getInstance().unRegisterModelDescriptors(this);
    invalidateCaches();
    myModelsToKeep.clear();
    myPublished.clear();
    myModels.clear();
  }

  public void removeAll() {
    List<SModelDescriptor> models = this.getOwnModelDescriptors();
    for (SModelDescriptor model : models) {
      removeModel(model);
    }
  }

  public void clearUnused() {
    List<SModelDescriptor> models = this.getOwnModelDescriptors();
    for (SModelDescriptor model : models) {
      if (!myModelsToKeep.contains(model.getSModelReference().toString())) {
        removeModel(model);
      }
      else {
        unloadModel (model);
      }
    }
  }

  public boolean addModelToKeep(SModel model, boolean force) {
    assert model instanceof TransientSModel;
    if (!myComponent.canKeepOneMore() && !force) {
      // maximum number of models reached
      return myModelsToKeep.contains(model.getSModelReference().toString());
    }
    myModelsToKeep.add(model.getSModelReference().toString());
    return true;
  }

  public boolean isModelToKeep(SModel model) {
    assert model instanceof TransientSModel;
    return myModelsToKeep.contains(model.getSModelReference().toString());
  }

  private boolean isValidName(String longName, String stereotype) {
    SModelFqName sModelFqName = new SModelFqName(longName, stereotype);
    return
      SModelRepository.getInstance().getModelDescriptor(sModelFqName) == null
        && !myModels.containsKey(sModelFqName);
  }

  public boolean publishTransientModel(SModelDescriptor model) {
    if (myModels.containsKey(model.getSModelReference().getSModelFqName())) {
      if (myPublished.add(model)) {
        SModelRepository.getInstance().registerModelDescriptor(model, this);
        return true;
      }
    }
    return false;
  }

  public void removeModel(SModelDescriptor md) {
    if (myModels.remove(md.getSModelReference().getSModelFqName()) != null) {
      if (myPublished.remove(md)) {
        SModelRepository.getInstance().removeModelDescriptor(md);
      }
      if (md instanceof TransientSModelDescriptor) {
        ((TransientSModelDescriptor)md).dropModel();
      }
    }
  }

  private void unloadModel(SModelDescriptor model) {
    if (myModels.containsKey(model.getSModelReference().getSModelFqName())) {
      if (model instanceof TransientSModelDescriptor) {
        if (((TransientSModelDescriptor)model).unloadModel()) {
          if (myPublished.contains(model)) {
            SModelRepository.getInstance().removeModelDescriptor(model);
          }
        }
      }
    }
  }

  public void publishAll() {
    List<SModelDescriptor> models = this.getOwnModelDescriptors();
    for (SModelDescriptor model : models) {
      publishTransientModel(model);
    }
  }

  @CodeOrchestraPatch
  public SModelDescriptor createTransientModel(final String longName, String stereotype) {
    while (!isValidName(longName, stereotype)) {
      stereotype += "_";
    }

    SModelFqName fqName = new SModelFqName(longName, stereotype);
    SModelDescriptor result = new TransientSModelDescriptor(fqName, longName);

    myModels.put(result.getSModelReference().getSModelFqName(), result);
    invalidateCaches();

    // RE-4209
    GlobalSModelEventsManager.getInstance().fireTransientSModelCreated((TransientSModelDescriptor) result);

    return result;
  }

  public String toString() {
    return getModuleFqName();
  }

  public List<SModelDescriptor> getOwnModelDescriptors() {
    return new ArrayList<SModelDescriptor>(myModels.values());
  }

  public List<SModelDescriptor> getHiddenModelDescriptors() {
    return new ArrayList<SModelDescriptor>(myModels.values());
  }

  protected ModuleScope createScope() {
    return new TransientModuleScope();
  }

  public class TransientModuleScope extends ModuleScope {
    protected Set<IModule> getInitialModules() {
      Set<IModule> result = new HashSet<IModule>();
      result.add(TransientModelsModule.this);
      for (IModule m : GlobalScope.getInstance().getVisibleModules()) {
        result.add(m);
      }
      return result;
    }

    protected Set<Language> getInitialUsedLanguages() {
      return CollectionUtil.filter(Language.class, getInitialModules());
    }
  }

  @CodeOrchestraPatch
  public class TransientSModelDescriptor extends BaseSModelDescriptor {
    private final String myLongName;
    private boolean wasUnloaded = false;
    private boolean wasObsolete = false;

    private TransientSModelDescriptor(SModelFqName fqName, String longName) {
      super(IModelRootManager.NULL_MANAGER, new SModelReference(fqName, SModelId.generate()), false);
      myLongName = longName;
    }

    @CodeOrchestraPatch
    protected ModelLoadResult initialLoad() {
      TransientSModel model;
      if (wasUnloaded) {
        LOG.debug("Re-loading "+getSModelReference());

        TransientSwapSpace swap = myComponent.getTransientSwapSpace();
        if (swap == null) { throw new IllegalStateException("no swap space"); }

        model = swap.restoreFromSwap(getSModelReference());
        if (model == null) { throw new IllegalStateException("lost swapped out model"); }

        // RE-3993
        model.setObsolete(wasObsolete);
      }
      else{
        model = new TransientSModel(getSModelReference());
      }
      return new ModelLoadResult(model, ModelLoadingState.FULLY_LOADED);
    }

    @CodeOrchestraPatch
    private boolean unloadModel() {
      if (!wasUnloaded) {
        LOG.debug("Un-loading "+getSModelReference());

        TransientSwapSpace swap = myComponent.getTransientSwapSpace();

        // RE-3993
        TransientSModel transientSModel = (TransientSModel) mySModel;
        if (transientSModel != null) {
          wasObsolete = transientSModel.isObsolete();
        }

        if (swap == null || !swap.swapOut(transientSModel)) { return false; }

        dropModel();

        this.wasUnloaded = true;
      }
      return false;
    }

    private void dropModel() {
      if (mySModel != null) {
        LOG.debug("Dropped "+getSModelReference());

        this.mySModel = null;
        fireModelReplaced();
        setLoadingState(ModelLoadingState.NOT_LOADED);
      }
    }

    @Override
    public IModule getModule() {
      return TransientModelsModule.this;
    }

    @Override
    public SModelDescriptor resolveModel(SModelReference reference) {
      if (reference.getLongName().equals(myLongName)) {
        SModelDescriptor descriptor = myModels.get(reference.getSModelFqName());
        if (descriptor != null) {
          return descriptor;
        }
      }
      return super.resolveModel(reference);
    }

    public void loadModel () {

    }

  }

}
