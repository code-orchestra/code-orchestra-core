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

import jetbrains.mps.smodel.FastNodeFinder;
import jetbrains.mps.smodel.LanguageHierarchyCache;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

import java.util.*;

/**
 * Evgeny Gryaznov, Mar 1, 2010
 */
public class TransientModelNodeFinder implements FastNodeFinder {
  private final Object myLock = new Object();

  private SModel myModel;
  private boolean myInitialized;

  private Map<String, List<SNode>> myNodes = new HashMap<String, List<SNode>>();

  public TransientModelNodeFinder(SModel model) {
    myModel = model;
  }

  @Override
  public void dispose() {
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

    synchronized (myLock) {
      if (!myInitialized) {
        initCache();
      }
    }

    if (includeInherited) {
      final List<SNode> result = new ArrayList<SNode>();
      for (String d : LanguageHierarchyCache.getInstance().getAllDescendantsOfConcept(conceptFqName)) {
        if (myNodes.containsKey(d)) {
          result.addAll(myNodes.get(d));
        }
      }
      return result;
    } else {
      if (myNodes.containsKey(conceptFqName)) {
        return myNodes.get(conceptFqName);
      }
      return Collections.emptyList();
    }
  }

  private void addToCache(final SNode root) {
    String conceptFqName = root.getConceptFqName();
    List<SNode> set = myNodes.get(conceptFqName);
    if (set == null) {
      set = new ArrayList<SNode>();
      myNodes.put(conceptFqName, set);
    }
    set.add(root);

    for (SNode child : root.getChildren()) {
      addToCache(child);
    }
  }

}
