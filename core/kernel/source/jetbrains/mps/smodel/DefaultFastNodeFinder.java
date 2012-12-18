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

import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.smodel.event.SModelChildEvent;
import jetbrains.mps.smodel.event.SModelRootEvent;

import java.util.*;


public class DefaultFastNodeFinder implements FastNodeFinder {
  private final Object myLock = new Object();

  private SModel myModel;
  private SModelDescriptor myModelDescriptor;
  private boolean myInitialized;
  private SModelAdapter myListener = new MySModelAdapter();

  private Map<String, Set<SNode>> myNodes = new THashMap<String, Set<SNode>>();

  public DefaultFastNodeFinder(SModel model) {
    myModel = model;
    myModelDescriptor = model.getModelDescriptor();
    myModelDescriptor.addModelListener(myListener);
  }

  @Override
  public void dispose() {
    synchronized (myLock) {
      myInitialized = false;
      myNodes.clear();
    }
    myModelDescriptor.removeModelListener(myListener);
  }

  private void initCache() {
    for (SNode root : myModel.roots()) {
      addToCache(root);
    }
    myInitialized = true;
  }

  @Override
  public List<SNode> getNodes(String conceptFqName, boolean includeInherited) {
    // notify 'model nodes read access'
    myModel.rootsIterator();

    // pre-loading model to avoid deadlock (model loading process requires a lock)
    // model cannot be unloaded afterwards, because we have model read access
    myModel.enforceFullLoad();

    synchronized (myLock) {
      if (!myInitialized) {
        initCache();
      }

      final List<SNode> result = new ArrayList<SNode>();

      if (includeInherited) {
        for (String d : LanguageHierarchyCache.getInstance().getAllDescendantsOfConcept(conceptFqName)) {
          if (myNodes.containsKey(d)) {
            result.addAll(myNodes.get(d));
          }
        }
      } else {
        if (myNodes.containsKey(conceptFqName)) {
          result.addAll(myNodes.get(conceptFqName));
        }
      }

      Collections.sort(result, new Comparator<SNode>() {
        public int compare(SNode o1, SNode o2) {
          return o1.getSNodeId().compareTo(o2.getSNodeId());
        }
      });

      return result;
    }
  }

  private void addToCache(final SNode root) {
    NodeReadAccessCasterInEditor.runReadTransparentAction(new Runnable() {
      @Override
      public void run() {
        for (SNode child : root.getChildren()) {
          addToCache(child);
        }

        String conceptFqName = root.getConceptFqName();
        add(conceptFqName, root);
      }
    });
  }

  private void removeFromCache(final SNode root) {
    boolean wereBlocked = NodeReadAccessCasterInEditor.areEventsBlocked();
    try {
      NodeReadAccessCasterInEditor.setEventsBlocked(true);

      for (SNode child : root.getChildren()) {
        removeFromCache(child);
      }

      String conceptFqName = root.getConceptFqName();
      remove(conceptFqName, root);
    } finally {
      NodeReadAccessCasterInEditor.setEventsBlocked(wereBlocked);
    }
  }

  private void add(String conceptFqName, SNode node) {

    Set<SNode> set = myNodes.get(conceptFqName);
    if (set == null) {
      set = new THashSet<SNode>(1);
      myNodes.put(conceptFqName, set);
    }
    set.add(node);
  }

  private void remove(String conceptFqName, SNode node) {
    Set<SNode> set = myNodes.get(conceptFqName);

    set.remove(node);
    if (set.isEmpty()) {
      myNodes.remove(conceptFqName);
    }
  }

  private class MySModelAdapter extends SModelAdapter {
    public MySModelAdapter() {
      super(SModelListenerPriority.PLATFORM);
    }

    public void childAdded(SModelChildEvent event) {
      synchronized (myLock) {
        if (!myInitialized) return;

        addToCache(event.getChild());
      }
    }

    public void childRemoved(SModelChildEvent event) {
      synchronized (myLock) {
        if (!myInitialized) return;

        removeFromCache(event.getChild());
      }
    }

    public void rootAdded(SModelRootEvent event) {
      synchronized (myLock) {
        if (!myInitialized) return;

        addToCache(event.getRoot());
      }
    }

    public void rootRemoved(SModelRootEvent event) {
      synchronized (myLock) {
        if (!myInitialized) return;

        removeFromCache(event.getRoot());
      }
    }

    public void loadingStateChanged(SModelDescriptor model, boolean isLoading) {
      synchronized (myLock) {
        myInitialized = false;
        myNodes.clear();
      }
    }

    @Override
    public void modelReplaced(SModelDescriptor md) {
      synchronized (myLock) {
        myInitialized = false;
        myNodes.clear();
      }
    }
  }
}