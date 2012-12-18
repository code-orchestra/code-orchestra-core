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

import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelFileChangedEvent;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.event.SModelListener.SModelListenerPriority;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.*;

public class EventsCollector {
  private List<SModelEvent> myEvents = new ArrayList<SModelEvent>();
  private SModelListener myListener = createCommandEventsCollector();
  private Set<SModelDescriptor> myModelDescriptors = new LinkedHashSet<SModelDescriptor>();
  private ModelAccessListener myModelAccessListener = new MyModelAccessAdapter();
  private boolean myDisposed;

  private boolean myIsInCommand;

  public EventsCollector() {
    ModelAccess.instance().addCommandListener(myModelAccessListener);
    myIsInCommand = ModelAccess.instance().isInsideCommand();
  }

  private SModelListener createCommandEventsCollector() {
    return (SModelListener) Proxy.newProxyInstance(
      getClass().getClassLoader(),
      new Class[]{SModelListener.class},
      new InvocationHandler() {
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
          if (method.getName().equals("equals") && args.length == 1) {
            return proxy == args[0];
          }

          if (method.getName().equals("hashCode") && args == null) {
            return this.hashCode();
          }

          if (method.getName().equals("getPriority") && args == null) {
            return SModelListenerPriority.CLIENT;
          }

          if (method.getName().equals("beforeChildRemoved")) {
            return null;
          }

          checkDisposed();

          if (args != null && args.length == 1 && args[0] instanceof SModelEvent) {
            SModelEvent e = (SModelEvent) args[0];
            if (!myIsInCommand && !(e instanceof SModelFileChangedEvent)) {
              throw new IllegalStateException("Event outside of a command");
            }

            myEvents.add(e);
          }

          return null;
        }
      }
    );
  }

  public void add(@NotNull SModelDescriptor sm) {
    checkDisposed();
    //assert !myModelDescriptors.contains(sm) : "EventsCollector was already configured to listen for changes in this model descriptor: " + sm.getSModelReference().toString();
    myModelDescriptors.add(sm);
    sm.addModelListener(myListener);
  }

  public void remove(@NotNull SModelDescriptor sm) {
    checkDisposed();

    myModelDescriptors.remove(sm);
    sm.removeModelListener(myListener);
  }

  public void flush() {
    checkDisposed();

    if (myEvents.isEmpty()) return;
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        List<SModelEvent> wrappedEvents = Collections.unmodifiableList(myEvents);
        myEvents = new ArrayList<SModelEvent>();
        eventsHappened(wrappedEvents);
      }
    });
  }

  protected void eventsHappened(List<SModelEvent> events) {

  }

  @CodeOrchestraPatch
  public boolean isDisposed() {
    return myDisposed;
  }

  public void dispose() {
    checkDisposed();

    for (SModelDescriptor sm : new LinkedHashSet<SModelDescriptor>(myModelDescriptors)) {
      remove(sm);
    }
    ModelAccess.instance().removeCommandListener(myModelAccessListener);
    myDisposed = true;
  }

  private void checkDisposed() {
    if (myDisposed) {
      throw new IllegalStateException("Disposed events collector was called: " + getClass());
    }
  }

  private class MyModelAccessAdapter extends ModelAccessAdapter {
    public void commandStarted() {
      myEvents.clear();
      myIsInCommand = true;
    }

    public void beforeCommandFinished() {
      // RE-2625
      if (!isDisposed()) {
        flush();
      }
      myIsInCommand = false;
    }
  }
}
