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

import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class CommandEventsManager implements ApplicationComponent {

  private SModelRepository mySModelRepository;
  private GlobalSModelEventsManager myGlobalSModelEventsManager;

  public CommandEventsManager(SModelRepository SModelRepository, GlobalSModelEventsManager eventsManager) {
    mySModelRepository = SModelRepository;
    myGlobalSModelEventsManager = eventsManager;
  }

  public void initComponent() {
    myGlobalSModelEventsManager.addGlobalCommandListener(new SModelCommandListener() {
      public void eventsHappenedInCommand(List<SModelEvent> events) {
        fireEvents(events);
      }
    });
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Command Events Manager";
  }

  public void disposeComponent() {

  }

  private void fireEvents(List<SModelEvent> events) {
    Map<SModelReference, List<SModelEvent>> eventsByModel = new LinkedHashMap<SModelReference, List<SModelEvent>>();

    for (SModelEvent e : events) {
      if (!eventsByModel.containsKey(e.getModel().getSModelReference())) {
        eventsByModel.put(e.getModel().getSModelReference(), new ArrayList<SModelEvent>());
      }
      eventsByModel.get(e.getModel().getSModelReference()).add(e);
    }

    for (SModelReference modelReference : eventsByModel.keySet()) {
      SModelDescriptor sm = mySModelRepository.getModelDescriptor(modelReference);
      if (!(sm instanceof BaseSModelDescriptor)) continue;
      List<SModelEvent> modelEvents = eventsByModel.get(modelReference);
      ((BaseSModelDescriptor) sm).fireSModelChangedInCommandEvent(Collections.unmodifiableList(modelEvents));
    }
  }
}
