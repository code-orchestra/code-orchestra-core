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
package jetbrains.mps.cache;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.*;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class CachesManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(CachesManager.class);

  private final ClassLoaderManager myClassLoaderManager;
  private final SModelRepository mySModelRepository;

  private ConcurrentMap<Object, AbstractCache> myCaches = new ConcurrentHashMap<Object, AbstractCache>();
  private ConcurrentMap<AbstractCache, ModelEventRouter> myModelEventRouters = new ConcurrentHashMap<AbstractCache, ModelEventRouter>();
  private ConcurrentMap<Object, List<SModelDescriptor>> myDependsOnModels = new ConcurrentHashMap<Object, List<SModelDescriptor>>();
  private SModelRepositoryAdapter myModelRepoListener = new SModelRepositoryAdapter() {
    public void modelRemoved(SModelDescriptor modelDescriptor) {
      onModelRemoved(modelDescriptor);
    }
  };

  private ReloadAdapter myCLMListener = new ReloadAdapter() {
    public void unload() {
      removeAllCaches();
    }
  };

  public static CachesManager getInstance() {
    return ApplicationManager.getApplication().getComponent(CachesManager.class);
  }

  public CachesManager(ClassLoaderManager classLoaderManager, SModelRepository repo) {
    myClassLoaderManager = classLoaderManager;
    mySModelRepository = repo;
  }

  public void initComponent() {
    mySModelRepository.addModelRepositoryListener(myModelRepoListener);
    myClassLoaderManager.addReloadHandler(myCLMListener);
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myCLMListener);
    mySModelRepository.removeModelRepositoryListener(myModelRepoListener);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Caches Manager";
  }

  private AbstractCache putCache(Object key, AbstractCache cache, List<SModelDescriptor> dependsOnModels) {
    // register
    myDependsOnModels.put(key, dependsOnModels);
    ModelEventRouter eventRouter = new ModelEventRouter(cache);
    myModelEventRouters.put(cache, eventRouter);
    for (SModelDescriptor dependsOnModel : dependsOnModels) {
      dependsOnModel.addModelListener(eventRouter);
    }

    // publish
    AbstractCache existing = myCaches.putIfAbsent(key, cache);
    if (existing != null) {
      // already exists => cleanup
      myModelEventRouters.remove(cache);
      myDependsOnModels.remove(key);
      for (SModelDescriptor dependsOnModel : dependsOnModels) {
        dependsOnModel.removeModelListener(eventRouter);
      }
      cache.clearCache();
      return existing;
    }
    return cache;
  }

  public <T> AbstractCache getCache(Object key, T element, CacheCreator<T> creator) {
    AbstractCache result = myCaches.get(key);
    if (result != null || element == null || creator == null) return result;
    result = creator.create(key, element);
    Set<SModelDescriptor> descriptorSet = result.getDependsOnModels(element);
    if (descriptorSet.contains(null)) {
      LOG.error("Dependent models for cache contains null", new Throwable());
      descriptorSet.remove(null);
    }
    return putCache(key, result, new ArrayList<SModelDescriptor>(descriptorSet));
  }

  public void removeCache(Object key) {
    AbstractCache cache = myCaches.remove(key);
    if (cache == null) return;
    ModelEventRouter eventRouter = myModelEventRouters.remove(cache);
    List<SModelDescriptor> dependsOnModels = myDependsOnModels.remove(key);
    if (eventRouter != null && dependsOnModels != null) {
      for (SModelDescriptor dependsOnModel : dependsOnModels) {
        dependsOnModel.removeModelListener(eventRouter);
      }
    }
    cache.clearCache();
  }

  private void removeAllCaches() {
    while (!myCaches.isEmpty()) {
      List<Object> keys = new ArrayList<Object>(myCaches.keySet());
      for (Object key : keys) {
        removeCache(key);
      }
    }
  }

  public void removeGenerationCaches() {
    removeAllCaches();
  }

  private void onModelRemoved(SModelDescriptor modelDescriptor) {
    List<Object> keysToRemove = new ArrayList<Object>();
    SModelReference reference = modelDescriptor.getSModelReference();
    for (Object key : myDependsOnModels.keySet()) {
      List<SModelDescriptor> dependsOnModels = myDependsOnModels.get(key);
      if (dependsOnModels == null) {
        continue;
      }
      for (SModelDescriptor dependsOnModel : dependsOnModels) {
        if (dependsOnModel.getSModelReference().equals(reference)) {
          keysToRemove.add(key);
        }
      }
    }

    for (Object key : keysToRemove) {
      removeCache(key);
    }
  }

  public interface CacheCreator<T> {
    AbstractCache create(Object key, T element);
  }

  private static class ModelEventRouter extends SModelAdapter {
    private AbstractCache myCache;

    public ModelEventRouter(AbstractCache cache) {
      super(SModelListenerPriority.PLATFORM);
      myCache = cache;
    }

    // model listener
    public final void loadingStateChanged(SModelDescriptor model, boolean isLoading) {
      if (!isLoading) {
        // model went out of loading state - drop cache because we don't know what has happened while in loading state
        CachesManager.getInstance().removeCache(myCache.getKey());
      }
    }

    @Override
    public void modelReplaced(SModelDescriptor md) {
      CachesManager.getInstance().removeCache(myCache.getKey());
    }

    public void languageAdded(SModelLanguageEvent event) {
      myCache.languageAdded(event);
    }

    public void languageRemoved(SModelLanguageEvent event) {
      myCache.languageRemoved(event);
    }

    public void importAdded(SModelImportEvent event) {
      myCache.importAdded(event);
    }

    public void importRemoved(SModelImportEvent event) {
      myCache.importRemoved(event);
    }

    public void devkitAdded(SModelDevKitEvent event) {
      myCache.devkitAdded(event);
    }

    public void devkitRemoved(SModelDevKitEvent event) {
      myCache.devkitRemoved(event);
    }

    public void rootAdded(SModelRootEvent event) {
      myCache.rootAdded(event);
    }

    public void rootRemoved(SModelRootEvent event) {
      myCache.rootRemoved(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getRoot())) {
          dataSet.rootRemoved(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void beforeRootRemoved(SModelRootEvent event) {
      myCache.beforeRootRemoved(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getRoot())) {
          dataSet.beforeRootRemoved(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void propertyChanged(SModelPropertyEvent event) {
      myCache.propertyChanged(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getNode())) {
          dataSet.propertyChanged(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void childAdded(SModelChildEvent event) {
      myCache.childAdded(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getParent())) {
          dataSet.childAdded(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void childRemoved(SModelChildEvent event) {
      myCache.childRemoved(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        Set<SNode> dependsOnNodes = dataSet.getDependsOnNodes();
        if (dependsOnNodes.contains(event.getParent()) || dependsOnNodes.contains(event.getChild())) {
          dataSet.childRemoved(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void beforeChildRemoved(SModelChildEvent event) {
      myCache.beforeChildRemoved(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        Set<SNode> dependsOnNodes = dataSet.getDependsOnNodes();
        if (dependsOnNodes.contains(event.getParent()) || dependsOnNodes.contains(event.getChild())) {
          dataSet.beforeChildRemoved(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void referenceAdded(SModelReferenceEvent event) {
      myCache.referenceAdded(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getReference().getSourceNode())) {
          dataSet.referenceAdded(event);
          if (!myCache.isAttached()) return;
        }
      }
    }

    public void referenceRemoved(SModelReferenceEvent event) {
      myCache.referenceRemoved(event);
      if (!myCache.isAttached()) return;
      for (DataSet dataSet : myCache.getDataSets()) {
        if (dataSet.getDependsOnNodes().contains(event.getReference().getSourceNode())) {
          dataSet.referenceRemoved(event);
          if (!myCache.isAttached()) return;
        }
      }
    }
  }
}

