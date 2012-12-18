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

import jetbrains.mps.smodel.event.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class DependencyAwareCache<K, V> {
  private Map<K, V> myCache = new HashMap<K, V>();
  private DependencyRecorder<K> myRecorder = new DependencyRecorder<K>();
  private SModelCommandListener myListener = new MySModelCommandListener();

  protected DependencyAwareCache() {
    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(myListener);
  }

  public V get(final K key) {
    V result = myCache.get(key);
    if (result != null) {
      return result;
    }
    myRecorder.rebuild(key, new Runnable() {
      public void run() {
        myCache.put(key, calculate(key));
      }
    });
    return myCache.get(key);
  }

  protected abstract V calculate(K key);

  public void dispose() {
    GlobalSModelEventsManager.getInstance().removeGlobalCommandListener(myListener);
  }

  private class MySModelCommandListener implements SModelCommandListener {
    public void eventsHappenedInCommand(List<SModelEvent> events) {
      final List<SNode> changedNodes = new ArrayList<SNode>();
      for (SModelEvent e : events) {
        e.accept(new SModelEventVisitor() {
          public void visitRootEvent(SModelRootEvent event) {
            changedNodes.add(event.getRoot());
          }

          public void visitChildEvent(SModelChildEvent event) {
            changedNodes.add(event.getParent());
            changedNodes.add(event.getChild());
          }

          public void visitPropertyEvent(SModelPropertyEvent event) {
            changedNodes.add(event.getNode());
          }

          public void visitReferenceEvent(SModelReferenceEvent event) {
            changedNodes.add(event.getReference().getSourceNode());
          }
        });
      }

      for (SNode changeNode : changedNodes) {
        for (K key : myRecorder.getDependOn(changeNode)) {
          myCache.remove(key);
        }
      }
    }
  }
}
