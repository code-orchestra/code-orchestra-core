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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.generator.ModelDigestUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.refactoring.StructureModificationLog;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.event.EventUtil;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelFileChangedEvent;
import jetbrains.mps.smodel.persistence.BaseMPSModelRootManager;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.smodel.persistence.def.DescriptorLoadResult;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.vcs.VcsMigrationUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public class DefaultSModelDescriptor extends BaseSModelDescriptor implements EditableSModelDescriptor {
  private static final Logger LOG = Logger.getLogger(DefaultSModelDescriptor.class);

  private Map<String, String> myMetadata;
  private SModelHeader myHeader;

  private final Object myRefactoringHistoryLock = new Object();
  private StructureModificationLog myStructureModificationLog;

  private long myLastChange;

  private long myDiskTimestamp = -1;

  private IFile myModelFile;
  private boolean myChanged = false;

  private final Object myFullLoadSync = new Object();

  {
    this.addModelCommandListener(new SModelCommandListener() {
      public void eventsHappenedInCommand(List<SModelEvent> events) {
        if (EventUtil.isChange(events)) {
          myLastChange = System.currentTimeMillis();
        }
      }
    });
  }

  public DefaultSModelDescriptor(IModelRootManager manager, IFile modelFile, SModelReference modelReference) {
    this(manager, modelFile, modelReference, new DescriptorLoadResult(), true);
  }

  public DefaultSModelDescriptor(IModelRootManager manager, IFile modelFile, SModelReference modelReference, DescriptorLoadResult d) {
    this(manager, modelFile, modelReference, d, true);
  }

  protected DefaultSModelDescriptor(IModelRootManager manager, IFile modelFile, SModelReference modelReference, DescriptorLoadResult d, boolean checkDup) {
    super(manager, modelReference, checkDup);
    myModelFile = modelFile;
    myHeader = d.getHeader();
    myMetadata = d.getMetadata();
    updateLastChange();
  }

  protected ModelLoadResult initialLoad() {
    ModelLoadResult result = load(ModelLoadingState.ROOTS_LOADED);
    tryFixingVersion(result.getModel().getSModelHeader());
    updateDiskTimestamp();
    return result;
  }

  //updates model with loading state == ROOTS_LOADED
  public void enforceFullLoad() {
    synchronized (myFullLoadSync) {
      if (mySModel.isLoading()) return;
      if (getLoadingState() == ModelLoadingState.FULLY_LOADED) return;

      runModelLoading(
        new Computable<ModelLoadResult>() {
          public ModelLoadResult compute() {
            SModel fullModel = load(ModelLoadingState.FULLY_LOADED).getModel();
            fullModel.setLoading(true);

            try {
              mySModel.setLoading(true);
              new ModelLoader(mySModel, fullModel).update();
              setLoadingState(ModelLoadingState.FULLY_LOADED);
              fireModelStateChanged(ModelLoadingState.ROOTS_LOADED, ModelLoadingState.FULLY_LOADED);
            } finally {
              mySModel.setLoading(false);
            }

            return null;
          }
        }
      );
    }
  }
  //just loads model, w/o changing state of SModelDescriptor
  private ModelLoadResult load(ModelLoadingState loadingState) {
    return ((BaseMPSModelRootManager) myModelRootManager).loadModel(this, loadingState);
  }

  public IFile getModelFile() {
    return myModelFile;
  }

  public void setModelFile(IFile file) {
    myModelFile = file;
  }

  public boolean isChanged() {
    return myChanged;
  }

  public void setChanged(boolean changed) {
    myChanged = changed;
  }

  public void reloadFromDiskSafe() {
    if (isChanged()) {
      resolveDiskConflict();
    } else {
      reloadFromDisk();
    }
  }

  /**
   * This method should be called either in EDT, inside WriteAction or in any other thread
   */
  public void reloadFromDisk() {
    ModelAccess.assertLegalWrite();

    IFile modelFile = getModelFile();

    if (modelFile == null || !modelFile.exists()) {
      SModelRepository.getInstance().deleteModel(this);
      return;
    }

    DescriptorLoadResult dr = ModelPersistence.loadDescriptor(modelFile);
    myHeader = dr.getHeader();
    myMetadata = dr.getMetadata();

    if (getLoadingState() == ModelLoadingState.NOT_LOADED) return;

    ModelLoadResult result = load(getLoadingState());
    replaceModel(result.getModel(), getLoadingState());
    updateLastChange();
    LOG.assertLog(!needsReloading());
  }

  public int getPersistenceVersion() {
    return getSModelHeader().getPersistenceVersion();
  }

  @NotNull
  public StructureModificationLog getStructureModificationLog() {
    synchronized (myRefactoringHistoryLock) {
      if (myStructureModificationLog == null) {
        myStructureModificationLog = myModelRootManager.loadModelRefactorings(this);
      }
      if (myStructureModificationLog == null) {
        myStructureModificationLog = new StructureModificationLog();
      }
    }
    return myStructureModificationLog;
  }

  public void saveStructureModificationLog(@NotNull StructureModificationLog log) {
    myStructureModificationLog = log;
    myModelRootManager.saveModelRefactorings(this, log);
  }

  public long lastChangeTime() {
    return myLastChange;
  }

  private void resolveDiskConflict() {
    ApplicationManager.getApplication().invokeLater(new Runnable() {
      public void run() {
        final boolean needSave = VcsMigrationUtil.getHandler().resolveDiskMemoryConflict(myModelFile, mySModel);
        if (needSave) {
          ModelAccess.instance().runWriteActionInCommand(new Runnable() {
            public void run() {
              updateDiskTimestamp();
              save();
            }
          });
        } else {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              reloadFromDisk();
            }
          });
        }
      }
    }, ModalityState.NON_MODAL);
  }

  public void save() {
    ModelAccess.assertLegalWrite();

    if (getLoadingState() == ModelLoadingState.NOT_LOADED) return;

    //we must be in command since model save might change model by adding model/language imports
    //if (!mySModel.isLoading()) LOG.assertInCommand();

    LOG.info("Saving model " + mySModel.getSModelFqName());

    if (needsReloading()) {
      LOG.warning("Model file " + mySModel.getSModelFqName() + " was modified externally!\n" +
        "You might want to turn \"Synchronize files on frame activation/deactivation\" option on to avoid conflicts.");
      resolveDiskConflict();
      return;
    }

    // Paranoid check to avoid saving model during update (hack for MPS-6772)
    if (needsReloading()) return;

    setChanged(false);
    SModel newData = myModelRootManager.saveModel(this);
    if (newData != null) {
      replaceModel(newData);
    }

    updateDiskTimestamp();

    fireModelSaved();
  }

  public boolean needsReloading() {
    if (myDiskTimestamp == -1) return false;
    return fileTimestamp() != myDiskTimestamp;
  }

  public boolean isPackaged() {
    return FileSystem.getInstance().isPackaged(getModelFile());
  }

  @Override
  public boolean isGeneratable() {
    return !isDoNotGenerate() && !isPackaged() && SModelStereotype.isUserModel(this);
  }

  @Override
  public String getModelHash() {
    IFile file = getModelFile();
    if (file == null) return null;

    return ModelDigestUtil.hash(file);
  }

  @Override
  public void replaceModel(SModel newModel, ModelLoadingState state) {
    if (newModel==mySModel) return;
    myStructureModificationLog = null;
    setChanged(false);
    super.replaceModel(newModel, state);
  }

  public void dispose() {
    UnregisteredNodes.instance().clear(getSModelReference());
    super.dispose();
  }

  @Override
  public void setDoNotGenerate(boolean value) {
    ModelAccess.assertLegalWrite();

    getSModelHeader().setDoNotGenerate(value);
  }

  @Override
  public boolean isDoNotGenerate() {
    return getSModelHeader().isDoNotGenerate();
  }

  @Override
  public void poke() {
    this.myLastChange = System.currentTimeMillis();
  }

  public int getVersion() {
    return getSModelHeader().getVersion();
  }

  public void setVersion(int newVersion) {
    ModelAccess.assertLegalWrite();

    getSModelHeader().setVersion(newVersion);
  }

  public String getAttribute(String key) {
    return myMetadata.get(key);
  }

  public void setAttribute(String key, String value) {
    ModelAccess.assertLegalWrite();

    if (value == null) {
      myMetadata.remove(key);
    } else {
      myMetadata.put(key, value);
    }
  }

  public SModelHeader getDescriptorSModelHeader() {
    return myHeader;
  }

  public SModelHeader getSModelHeader() {
    SModel model = mySModel;
    if (model != null) {
      return model.getSModelHeader();
    }
    return myHeader;
  }

  public Map<String, String> getMetaData() {
    return Collections.unmodifiableMap(myMetadata);
  }

  protected void checkModelDuplication() {
    SModelDescriptor anotherModel = SModelRepository.getInstance().getModelDescriptor(myModelReference);
    if (anotherModel != null) {
      String message = "Model already registered: " + myModelReference + "\n";
      message += "file = " + myModelFile + "\n";

      if (anotherModel instanceof EditableSModelDescriptor) {
        message += "another model's file = " + ((EditableSModelDescriptor) anotherModel).getModelFile();
      } else {
        message += "another model is non-editable";
      }
      LOG.error(message);
    }
  }

  protected void updateDiskTimestamp() {
    myDiskTimestamp = fileTimestamp();
  }

  public void changeModelFile(IFile newModelFile) {
    ModelAccess.assertLegalWrite();

    IFile oldFile = myModelFile;
    if (oldFile.getPath().equals(newModelFile.getPath())) return;

    SModel model = getSModel();
    fireBeforeModelFileChanged(new SModelFileChangedEvent(model, oldFile, newModelFile));
    myModelFile = newModelFile;
    updateDiskTimestamp();
    fireModelFileChanged(new SModelFileChangedEvent(model, oldFile, newModelFile));
  }

  private long fileTimestamp() {
    IFile file = getModelFile();
    if (file == null || !file.exists()) return -1;
    return file.lastModified();
  }

  private void tryFixingVersion(SModelHeader header) {
    if (getVersion() != -1) return;

    int latestVersion = getStructureModificationLog().getLatestVersion(getSModelReference());
    myStructureModificationLog = null;  // we don't need to keep log in memory
    if (latestVersion != -1) {
      header.setVersion(latestVersion);
      LOG.error("Version for model " + getSModelReference().getSModelFqName() + " was not set.");
    }
  }

  public String toString() {
    return getSModelReference().toString();
  }

  private void updateLastChange() {
    myLastChange = myModelFile != null ? myModelFile.lastModified() : System.currentTimeMillis();
    myDiskTimestamp = myLastChange;
  }
}
