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

import java.util.Stack;

public class NodeReadEventsCaster {
  private static ThreadLocal<ListenersContainer> ourListenersContainer = new ThreadLocal<ListenersContainer>();

  public static void fireNodeChildReadAccess(SNode node, String childRole, SNode child) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireNodeChildReadAccess(node, childRole, child);
    }
  }

  public static void fireNodePropertyReadAccess(SNode node, String propertyName, String value) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireNodePropertyReadAccess(node, propertyName, value);
    }
  }

  public static void fireNodeReferentReadAccess(SNode node, String referentRole, SNode referent) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireNodeReferentReadAccess(node, referentRole, referent);
    }
  }

  public static void fireNodeUnclassifiedReadAccess(SNode node) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireNodeUnclassifiedReadAccess(node);
    }
  }

  public static void fireModelNodesReadAccess(SModel model) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireModelNodesReadAccess(model);
    }
  }

  public static void setNodesReadListener(INodesReadListener listener) {
    getListenersContainer().addListener(listener);
  }

  public static void removeNodesReadListener() {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    assert listenersContainer != null : "Removing not existing listener";
    listenersContainer.removeListener();
    if (listenersContainer.canBeDisposed()) {
      ourListenersContainer.set(null);
    }
  }

  public static void setEventsBlocked(boolean blocked) {
    ListenersContainer listenersCotainer = getListenersContainer();
    listenersCotainer.setEventsBlocked(blocked);
    if (listenersCotainer.canBeDisposed()) {
      ourListenersContainer.set(null);
    }
  }

  public static boolean areEventsBlocked() {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    return listenersContainer != null && listenersContainer.areEventsBlocked();
  }

  private static ListenersContainer getListenersContainer() {
    ListenersContainer listeners = ourListenersContainer.get();
    if (listeners == null) {
      listeners = new ListenersContainer();
      ourListenersContainer.set(listeners);
    }
    return listeners;
  }

  static class ListenersContainer {
    private Stack<INodesReadListener> myListenersStack = new Stack<INodesReadListener>();
    private boolean myEventsBlocked;

    public void addListener(INodesReadListener listener) {
      assert listener != null : "Trying to add null as a listener";
      myListenersStack.push(listener);
    }

    public void removeListener() {
      assert !myListenersStack.isEmpty() : "Trying to remove listener from an empty Listeners stack";
      myListenersStack.pop();
    }

    public void fireNodeChildReadAccess(SNode node, String childRole, SNode child) {
      if (myEventsBlocked || node.isModelLoading()) return;
      myListenersStack.peek().nodeChildReadAccess(node, childRole, child);
    }

    public void fireNodePropertyReadAccess(SNode node, String propertyName, String value) {
      if (myEventsBlocked || node.isModelLoading()) return;
      myListenersStack.peek().nodePropertyReadAccess(node, propertyName, value);
    }

    public void fireNodeReferentReadAccess(SNode node, String referentRole, SNode referent) {
      if (myEventsBlocked || node.isModelLoading()) return;
      myListenersStack.peek().nodeReferentReadAccess(node, referentRole, referent);
    }

    public void fireNodeUnclassifiedReadAccess(SNode node) {
      if (myEventsBlocked || node.isModelLoading()) return;
      myListenersStack.peek().nodeUnclassifiedReadAccess(node);
    }

    public void fireModelNodesReadAccess(SModel model) {
      if (myEventsBlocked || model.isLoading()) return;
      myListenersStack.peek().modelNodesReadAccess(model);
    }

    public boolean areEventsBlocked() {
      return myEventsBlocked;
    }

    public void setEventsBlocked(boolean eventsBlocked) {
      myEventsBlocked = eventsBlocked;
    }

    public boolean canBeDisposed() {
      return !myEventsBlocked && myListenersStack.isEmpty();
    }
  }
}
