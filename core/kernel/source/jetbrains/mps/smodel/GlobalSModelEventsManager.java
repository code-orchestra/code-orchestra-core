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
import jetbrains.mps.generator.TransientModelsModule.TransientSModelDescriptor;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.event.SModelListener.SModelListenerPriority;
import jetbrains.mps.smodel.event.TransientSModelCreateListener;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GlobalSModelEventsManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(GlobalSModelEventsManager.class);

  public static GlobalSModelEventsManager getInstance() {
    return ApplicationManager.getApplication().getComponent(GlobalSModelEventsManager.class);
  }

  private SModelRepository mySModelRepository;

  private List<List<SModelListener>> myGlobalListenersList;
  private List<SModelCommandListener> myGlobalCommandListeners = new ArrayList<SModelCommandListener>();

  private SModelListener[] myRelayListeners;
  private MyEventsCollector myEventsCollector = new MyEventsCollector();

  @CodeOrchestraPatch
  private List<TransientSModelCreateListener> transientSModelListeners = new ArrayList<TransientSModelCreateListener>();

  public GlobalSModelEventsManager(SModelRepository SModelRepository) {
    mySModelRepository = SModelRepository;
    myRelayListeners = new SModelListener[SModelListenerPriority.values().length];
    myGlobalListenersList = new ArrayList<List<SModelListener>>(SModelListenerPriority.values().length);
    for (SModelListenerPriority priority : SModelListenerPriority.values()) {
      myGlobalListenersList.add(new ArrayList<SModelListener>());
      myRelayListeners[priority.ordinal()] = createRelayListener(priority);
    }
  }

  public void initComponent() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        mySModelRepository.addModelRepositoryListener(new SModelRepositoryAdapter() {
          public void modelAdded(SModelDescriptor modelDescriptor) {
            addListeners(modelDescriptor);
          }

          public void modelRemoved(SModelDescriptor modelDescriptor) {
            removeListeners(modelDescriptor);
          }
        });

        for (SModelDescriptor sm : mySModelRepository.getModelDescriptors()) {
          addListeners(sm);
        }
      }
    });
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Global SModel Events Manager";
  }

  public void disposeComponent() {
  }

  @CodeOrchestraPatch
  public void addTransientSModelListener(TransientSModelCreateListener listener) {
    this.transientSModelListeners.add(listener);
  }

  @CodeOrchestraPatch
  public void removeTransientSModelListener(TransientSModelCreateListener listener) {
    this.transientSModelListeners.remove(listener);
  }

  @CodeOrchestraPatch
  public void fireTransientSModelCreated(TransientSModelDescriptor modelDescriptor) {
    for (TransientSModelCreateListener transientSModelListener : this.transientSModelListeners) {
      transientSModelListener.transientModelCreated(modelDescriptor);
    }
  }

  @CodeOrchestraPatch
  public void fireTransientSModelDisposed(TransientSModelDescriptor modelDescriptor) {
    for (TransientSModelCreateListener transientSModelListener : this.transientSModelListeners) {
      transientSModelListener.transientModelDisposed(modelDescriptor);
    }
  }

  private void addListeners(SModelDescriptor sm) {
    for (SModelListener listener : myRelayListeners) {
      sm.addModelListener(listener);
    }
    myEventsCollector.add(sm);
  }

  private void removeListeners(SModelDescriptor sm) {
    for (SModelListener listener : myRelayListeners) {
      sm.removeModelListener(listener);
    }
    myEventsCollector.remove(sm);
  }

  public void addGlobalModelListener(SModelListener l) {
    myGlobalListenersList.get(l.getPriority().ordinal()).add(l);
  }

  public void removeGlobalModelListener(SModelListener l) {
    myGlobalListenersList.get(l.getPriority().ordinal()).remove(l);
  }

  public void addGlobalCommandListener(SModelCommandListener l) {
    myGlobalCommandListeners.add(l);
  }

  public void removeGlobalCommandListener(SModelCommandListener l) {
    myGlobalCommandListeners.remove(l);
  }

  private List<SModelListener> globalListeners(SModelListenerPriority priority) {
    return new ArrayList<SModelListener>(myGlobalListenersList.get(priority.ordinal()));
  }

  private SModelListener createRelayListener(final SModelListenerPriority priority) {
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
            return priority;
          }

          method.setAccessible(true);
          for (SModelListener l : globalListeners(priority)) {
            try {
              method.invoke(l, args);
            } catch (Throwable t) {
              LOG.error(t);
            }
          }

          return null;
        }
      }
    );
  }

  private class MyEventsCollector extends EventsCollector {
    protected void eventsHappened(List<SModelEvent> events) {
      if (events.isEmpty()) return;

      for (SModelCommandListener l : myGlobalCommandListeners) {
        try {
          l.eventsHappenedInCommand(Collections.unmodifiableList(events));
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    }
  }
}
