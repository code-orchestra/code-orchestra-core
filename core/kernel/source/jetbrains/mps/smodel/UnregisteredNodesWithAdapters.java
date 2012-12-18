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

import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.util.WeakSet;

/**
 * Unregistered nodes can be used in some component, for example in undo. If they have
 * adapter, it might cause class leak, so in order to prevent them, we need to keep a
 * set of unregistered nodes with adapters and refresh their classes on reload.
 */
class UnregisteredNodesWithAdapters {
  private static UnregisteredNodesWithAdapters ourInstance = new UnregisteredNodesWithAdapters();

  static UnregisteredNodesWithAdapters getInstance() {
    return ourInstance;
  }

  private final Object myLock = new Object();
  private WeakSet<SNode> myNodes = new WeakSet<SNode>();

  UnregisteredNodesWithAdapters() {
    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      public void unload() {
        synchronized (myLock) {
          for (SNode node : myNodes) {
            node.clearAdapter();
          }
          myNodes.clear();
        }
      }
    });
  }

  void add(SNode node) {
    synchronized (myLock) {
      myNodes.add(node);
    }
  }

  void remove(SNode node) {
    synchronized (myLock) {
      myNodes.remove(node);
    }
  }
}
