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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.smodel.GlobalSModelEventsManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelAdapter;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ModelGenerationStatusManager implements ApplicationComponent {

  public static ModelGenerationStatusManager getInstance() {
    return ApplicationManager.getApplication().getComponent(ModelGenerationStatusManager.class);
  }

  private final List<ModelGenerationStatusListener> myListeners = new ArrayList<ModelGenerationStatusListener>();

  private final GlobalSModelEventsManager myGlobalEventsManager;
  private final SModelAdapter mySmodelReloadListener = new SModelAdapter() {
    @Override
    public void modelReplaced(SModelDescriptor sm) {
      ModelGenerationStatusManager.this.invalidateData(Collections.singletonList(sm));
    }
  };

  public ModelGenerationStatusManager(GlobalSModelEventsManager globalEventsManager) {
    myGlobalEventsManager = globalEventsManager;
  }

  @NotNull
  public String getComponentName() {
    return "Model Status Manager";
  }

  public void initComponent() {
    myGlobalEventsManager.addGlobalModelListener(mySmodelReloadListener);
  }

  public void disposeComponent() {
    myGlobalEventsManager.removeGlobalModelListener(mySmodelReloadListener);
  }

  public String currentHash(SModelDescriptor sm, IOperationContext operationContext) {
    return ModelDigestHelper.getInstance().getModelHashFast(sm, operationContext);
  }

  @CodeOrchestraPatch
  public boolean generationRequired(SModelDescriptor sm, IOperationContext operationContext) {
    if (!sm.isGeneratable()) return false;
    if (sm instanceof EditableSModelDescriptor && ((EditableSModelDescriptor) sm).isChanged()) return true;

    // RE-786
    if (sm.isGenerationRequired()) return true;

    // RE-3103
    return generationRequiredByHash(sm, operationContext);
  }

  @CodeOrchestraPatch
  public boolean generationRequiredByHash(SModelDescriptor sm, IOperationContext operationContext) {
    String currentHash = ModelDigestHelper.getInstance().getModelHashFast(sm, operationContext);
    if (currentHash == null) return true;

    String generatedHash = getGenerationHash(sm);
    if (generatedHash == null) return true;

    return !generatedHash.equals(currentHash);
  }

  private String getGenerationHash(@NotNull SModelDescriptor sm) {
    return getLastGenerationHash(sm);
  }

  public void invalidateData(List<SModelDescriptor> models) {
    ModelGenerationStatusListener[] copy;
    synchronized (myListeners) {
      copy = myListeners.toArray(new ModelGenerationStatusListener[myListeners.size()]);
    }
    for (SModelDescriptor model : models) {
      GenerationDependenciesCache.getInstance().clean(model);
      for (ModelGenerationStatusListener l : copy) {
        l.generatedFilesChanged(model);
      }
    }
  }

  public void addGenerationStatusListener(ModelGenerationStatusListener l) {
    synchronized (myListeners) {
      myListeners.add(l);
    }
  }

  public void removeGenerationStatusListener(ModelGenerationStatusListener l) {
    synchronized (myListeners) {
      myListeners.remove(l);
    }
  }

  public static String getLastGenerationHash(SModelDescriptor sm) {
    GenerationDependencies generationDependencies = GenerationDependenciesCache.getInstance().get(sm);
    if (generationDependencies == null) return null;

    return generationDependencies.getModelHash();
  }
}
