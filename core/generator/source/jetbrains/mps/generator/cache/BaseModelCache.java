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
package jetbrains.mps.generator.cache;

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.util.containers.BidirectionalMap;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.StreamHandler;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.SModelRepositoryAdapter;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public abstract class BaseModelCache<T> implements ApplicationComponent {

  protected final Map<SModelDescriptor, T> myCache = new WeakHashMap<SModelDescriptor, T>();
  protected final BidirectionalMap<IFile, SModelDescriptor> myFilesToModels = new BidirectionalMap<IFile, SModelDescriptor>();
  private final BaseModelCache<T>.MyCacheGenerator myCacheGenerator;
  private SModelRepository myModelRepository;
  private final SModelRepositoryAdapter myModelRepositoryListener = new MyModelRepositoryListener();

  @Nullable
  protected abstract T readCache(SModelDescriptor model);

  protected abstract void saveCache(@NotNull T t, SModelDescriptor model, StreamHandler handler);

  protected abstract T generateCache(GenerationStatus status);

  public abstract String getCacheFileName();

  protected abstract IFile getCacheFile(SModelDescriptor modelDescriptor);

  protected BaseModelCache(SModelRepository modelRepository) {
    myModelRepository = modelRepository;
    myCacheGenerator = new MyCacheGenerator();
  }

  public CacheGenerator getGenerator() {
    return myCacheGenerator;
  }

  public void initComponent() {
    myModelRepository.addModelRepositoryListener(myModelRepositoryListener);
  }

  public void disposeComponent() {
    myModelRepository.removeModelRepositoryListener(myModelRepositoryListener);
  }

  @Nullable
  public T get(@NotNull SModelDescriptor modelDescriptor) {
    synchronized (myCache) {
      if (myCache.containsKey(modelDescriptor)) {
        return myCache.get(modelDescriptor);
      }

      myFilesToModels.put(getCacheFile(modelDescriptor), modelDescriptor);
      T cache = readCache(modelDescriptor);
      myCache.put(modelDescriptor, cache);

      return cache;
    }
  }

  public SModelDescriptor invalidateCacheForFile(IFile file) {
    SModelDescriptor md;
    synchronized (myCache) {
      md = myFilesToModels.get(file);
      if (md != null) {
        myCache.remove(md);
        myFilesToModels.remove(file);
      }
    }
    return md;
  }

  @CodeOrchestraPatch
  private void invalidateCacheForModel(SModelDescriptor md) {
    synchronized (myCache) {
      // RE-3978 - we create a collection copy to avoid concurrent modifications
      List<IFile> files = myFilesToModels.getKeysByValue(md);
      if (files == null) {
        return;
      }

      List<IFile> filesCopy = new ArrayList(files);
      if (filesCopy.size() != 0) {
        // RE-3103
        // assert file.size() == 1;
        for (IFile file : filesCopy) {
          invalidateCacheForFile(file);
        }
      }
    }
  }

  public List<IFile> getCachesDirs(IModule m) {
    List<IFile> result = new ArrayList<IFile>();

    if (m.getGeneratorOutputPath() != null) {
      IFile file = getCachesDirInternal(m, m.getGeneratorOutputPath());
      if (file != null) {
        result.add(file);
      }
    }

    if (m.getTestsGeneratorOutputPath() != null) {
      IFile file = getCachesDirInternal(m, m.getTestsGeneratorOutputPath());
      if (file != null) {
        result.add(file);
      }
    }

    return result;
  }

  @Nullable
  protected IFile getCachesDirInternal(IModule module, String outputPath) {
    return getCachesDir(module, outputPath);
  }

  @Nullable
  public static IFile getCachesDir(IModule module, String outputPath) {
    if (outputPath == null) return null;

    if (module.isPackaged()) {
      String suffix = outputPath;
      int index = outputPath.replace("\\", "/").lastIndexOf("/");
      if (index >= 0) {
        suffix = outputPath.substring(index + 1);
      }
      IFile descriptorFile;
      if (module instanceof Generator) {
        descriptorFile = ((Generator) module).getSourceLanguage().getDescriptorFile();
      } else {
        descriptorFile = module.getDescriptorFile();
      }
      return descriptorFile.getParent().getParent().getDescendant(FileGenerationUtil.getCachesPath(suffix));
    } else {
      return FileSystem.getInstance().getFileByPath(FileGenerationUtil.getCachesPath(outputPath));
    }
  }

  protected class MyCacheGenerator implements CacheGenerator {
    public void generateCache(GenerationStatus status, StreamHandler handler) {
      T cache = BaseModelCache.this.generateCache(status);
      if (cache == null) return;

      SModelDescriptor model = status.getOriginalInputModel();

      synchronized (myCache) {
        myCache.put(model, cache);
      }

      saveCache(cache, model, handler);
    }
  }

  protected void cleanup () {
    synchronized (myCache) {
      myCache.clear();
    }
  }

  public void clean(SModelDescriptor model) {
    synchronized (myCache) {
      myCache.remove(model);
    }
  }

  private class MyModelRepositoryListener extends SModelRepositoryAdapter {
    @Override
    public void beforeModelDeleted(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }

    @Override
    public void beforeModelFileChanged(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }

    @Override
    public void beforeModelRemoved(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }

    @Override
    public void modelCreated(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }

    @Override
    public void modelAdded(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }

    @Override
    public void modelRenamed(SModelDescriptor modelDescriptor) {
      invalidateCacheForModel(modelDescriptor);
    }
  }
}
