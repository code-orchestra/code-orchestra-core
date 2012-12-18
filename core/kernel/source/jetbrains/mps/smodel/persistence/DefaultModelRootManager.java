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
package jetbrains.mps.smodel.persistence;

import jetbrains.mps.library.ModelsMiner;
import jetbrains.mps.library.ModelsMiner.ModelHandle;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.refactoring.StructureModificationLog;
import jetbrains.mps.smodel.BaseSModelDescriptor.ModelLoadResult;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.nodeidmap.RegularNodeIdMap;
import jetbrains.mps.smodel.persistence.def.*;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vcs.VcsMigrationUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @author Kostik
 */
public class DefaultModelRootManager extends BaseMPSModelRootManager {
  private static final Logger LOG = Logger.getLogger(DefaultModelRootManager.class);

  @Override
  public Collection<SModelReference> collectModels(@NotNull SModelRoot root) {
    List<ModelHandle> models = new ArrayList<ModelHandle>();
    ModelsMiner.collectModelDescriptors(FileSystem.getInstance().getFileByPath(root.getPath()), root, models);
    List<SModelReference> result = new ArrayList<SModelReference>(models.size());
    for (ModelHandle model : models) {
      result.add(model.getReference());
    }
    return result;
  }

  public void updateModels(@NotNull SModelRoot root, @NotNull IModule owner) {
    readModelDescriptors(FileSystem.getInstance().getFileByPath(root.getPath()), root, owner);
  }

  @NotNull
  @Override
  public SModel loadModel(@NotNull SModelDescriptor modelDescriptor) {
    return loadModel(modelDescriptor, ModelLoadingState.FULLY_LOADED).getModel();
  }

  @NotNull
  public ModelLoadResult loadModel(final @NotNull SModelDescriptor sm, ModelLoadingState state) {
    final DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    SModelReference dsmRef = dsm.getSModelReference();

    if (!dsm.getModelFile().isReadOnly() && !dsm.getModelFile().exists()) {
      SModel model = new SModel(dsmRef, new RegularNodeIdMap());
      return new ModelLoadResult(model, ModelLoadingState.FULLY_LOADED);
    }

    ModelLoadResult result;
    try {

//      // RE-4651
//      SModelHeader descriptorSModelHeader = dsm.getDescriptorSModelHeader();
//      if (descriptorSModelHeader.getPersistenceVersion() == -1) {
//        ModelAccess.instance().runWriteAction(new Runnable() {
//          @Override
//          public void run() {
//            dsm.reloadFromDisk();
//          }
//        });
//      }


      result = ModelPersistence.readModel(dsm.getDescriptorSModelHeader(), dsm.getModelFile(), state);
      if (result.getState() == ModelLoadingState.NOT_LOADED) {
        // TODO this is a temporary fix to enable invoking merge dialog for model with wrong markup
        if (state != ModelLoadingState.NOT_LOADED) {
          VcsMigrationUtil.getHandler().addSuspiciousModel(dsm, false);
        }

        return result;
      }
    } catch (ModelFileReadException t) {
      return handleExceptionDuringModelRead(dsm, t, false);
    } catch (PersistenceVersionNotFoundException e) {
      LOG.error("Trying to load model " + dsm.getLongName() + " from file " + dsm.getModelFile().toString(), e);
      VcsMigrationUtil.getHandler().addSuspiciousModel(dsm, false);
      StubModel model = new StubModel(dsmRef);
      return new ModelLoadResult(model, ModelLoadingState.NOT_LOADED);
    }

    SModel model = result.getModel();
    if (result.getState() == ModelLoadingState.FULLY_LOADED) {
      try {
        model.setLoading(true);
        boolean needToSave = model.updateSModelReferences() || model.updateModuleReferences();

        if (needToSave && !dsm.getModelFile().isReadOnly()) {
          SModelRepository.getInstance().markChanged(model);
        }
      } finally {
        model.setLoading(false);
      }
    }

    LOG.assertLog(model.getSModelReference().equals(dsmRef),
      "\nError loading model from file: \"" + dsm.getModelFile() + "\"\n" +
        "expected model UID     : \"" + dsmRef + "\"\n" +
        "but was UID            : \"" + model.getSModelReference() + "\"\n" +
        "the model will not be available.\n" +
        "Make sure that all project's roots and/or the model namespace is correct");
    return result;
  }

  @Override
  public void saveModelRefactorings(@NotNull SModelDescriptor sm, @NotNull StructureModificationLog log) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    RefactoringsPersistence.save(dsm.getModelFile(), log);
  }

  @Override
  public StructureModificationLog loadModelRefactorings(@NotNull SModelDescriptor sm) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    return RefactoringsPersistence.load(dsm.getModelFile());
  }

  private ModelLoadResult handleExceptionDuringModelRead(EditableSModelDescriptor modelDescriptor, RuntimeException exception, boolean isConflictStateFixed) {
    VcsMigrationUtil.getHandler().addSuspiciousModel(modelDescriptor, isConflictStateFixed);
    SModel newModel = new StubModel(modelDescriptor.getSModelReference());
    LOG.error(exception.getMessage(), newModel);
    return new ModelLoadResult(newModel, ModelLoadingState.NOT_LOADED);
  }

  public boolean isFindUsagesSupported() {
    return true;
  }

  public boolean containsSomeString(@NotNull SModelDescriptor sm, @NotNull Set<String> strings) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    if (dsm.isChanged()) return true;

    IFile modelFile = dsm.getModelFile();
    if (!modelFile.exists()) return true;
    BufferedReader r = null;
    try {
      r = new BufferedReader(new InputStreamReader(modelFile.openInputStream(), FileUtil.DEFAULT_CHARSET));
      String line;
      boolean result = false;
      while ((line = r.readLine()) != null) {
        for (String s : strings) {
          if (line.contains(s)) {
            result = true;
            break;
          }
        }
      }
      return result;
    } catch (IOException e) {
      LOG.error(e);
    } finally {
      if (r != null) {
        try {
          r.close();
        } catch (IOException e) {
          LOG.error(e);
        }
      }
    }
    return true;
  }

  public boolean isEmpty(SModelDescriptor sm) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    IFile modelFile = dsm.getModelFile();
    if (!modelFile.exists()) return true;
    Reader reader = null;
    try {
      BufferedReader r = new BufferedReader(new InputStreamReader(modelFile.openInputStream(), FileUtil.DEFAULT_CHARSET));
      String line;
      while ((line = r.readLine()) != null) {
        if (line.contains("<node")) {
          return false;
        }
      }
    } catch (IOException e) {
      LOG.error(e);
    } finally {
      if (reader != null) {
        try {
          reader.close();
        } catch (IOException e) {
          LOG.error(e);
        }
      }
    }
    return true;
  }

  public boolean containsString(@NotNull SModelDescriptor modelDescriptor, @NotNull String string) {
    return containsSomeString(modelDescriptor, CollectionUtil.set(string));
  }

  /**
   * returns upgraded model, or null
   */
  public SModel saveModel(@NotNull SModelDescriptor sm) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    SModel smodel = dsm.getSModel();
    if (smodel instanceof StubModel) {
      // we do not save stub model to do not overwrite the real model
      return null;
    }
    IFile modelFile = dsm.getModelFile();
    assert modelFile != null;
    return ModelPersistence.saveModel(smodel, modelFile);
  }

  private void readModelDescriptors(IFile dir, SModelRoot modelRoot, ModelOwner owner) {
    List<ModelHandle> models = new ArrayList<ModelHandle>();
    ModelsMiner.collectModelDescriptors(dir, modelRoot, models);

    for(ModelHandle handle : models) {
      SModelDescriptor modelDescriptor;
      if (ModelPersistence.needsRecreating(handle.getFile())) {
        modelDescriptor = recreateFileAndGetInstance(this, handle.getFile().getPath(), handle.getReference(), owner, modelRoot, handle.getLoadResult());
        LOG.debug("Recreated file and read model descriptor" + modelDescriptor.getSModelReference() + "\n" + "Model root is " + modelRoot.getPath() + " " + modelRoot.getPrefix());
      } else {
        modelDescriptor = getInstance(this, handle.getFile().getPath(), handle.getReference(), handle.getLoadResult(), owner, false);
        LOG.debug("Read model descriptor " + modelDescriptor.getSModelReference() + "\n" + "Model root is " + modelRoot.getPath() + " " + modelRoot.getPrefix());
      }
    }
  }

  public boolean isNewModelsSupported() {
    return true;
  }

  @NotNull
  public SModelDescriptor createNewModel(@NotNull SModelRoot root, @NotNull SModelFqName fqName, @NotNull ModelOwner owner) {
    assert root.getPrefix().length() <= 0 || fqName.getLongName().startsWith(root.getPrefix()) : "Model name should start with model root prefix";

    IFile modelFile = createFileForModelUID(root, fqName);
    return DefaultModelRootManager.createModel(this, modelFile.getPath(), fqName, new DescriptorLoadResult(), owner);
  }

  private IFile createFileForModelUID(SModelRoot root, SModelFqName fqName) {
    String pathPrefix = root.getPrefix();
    String path = root.getPath();

    if (pathPrefix == null) pathPrefix = "";
    if (pathPrefix.length() > 0 && !fqName.getLongName().startsWith(pathPrefix)) {
      LOG.error("Model fqName \"" + fqName + "\" doesn't match name prefix \"" + pathPrefix + "\"");
    }

    String filenameSuffix = fqName.getLongName().substring(pathPrefix.length());
    if (fqName.hasStereotype()) {
      filenameSuffix = filenameSuffix + '@' + fqName.getStereotype();
    }

    return FileSystem.getInstance().getFileByPath(path + File.separator + NameUtil.pathFromNamespace(filenameSuffix) + MPSExtentions.DOT_MODEL);
  }

  private SModelDescriptor recreateFileAndGetInstance(IModelRootManager manager, String fileName, SModelReference modelReference, ModelOwner owner, SModelRoot root, DescriptorLoadResult d) {
    SModelRepository modelRepository = SModelRepository.getInstance();
    SModelDescriptor modelDescriptor = modelRepository.getModelDescriptor(modelReference);
    if (modelDescriptor != null) {
      LOG.error("can't recreate file for already loaded descriptor " + modelReference);
      return getInstance(manager, fileName, modelReference, d, owner, false);
    }
    IFile modelFile = FileSystem.getInstance().getFileByPath(fileName);
    SModelReference newModelReference = ModelPersistence.upgradeModelUID(modelReference);
    IFile newFile = createFileForModelUID(root, newModelReference.getSModelFqName());//ModelPersistence.upgradeFile(modelFile);
    newFile.createNewFile();
    IFileUtils.copyFileContent(modelFile, newFile);
    modelFile.delete();

    return getInstance(manager, newFile.getPath(), newModelReference, d, owner, true);
  }

  private static SModelDescriptor getInstance(IModelRootManager manager, String fileName, SModelReference modelReference, DescriptorLoadResult d, ModelOwner owner, boolean fireModelCreated) {
    LOG.debug("Getting model " + modelReference + " from " + fileName + " with owner " + owner);

    SModelRepository modelRepository = SModelRepository.getInstance();
    SModelDescriptor modelDescriptor = modelRepository.getModelDescriptor(modelReference);
    if (modelDescriptor == null) {
      IFile modelFile = FileSystem.getInstance().getFileByPath(fileName);
      DefaultSModelDescriptor md = new DefaultSModelDescriptor(manager, modelFile, modelReference, d);
      if (fireModelCreated) {
        modelRepository.createNewModel(md, owner);
      } else {
        modelRepository.registerModelDescriptor(md, owner);
      }
      return md;
    }

    IFile newFile = FileSystem.getInstance().getFileByPath(fileName);
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) modelDescriptor;
    if (!newFile.equals(dsm.getModelFile())) {
      // file might be not the same if user, for example, moved model file using external file manager
      ((DefaultSModelDescriptor) modelDescriptor).changeModelFile(newFile);
    }
    modelRepository.registerModelDescriptor(modelDescriptor, owner);
    return modelDescriptor;
  }

  private static SModelDescriptor createModel(IModelRootManager manager, String fileName, SModelFqName modelFqName, DescriptorLoadResult d, ModelOwner owner) {
    LOG.debug("create model uid=\"" + modelFqName.getLongName() + "\" file=\"" + fileName + "\" owner: " + owner);

    // RF-836
//    SModelRepository modelRepository = SModelRepository.getInstance();
//    if (modelRepository.getModelDescriptor(modelFqName) != null) {
//      LOG.error("Couldn't create new model \"" + modelFqName.getLongName() + "\" because such model exists");
//    }

    DefaultSModelDescriptor modelDescriptor = new DefaultSModelDescriptor(manager, FileSystem.getInstance().getFileByPath(fileName), new SModelReference(modelFqName, SModelId.generate()), d);
    SModelRepository.getInstance().createNewModel(modelDescriptor, owner);
    modelDescriptor.getSModel();
    return modelDescriptor;
  }


  public void rename(SModelDescriptor sm, SModelFqName modelFqName, boolean changeFile) {
    DefaultSModelDescriptor dsm = (DefaultSModelDescriptor) sm;
    if (!changeFile) {
      dsm.save();
      return;
    }
    IFile oldFile = dsm.getModelFile();
    SModelRoot root = ModelRootUtil.getSModelRoot(sm);
    IFile newFile = createFileForModelUID(root, modelFqName);
    newFile.getParent().mkdirs();
    newFile.createNewFile();
    dsm.changeModelFile(newFile);
    dsm.save();
    oldFile.delete();
  }
}

