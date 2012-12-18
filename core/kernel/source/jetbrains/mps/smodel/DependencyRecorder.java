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

import jetbrains.mps.util.ManyToManyMap;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class DependencyRecorder<T> {
  private ManyToManyMap<T, SNode> myObjectsToNodes = new ManyToManyMap<T, SNode>();

  public void rebuild(T t, Runnable r) {
    MyNodeReadListener listener = new MyNodeReadListener();
    NodeReadEventsCaster.setNodesReadListener(listener);
    try {
      r.run();
    } finally {
      NodeReadEventsCaster.removeNodesReadListener();
    }
    myObjectsToNodes.clearFirst(t);
    for (SNode n : listener.getDependencies()) {
      myObjectsToNodes.addLink(t, n);
    }
  }

  public void remove(T t) {
    myObjectsToNodes.clearFirst(t);
  }

  public Set<SNode> getDependencies(T t) {
    return myObjectsToNodes.getByFirst(t);
  }

  public Set<T> getDependOn(SNode n) {
    return myObjectsToNodes.getBySecond(n);
  }

  private class MyNodeReadListener extends AbstractNodesReadListener {
    private Set<SNode> myDependencies = new HashSet<SNode>();

    private Set<SNode> getDependencies() {
      return Collections.unmodifiableSet(myDependencies);
    }

    public void nodeChildReadAccess(SNode node, String childRole, SNode child) {
      myDependencies.add(node);
    }

    public void nodePropertyReadAccess(SNode node, String propertyName, String value) {
      myDependencies.add(node);
    }

    public void nodeReferentReadAccess(SNode node, String referentRole, SNode referent) {
      myDependencies.add(node);
    }

    public void nodeUnclassifiedReadAccess(SNode node) {
      myDependencies.add(node);
    }
  }
}
