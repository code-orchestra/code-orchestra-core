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

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class ModelChangedCaster {
  private List<NodeModelChangedListener> myListeners = new CopyOnWriteArrayList<NodeModelChangedListener>();
  private static ModelChangedCaster ourInstance = new ModelChangedCaster();

  private ModelChangedCaster() {
  }

  public static ModelChangedCaster getInstance() {
    return ourInstance;
  }

  void fireModelChanged(SNode node, SModel oldModel) {
    for (NodeModelChangedListener listener : myListeners) {
      listener.modelChanged(node, oldModel);
    }
  }

  public synchronized void addListener(NodeModelChangedListener listener) {
    myListeners.add(listener);
  }

  public synchronized void removeListener(NodeModelChangedListener listener) {
    myListeners.remove(listener);
  }
}
