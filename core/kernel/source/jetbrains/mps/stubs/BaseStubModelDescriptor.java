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

import gnu.trove.THashSet;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.StubPath;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.util.annotation.ImmutableObject;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public final class BaseStubModelDescriptor extends BaseSModelDescriptor implements Cloneable {
  private static final Logger LOG = Logger.getLogger(BaseStubModelDescriptor.class);

  private List<StubPath> myStubPaths;
  private boolean myNeedsReloading = true;
  private String myManagerClass;

  private final Object myUpdatersLock = new Object();
  private Set<ModelUpdater> myUpdaters = null;

  private final StubSource mySource;

  //todo left for compatibility. Should be removed
  public BaseStubModelDescriptor(IModelRootManager manager, IFile modelFile, SModelReference modelReference) {
    this(manager, modelReference, true, modelFile != null ? new FileStubSource(modelFile) : null);
  }

  public BaseStubModelDescriptor(IModelRootManager manager, SModelReference modelReference, @Nullable StubSource stubSource) {
    this(manager, modelReference, true, stubSource);
  }

  protected BaseStubModelDescriptor(IModelRootManager manager, SModelReference modelReference, boolean checkDup, StubSource source) {
    super(manager, modelReference, checkDup);
    this.mySource = source;
    updateManagerId();
  }

  public BaseStubModelDescriptor copy(BaseStubModelRootManager manager) {
    return new BaseStubModelDescriptor(manager, myModelReference, false, mySource);
  }

  private void updateAfterLoad(SModel model) {
    synchronized (myUpdatersLock) {
      if (myUpdaters != null) {
        Set<ModelUpdater> updCopy = new THashSet<ModelUpdater>(myUpdaters);
        for (ModelUpdater updater : updCopy) {
          updater.updateModel(this, model);
        }
      }
      myNeedsReloading = false;
    }
  }

  public void addModelUpdater(ModelUpdater updater) {
    synchronized (myUpdatersLock) {
      if (myUpdaters == null) {
        myUpdaters = new THashSet<ModelUpdater>(1);
      }
      myUpdaters.add(updater);
    }
  }

  @CodeOrchestraPatch
  public void removeModelUpdater(ModelUpdater updater) {
    synchronized (myUpdatersLock) {
      // RE-1419
      if (myUpdaters != null) {
        myUpdaters.remove(updater);
        if (myUpdaters.isEmpty()) {
          myUpdaters = null;
        }
      }
    }
  }

  public void addStubPath(StubPath sp) {
    if (myStubPaths == null) {
      myStubPaths = new ArrayList<StubPath>();
    }

    if (myStubPaths.contains(sp)) return;

    myStubPaths.add(sp);
  }

  public List<StubPath> getPaths() {
    return myStubPaths == null ? Collections.<StubPath>emptyList() : myStubPaths;
  }

  public boolean isNeedsReloading() {
    return myNeedsReloading;
  }

  public void markReload() {
    myNeedsReloading = true;
  }

  public void unmarkReload() {
    myNeedsReloading = false;
  }

  public void setModelRootManager(IModelRootManager modelRootManager) {
    myModelRootManager = modelRootManager;
    updateManagerId();
  }

  public String getManagerClass() {
    return myManagerClass;
  }

  private void updateManagerId() {
    if (myModelRootManager == null) return;
    myManagerClass = myModelRootManager.getClass().getName();
  }

  public StubSource getSource() {
    return mySource;
  }

  //------------common descriptor stuff-------------------


  protected void setLoadingState(ModelLoadingState state) {
    assert state != ModelLoadingState.ROOTS_LOADED : "this state can't be used for stub models for now";
    super.setLoadingState(state);
  }

  protected ModelLoadResult initialLoad() {
    SModel model = myModelRootManager.loadModel(this);
    try {
      updateAfterLoad(model);
    } catch (Throwable t) {
      LOG.error("Error on model load. Model: " + model.getLongName(), t);
    }
    return new ModelLoadResult(model, ModelLoadingState.FULLY_LOADED);
  }

  @ImmutableObject
  public static class FileStubSource implements StubSource {
    private IFile myFile;

    public FileStubSource(IFile file) {
      myFile = file;
    }

    public IFile getFile() {
      return myFile;
    }
  }
}
