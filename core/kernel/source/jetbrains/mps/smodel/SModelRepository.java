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
package jetbrains.mps.smodel;

import com.intellij.openapi.application.Application;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.utils.LiveCodingUtils;
import gnu.trove.THashMap;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.ide.vfs.IdeaFile;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.event.SModelFileChangedEvent;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.event.SModelRenamedEvent;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

public class SModelRepository implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(SModelRepository.class);

  private static SModelRepository ourInstance = null;

  public static SModelRepository getInstance() {
    if (ourInstance == null) {
      Application application = ApplicationManager.getApplication();
      if (application != null) {
        ourInstance = application.getComponent(SModelRepository.class);
      }
    }
    return ourInstance;
  }

  private final Map<String, EditableSModelDescriptor> myCanonicalPathsToModelDescriptorMap = new ConcurrentHashMap<String, EditableSModelDescriptor>();
  private final Map<SModelId, SModelDescriptor> myIdToModelDescriptorMap = new ConcurrentHashMap<SModelId, SModelDescriptor>();
  private final Map<SModelFqName, SModelDescriptor> myFqNameToModelDescriptorMap = new ConcurrentHashMap<SModelFqName, SModelDescriptor>();

  private final Object myModelsLock = new Object();
  private final Map<SModelDescriptor, List<ModelOwner>> myModelsWithOwners = new THashMap<SModelDescriptor, List<ModelOwner>>();
  private final Map<ModelOwner, Set<SModelDescriptor>> myModelsByOwner = new THashMap<ModelOwner, Set<SModelDescriptor>>();

  private final Object myListenersLock = new Object();
  private final List<SModelRepositoryListener> mySModelRepositoryListeners = new ArrayList<SModelRepositoryListener>();

  private SModelListener myModelsListener = new ModelChangeListener();

  public SModelRepository() {

  }

  public void initComponent() {

  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "SModel Repository";
  }

  public void disposeComponent() {

  }

  public void refreshModels() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        LOG.debug("Model refresh");

        for (SModelDescriptor m : getModelDescriptors()) {
          m.refresh();
        }

        LOG.debug("Model refresh done");
      }
    });
  }

  public EditableSModelDescriptor findModel(IFile modelFile) {
    String canonicalPath = IFileUtils.getCanonicalPath(modelFile);
    return myCanonicalPathsToModelDescriptorMap.get(canonicalPath);
  }

  public void addModelRepositoryListener(@NotNull SModelRepositoryListener l) {
    synchronized (myListenersLock) {
      mySModelRepositoryListeners.add(l);
    }
  }

  public void removeModelRepositoryListener(@NotNull SModelRepositoryListener l) {
    synchronized (myListenersLock) {
      mySModelRepositoryListeners.remove(l);
    }
  }

  private List<SModelRepositoryListener> listeners() {
    synchronized (myListenersLock) {
      return new ArrayList<SModelRepositoryListener>(mySModelRepositoryListeners);
    }
  }

  public List<SModelDescriptor> getModelDescriptors() {
    synchronized (myModelsLock) {
      return new ArrayList<SModelDescriptor>(myModelsWithOwners.keySet());
    }
  }

  public List<SModelDescriptor> getModelDescriptorsByModelName(String modelName) {
    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    for (SModelDescriptor d : getModelDescriptors()) {
      if (modelName.equals(d.getLongName())) {
        result.add(d);
      }
    }
    return result;
  }

  /**
   * do not call this method unless you do it from some ModelRootManager
   */
  public void createNewModel(EditableSModelDescriptor modelDescriptor, ModelOwner owner) {
    ModelAccess.assertLegalWrite();

    registerModelDescriptor(modelDescriptor, owner);
    modelDescriptor.setChanged(true);
    fireModelCreatedEvent(modelDescriptor);
  }

  @CodeOrchestraPatch
  public void deleteModel(SModelDescriptor modelDescriptor) {
    ModelAccess.assertLegalWrite();

    fireModelWillBeDeletedEvent(modelDescriptor);
    removeModelDescriptor(modelDescriptor);

    if (modelDescriptor instanceof EditableSModelDescriptor) {
      IFile modelFile = ((EditableSModelDescriptor) modelDescriptor).getModelFile();
      if (modelFile != null && modelFile.exists()) {
        modelFile.delete();
        ((IdeaFile) modelFile.getParent()).refresh();
      }
    }
    SModelRepository.getInstance().fireModelDeletedEvent(modelDescriptor);
  }

  public void registerModelDescriptor(SModelDescriptor modelDescriptor, ModelOwner owner) {
    synchronized (myModelsLock) {
      List<ModelOwner> owners = myModelsWithOwners.get(modelDescriptor);
      if (owners != null && owners.contains(owner)) return;

      SModelReference modelReference = modelDescriptor.getSModelReference();
      SModelDescriptor registeredModel = getModelDescriptor(modelReference);

      LOG.assertLog(registeredModel == null || registeredModel == modelDescriptor,
        "Another model \"" + modelReference + "\" is already registered for " + owner);

      LOG.assertLog(owners == null || !owners.contains(owner),
        "Another model \"" + modelReference + "\" is already registered for " + owner);

      if (owners == null) {
        owners = new ArrayList<ModelOwner>(1);
        myModelsWithOwners.put(modelDescriptor, owners);
      }

      Set<SModelDescriptor> ownerModels = myModelsByOwner.get(owner);
      if (ownerModels == null) {
        ownerModels = new HashSet<SModelDescriptor>();
        myModelsByOwner.put(owner, ownerModels);
      }

      ownerModels.add(modelDescriptor);
      owners.add(owner);

      if (modelReference.getSModelId() != null) {
        myIdToModelDescriptorMap.put(modelReference.getSModelId(), modelDescriptor);
      }
      myFqNameToModelDescriptorMap.put(modelDescriptor.getSModelReference().getSModelFqName(), modelDescriptor);

      if (modelDescriptor instanceof EditableSModelDescriptor) {
        addModelToFileCache(((EditableSModelDescriptor) modelDescriptor));
      }
      addListeners(modelDescriptor);
    }
    fireModelAdded(modelDescriptor);
  }

  public void unRegisterModelDescriptor(SModelDescriptor md, ModelOwner owner) {
    synchronized (myModelsLock) {
      List<ModelOwner> owners = myModelsWithOwners.get(md);
      if (!owners.remove(owner)) throw new IllegalStateException();

      Set<SModelDescriptor> ownerModels = myModelsByOwner.get(owner);
      if (ownerModels != null) {
        ownerModels.remove(md);
      }

      fireModelOwnerRemoved(md, owner);

      if (owners.isEmpty()) {
        removeModelDescriptor(md);
      }
    }
  }

  public void removeModelDescriptor(SModelDescriptor md) {
    synchronized (myModelsLock) {
      fireBeforeModelRemoved(md);
      List<ModelOwner> owners = myModelsWithOwners.get(md);
      if(owners != null) {
        for (ModelOwner owner : owners) {
          Set<SModelDescriptor> ownerModels = myModelsByOwner.get(owner);
          if (ownerModels != null) {
            ownerModels.remove(md);
          }
        }
      }
      myModelsWithOwners.remove(md);
      if (md.getSModelReference().getSModelId() != null) {
        myIdToModelDescriptorMap.remove(md.getSModelReference().getSModelId());
      }
      myFqNameToModelDescriptorMap.remove(md.getSModelReference().getSModelFqName());
      if (md instanceof EditableSModelDescriptor) {
        boolean result = removeModelFromFileCache(((EditableSModelDescriptor) md));
        LOG.assertLog(result, "model " + md + " do not have a path in file cache");
      }
      removeListeners(md);
      fireModelRemoved(md);
      md.dispose();
    }
  }

  public void unRegisterModelDescriptors(ModelOwner owner) {
    for (SModelDescriptor sm : getModelDescriptors(owner)) {
      unRegisterModelDescriptor(sm, owner);
    }
  }

  private void addListeners(SModelDescriptor modelDescriptor) {
    modelDescriptor.addModelListener(myModelsListener);
  }

  private void removeListeners(SModelDescriptor modelDescriptor) {
    modelDescriptor.removeModelListener(myModelsListener);
  }

  private boolean myWasError = false;

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    if (modelReference == null) return null;
    SModelId id = modelReference.getSModelId();

    //todo remove this code
    if (id == null) {
      SModelFqName fqName = modelReference.getSModelFqName();
      if (fqName == null) return null;

      if (InternalFlag.isInternalMode()) {
        if (!myWasError) {
          myWasError = true;
          LOG.warning("getModelDescriptor() is executed by fqName. This is likely to cause problems. And it is veeery slow.");
        }
      }

      return getModelDescriptor(fqName);
    }

    return myIdToModelDescriptorMap.get(id);
  }

  public List<SModelDescriptor> getModelDescriptors(ModelOwner modelOwner) {
    /*
    synchronized (myModelsLock) {
      ArrayList<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
      for (Entry<SModelDescriptor, List<ModelOwner>> entry : myModelsWithOwners.entrySet()) {
        if (entry.getValue().contains(modelOwner)) {
          result.add(entry.getKey());
        }
      }
      return result;
    }
    */
    synchronized (myModelsLock) {
      Set<SModelDescriptor> result = myModelsByOwner.get(modelOwner);
      if(result == null || result.size() == 0) return Collections.emptyList();
      return new ArrayList<SModelDescriptor>(result);
    }
  }

  private void addModelToFileCache(EditableSModelDescriptor modelDescriptor) {
    IFile modelFile = modelDescriptor.getModelFile();
    if (modelFile == null) return;
    myCanonicalPathsToModelDescriptorMap.put(IFileUtils.getCanonicalPath(modelFile), modelDescriptor);
  }

  private boolean removeModelFromFileCache(EditableSModelDescriptor modelDescriptor) {
    IFile modelFile = modelDescriptor.getModelFile();
    if (modelFile == null) return true;
    SModelDescriptor sd = myCanonicalPathsToModelDescriptorMap.remove(IFileUtils.getCanonicalPath(modelFile));
    return sd == modelDescriptor;
  }

  @CodeOrchestraPatch
  private List<EditableSModelDescriptor> getModelsToSave() {
    LiveCodingManager liveCodingManager = LiveCodingManager.instance();

    List<EditableSModelDescriptor> modelsToSave = new ArrayList<EditableSModelDescriptor>();
    for (SModelDescriptor md : myModelsWithOwners.keySet()) {
      if (md instanceof EditableSModelDescriptor) {
        EditableSModelDescriptor emd = ((EditableSModelDescriptor) md);

        // HOTFIX MPS-13326
        if (emd.isChanged() && !emd.isPackaged()) {
          modelsToSave.add(emd);
        }

        // RE-4481
        if (liveCodingManager != null && liveCodingManager.isLiveCodingGenerationInProgress() && LiveCodingUtils.LIVE_CODING_MODEL_FQNAME.equals(emd.getSModelReference().getSModelFqName())) {
          modelsToSave.add(emd);
        }
      }
    }
    return modelsToSave;
  }

  public void saveAll() {
    ModelAccess.assertLegalWrite();

    List<EditableSModelDescriptor> modelsToRefresh;
    synchronized (myModelsLock) {
      modelsToRefresh = getModelsToSave();
    }
    for (EditableSModelDescriptor emd : modelsToRefresh) {
      FileSystem.getInstance().refresh(emd.getModelFile());
    }

    synchronized (myModelsLock) {
      for (EditableSModelDescriptor emd : getModelsToSave()) {
        try {
          emd.save();
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    }
  }

  public Set<ModelOwner> getOwners(SModelDescriptor modelDescriptor) {
    synchronized (myModelsLock) {
      List<ModelOwner> modelOwners = myModelsWithOwners.get(modelDescriptor);
      if (modelOwners == null || modelOwners.size() == 0) return Collections.emptySet();
      if (modelOwners.size() == 1) return Collections.singleton(modelOwners.get(0));
      return new HashSet<ModelOwner>(modelOwners);
    }
  }

  private void fireBeforeModelRemoved(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.beforeModelRemoved(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelRemoved(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelRemoved(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelAdded(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelAdded(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelRenamed(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelRenamed(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelFileChanged(SModelDescriptor modelDescriptor, IFile from) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelFileChanged(modelDescriptor, from);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelOwnerAdded(SModelDescriptor modelDescriptor, ModelOwner owner) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelOwnerAdded(modelDescriptor, owner);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelOwnerRemoved(SModelDescriptor modelDescriptor, ModelOwner owner) {
    for (SModelRepositoryListener l : listeners()) {
      try {
        l.modelOwnerRemoved(modelDescriptor, owner);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelCreatedEvent(SModelDescriptor modelDescriptor) {
    MPSModuleRepository.getInstance().invalidateCaches();

    for (SModelRepositoryListener listener : listeners()) {
      try {
        listener.modelCreated(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelDeletedEvent(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener listener : listeners()) {
      try {
        listener.modelDeleted(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelWillBeDeletedEvent(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener listener : listeners()) {
      try {
        listener.beforeModelDeleted(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireBeforeModelFileChangedEvent(SModelDescriptor modelDescriptor) {
    for (SModelRepositoryListener listener : listeners()) {
      try {
        listener.beforeModelFileChanged(modelDescriptor);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }


  //-------todo: changed functionality - is better to be moved to SModelDescriptor fully

  @Deprecated
  private void markChanged(SModel model, boolean changed) {
    SModelDescriptor modelDescriptor = model.getModelDescriptor();
    if (modelDescriptor instanceof EditableSModelDescriptor) {
      ((EditableSModelDescriptor) modelDescriptor).setChanged(changed);
    }
  }

  @Deprecated
  public void markChanged(SModel model) {
    markChanged(model, true);
  }

  @Deprecated
  public void markUnchanged(SModel model) {
    markChanged(model, false);
  }

  @Deprecated
  public SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    if (fqName == null) return null;
    return myFqNameToModelDescriptorMap.get(fqName);
  }

  @CodeOrchestraPatch
  public Set<IModule> getModules(SModelDescriptor baseSModelDescriptor) {
    Set<IModule> modules = new HashSet<IModule>();

    for (ModelOwner modelOwner : getOwners(baseSModelDescriptor)) {
      if (modelOwner instanceof IModule) {
        modules.add((IModule) modelOwner);
      }
    }

    return modules;
  }

  @CodeOrchestraPatch
  public void addOwnerForDescriptor(SModelDescriptor modelDescriptor, ModelOwner owner) {
    synchronized (myModelsLock) {
      // 1 - add to myModelsWithOwners
      List<ModelOwner> modelOwners = myModelsWithOwners.get(modelDescriptor);
      if (modelOwners == null) {
        modelOwners = new ArrayList<ModelOwner>();
        myModelsWithOwners.put(modelDescriptor, modelOwners);
      }
      if (!modelOwners.contains(owner)) {
        modelOwners.add(owner);
      }

      // 2 - add to myModelsByOwner
      Set<SModelDescriptor> ownedModels = myModelsByOwner.get(owner);
      if (ownedModels == null) {
        ownedModels = new HashSet<SModelDescriptor>();
        myModelsByOwner.put(owner, ownedModels);
      }
      ownedModels.add(modelDescriptor);
    }
  }

  private class ModelChangeListener extends SModelAdapter {
    public ModelChangeListener() {
      super(SModelListenerPriority.PLATFORM);
    }

    public void modelChanged(SModel model) {
      markChanged(model);
    }

    public void modelChangedDramatically(SModel model) {
      markChanged(model);
    }

    public void beforeModelRenamed(SModelRenamedEvent event) {
      SModelDescriptor md = event.getModelDescriptor();
      if (!(md instanceof EditableSModelDescriptor)) return;
      removeModelFromFileCache(((EditableSModelDescriptor) md));
    }

    public void modelRenamed(SModelRenamedEvent event) {
      synchronized (myModelsLock) {
        myFqNameToModelDescriptorMap.remove(event.getOldName());
        myFqNameToModelDescriptorMap.put(event.getNewName(), event.getModelDescriptor());
      }
      SModelDescriptor md = event.getModelDescriptor();
      if (md instanceof EditableSModelDescriptor) {
        addModelToFileCache(((EditableSModelDescriptor) md));
      }
      fireModelRenamed(md);

      CleanupManager.getInstance().cleanup();
      MPSModuleRepository.getInstance().invalidateCaches();
    }

    public void beforeModelFileChanged(SModelFileChangedEvent event) {
      SModelDescriptor md = event.getModelDescriptor();
      if (md instanceof EditableSModelDescriptor) {
        removeModelFromFileCache(((EditableSModelDescriptor) md));
      }
    }

    public void modelFileChanged(SModelFileChangedEvent event) {
      SModelDescriptor md = event.getModelDescriptor();
      if (md instanceof EditableSModelDescriptor) {
        addModelToFileCache(((EditableSModelDescriptor) md));
      }
    }
  }
}
