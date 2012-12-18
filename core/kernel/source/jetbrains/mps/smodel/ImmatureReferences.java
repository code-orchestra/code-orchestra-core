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
import com.intellij.openapi.components.ApplicationComponent;
import org.jetbrains.annotations.NotNull;

import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ConcurrentMap;


class ImmatureReferences implements ApplicationComponent {
  // How many threads _simultaneously_ accessing the pool are allowed to succeed without congestion
  private static final int POOL_SIZE = 4;

  private static final Object PRESENT = new Object();

  static ImmatureReferences getInstance() {
    return ApplicationManager.getApplication().getComponent(ImmatureReferences.class);
  }

  private SModelRepositoryAdapter myReposListener = new MySModelRepositoryAdapter();

  private ModelAccessAdapter myModelAccessListener = new MyModelAccessAdapter();

  private SModelRepository mySModelRepository;

  private ConcurrentMap<SModelReference, ConcurrentMap<SReferenceBase, Object>> myReferences = new ConcurrentHashMap<SModelReference, ConcurrentMap<SReferenceBase, Object>>();

  private ConcurrentLinkedQueue<ConcurrentMap<SReferenceBase, Object>> myReferencesSetPool = new ConcurrentLinkedQueue<ConcurrentMap<SReferenceBase, Object>>();

  private boolean myDisabled = true;

  ImmatureReferences(SModelRepository modelRepository) {
    mySModelRepository = modelRepository;
    for (int i = 0; i < POOL_SIZE; i++) {
      myReferencesSetPool.add(new ConcurrentHashMap<SReferenceBase, Object>());
    }
  }

  void enable() {
    myDisabled = false;
  }

  void disable() {
    myDisabled = true;
    cleanup();
  }

  @NotNull
  public String getComponentName() {
    return "Immature References";
  }

  public void initComponent() {
    mySModelRepository.addModelRepositoryListener(myReposListener);
    ModelAccess.instance().addCommandListener(myModelAccessListener);
  }

  public void cleanup() {
    for (Entry<SModelReference, ConcurrentMap<SReferenceBase, Object>> entry : myReferences.entrySet()) {
      for (SReferenceBase r : entry.getValue().keySet()) {
        r.mature();
      }
    }
    myReferences.clear();
  }

  public void disposeComponent() {
    mySModelRepository.removeModelRepositoryListener(myReposListener);
    ModelAccess.instance().removeCommandListener(myModelAccessListener);
  }

  void add(SReferenceBase ref) {
    if (myDisabled) return;
    SModelReference modelRef = ref.getSourceNode().getModel().getSModelReference();
    ConcurrentMap<SReferenceBase, Object> refSet = getOrCreateRefSet(modelRef);
    refSet.put(ref, PRESENT);
  }

  void remove(SReferenceBase ref) {
    if (myDisabled) return;
    SModelReference modelRef = ref.getSourceNode().getModel().getSModelReference();
    ConcurrentMap<SReferenceBase, Object> refSet = myReferences.get(modelRef);
    if (refSet != null) {
      refSet.remove(ref);
    }
  }

  private ConcurrentMap<SReferenceBase, Object> getOrCreateRefSet(SModelReference modelRef) {
    ConcurrentMap<SReferenceBase, Object> pooledSet;
    try {
      pooledSet = myReferencesSetPool.remove();
    }
    catch (NoSuchElementException e) {
      pooledSet = new ConcurrentHashMap<SReferenceBase, Object>();
    }
    ConcurrentMap<SReferenceBase, Object> usedSet = myReferences.putIfAbsent(modelRef, pooledSet);
    if (usedSet == null) {
      usedSet = pooledSet;
      pooledSet = new ConcurrentHashMap<SReferenceBase, Object>();
    }
    myReferencesSetPool.add(pooledSet);
    return usedSet;
  }

  private class MyModelAccessAdapter extends ModelAccessAdapter {
    public void commandFinished() {
      cleanup();
    }
  }

  private class MySModelRepositoryAdapter extends SModelRepositoryAdapter {
    public void modelRemoved(SModelDescriptor modelDescriptor) {
      ConcurrentMap<SReferenceBase, Object> refSet = myReferences.remove(modelDescriptor.getSModelReference());
      if (refSet != null) {
        refSet.clear();
      }
    }
  }
}
