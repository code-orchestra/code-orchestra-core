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

import com.intellij.openapi.util.Computable;

import java.util.Stack;

public class NodeReadAccessCasterInEditor {
  private static ThreadLocal<ListenersContainer> ourListenersContainer = new ThreadLocal<ListenersContainer>();

  public static void setCellBuildNodeReadAccessListener(NodeReadAccessInEditorListener listener) {
    getListenersContainer().addListener(listener);
  }

  public static void removeCellBuildNodeAccessListener() {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    assert listenersContainer != null : "Removing not existing listener";
    listenersContainer.removeListener();
    if (listenersContainer.canBeDisposed()) {
      ourListenersContainer.set(null);
    }
  }

  public static void fireNodeReadAccessed(SNode node) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireNodeReadAccessed(node);
    }
  }

  public static void firePropertyReadAccessed(SNode node, String propertyName, boolean propertyExistenceCheck) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.firePropertyReadAccessed(node, propertyName, propertyExistenceCheck);
    }
  }

  public static void fireReferenceTargetReadAccessed(SNode sourceNode, SModelReference targetModelReference, SNodeId targetNodeId) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    if (listenersContainer != null) {
      listenersContainer.fireReferenceTargetReadAccessed(sourceNode, targetModelReference, targetNodeId);
    }
  }

  public static NodeReadAccessInEditorListener getReadAccessListener() {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    return listenersContainer == null ? null : listenersContainer.getActiveListener();
  }

  public static boolean areEventsBlocked() {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    return listenersContainer != null && listenersContainer.areEventsBlocked();
  }

  public static void setEventsBlocked(boolean blocked) {
    ListenersContainer listenersCotainer = getListenersContainer();
    listenersCotainer.setEventsBlocked(blocked);
    if (listenersCotainer.canBeDisposed()) {
      ourListenersContainer.set(null);
    }
  }

  public static void runReadTransparentAction(Runnable r) {
    boolean wereBlocked = areEventsBlocked();
    boolean wereBlockedNonEditor = NodeReadEventsCaster.areEventsBlocked();
    NodeReadEventsCaster.setEventsBlocked(true);
    setEventsBlocked(true);
    try {
      r.run();
    } finally {
      setEventsBlocked(wereBlocked);
      NodeReadEventsCaster.setEventsBlocked(wereBlockedNonEditor);
    }
  }

  public static <T> T runReadTransparentAction(final Computable<T> c) {
    boolean wereBlocked = areEventsBlocked();
    boolean wereBlockedNonEditor = NodeReadEventsCaster.areEventsBlocked();
    NodeReadEventsCaster.setEventsBlocked(true);
    setEventsBlocked(true);
    try {
      return c.compute();
    } finally {
      setEventsBlocked(wereBlocked);
      NodeReadEventsCaster.setEventsBlocked(wereBlockedNonEditor);
    }
  }

  public static String runCleanPropertyAccessAction(Computable<String> propertyAccess) {
    ListenersContainer listenersContainer = ourListenersContainer.get();
    boolean wasCleanAccessMode = false;
    if (listenersContainer != null) {
      wasCleanAccessMode = listenersContainer.isCleanPropertyAccessMode();
      listenersContainer.setCleanPropertyAccessMode(true);
    }
    try {
      return propertyAccess.compute();
    } finally {
      if (listenersContainer != null) {
        listenersContainer.setCleanPropertyAccessMode(wasCleanAccessMode);
      }
    }
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
    private Stack<NodeReadAccessInEditorListener> myListenersStack = new Stack<NodeReadAccessInEditorListener>();
    private boolean myEventsBlocked;
    private boolean myCleanPropertyAccessMode;
    private boolean myPropertyReadEventsSuppressed;

    public void addListener(NodeReadAccessInEditorListener listener) {
      assert listener != null : "Trying to add null as a listener";
      myListenersStack.push(listener);
    }

    public void removeListener() {
      assert !myListenersStack.isEmpty() : "Trying to remove listener from an empty Listeners stack";
      NodeReadAccessInEditorListener listener = myListenersStack.pop();
      if (!myListenersStack.isEmpty()) {
        myListenersStack.peek().addNodesToDependOn(listener.getNodesToDependOn());
        myListenersStack.peek().addRefTargetsToDependOn(listener.getRefTargetsToDependOn());
      }
    }

    public boolean canBeDisposed() {
      return !myEventsBlocked && myListenersStack.isEmpty();
    }

    public NodeReadAccessInEditorListener getActiveListener() {
      return myListenersStack.isEmpty() ? null : myListenersStack.peek();
    }

    public boolean areEventsBlocked() {
      return myEventsBlocked;
    }

    public void setEventsBlocked(boolean eventsBlocked) {
      myEventsBlocked = eventsBlocked;
    }

    public boolean isCleanPropertyAccessMode() {
      return myCleanPropertyAccessMode;
    }

    public void setCleanPropertyAccessMode(boolean cleanPropertyAccess) {
      myCleanPropertyAccessMode = cleanPropertyAccess;
    }

    public void fireNodeReadAccessed(SNode node) {
      if (myEventsBlocked || skipNotification(node)) {
        return;
      }
      myListenersStack.peek().nodeUnclassifiedReadAccess(node);
    }

    public void firePropertyReadAccessed(SNode node, String propertyName, boolean propertyExistenceCheck) {
      if (myEventsBlocked || myPropertyReadEventsSuppressed || skipNotification(node)) {
        return;
      }

      NodeReadAccessInEditorListener listener = myListenersStack.peek();
      myPropertyReadEventsSuppressed = true;
      try {
        if (myCleanPropertyAccessMode) {
          listener.propertyCleanReadAccess(node, propertyName);
        } else if (propertyExistenceCheck) {
          listener.propertyExistenceAccess(node, propertyName);
        } else {
          listener.propertyDirtyReadAccess(node, propertyName);
        }
      } finally {
        myPropertyReadEventsSuppressed = false;
      }
    }

    public void fireReferenceTargetReadAccessed(SNode sourceNode, SModelReference targetModelReference, SNodeId targetNodeId) {
      if (myEventsBlocked || skipNotification(sourceNode)) {
        return;
      }
      myListenersStack.peek().addRefTargetToDependOn(new SNodePointer(targetModelReference, targetNodeId));
    }

    private boolean skipNotification(SNode node) {
      return myListenersStack.isEmpty() || !node.isRegistered() || node.isModelLoading();
    }
  }
}
