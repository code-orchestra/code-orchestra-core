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
package jetbrains.mps.project;

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class StubModelsResolver {
  private static StubModelsResolver ourInstance;

  public static StubModelsResolver getInstance() {
    if (ourInstance == null) {
      ourInstance = new StubModelsResolver();
    }
    return ourInstance;
  }

  private Map<Pair<ModuleReference, SModelFqName>, Set<SModelReference>> myStubModulesCache = new HashMap<Pair<ModuleReference, SModelFqName>, Set<SModelReference>>();

  private StubModelsResolver() {
    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(new SModelCommandListener() {
      public void eventsHappenedInCommand(List<SModelEvent> events) {
        //make it more optimal
        myStubModulesCache.clear();
      }
    });
  }

  public Set<SModelReference> resolveModel(IModule module, SModelFqName name, @Nullable SNodeId nodeId) {
    Pair<ModuleReference, SModelFqName> key = new Pair<ModuleReference, SModelFqName>(module.getModuleReference(), name);
    ensureInitialized(key);

    Set<SModelReference> models = myStubModulesCache.get(key);
    if (nodeId == null) return new HashSet<SModelReference>(models);

    Set<SModelReference> result = new HashSet<SModelReference>();
    for (SModelReference ref : models) {
      SModel m = SModelRepository.getInstance().getModelDescriptor(ref).getSModel();
      if (m.getNodeById(nodeId) != null) {
        result.add(ref);
      }
    }

    return result;
  }

  private void ensureInitialized(Pair<ModuleReference, SModelFqName> key) {
    if (myStubModulesCache.containsKey(key)) return;

    IModule module = MPSModuleRepository.getInstance().getModule(key.o1);
    Set<SModelDescriptor> visibleModels = new HashSet<SModelDescriptor>(IterableUtil.asCollection(module.getScope().getModelDescriptors()));

    fillCacheWithModels(key, visibleModels);
  }

  private void fillCacheWithModels(Pair<ModuleReference, SModelFqName> key, Iterable<SModelDescriptor> models) {
    if (!myStubModulesCache.containsKey(key)) {
      myStubModulesCache.put(key, new HashSet<SModelReference>());
    }

    for (SModelDescriptor model : models) {
      if (!model.getSModelReference().getSModelFqName().equals(key.o2)) continue;
      Set<SModelReference> modelsFromCache = myStubModulesCache.get(key);
      modelsFromCache.add(model.getSModelReference());
    }
  }
}
