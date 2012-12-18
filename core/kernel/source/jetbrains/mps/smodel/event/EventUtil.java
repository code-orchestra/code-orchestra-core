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
package jetbrains.mps.smodel.event;

import jetbrains.mps.smodel.SModelUtil_new;

import java.util.List;

public class EventUtil {
  public static boolean isDetachedOnlyChange(List<SModelEvent> events) {
    final boolean[] result = {true};


    for (SModelEvent e : events) {
      e.accept(new SModelEventVisitorAdapter() {
        public void visitChildEvent(SModelChildEvent event) {
          if (!event.getParent().isDetached()) {
            result[0] = false;
          }
        }

        public void visitPropertyEvent(SModelPropertyEvent event) {
          if (!event.getNode().isDetached()) {
            result[0] = false;
          }
        }

        public void visitReferenceEvent(SModelReferenceEvent event) {
          if (!event.getReference().getSourceNode().isDetached()) {
            result[0] = false;
          }
        }
      });
    }

    return result[0];
  }

  public static boolean isDramaticalChange(List<SModelEvent> events) {
    for (SModelEvent e : events) {
      if (e instanceof SModelChildEvent) return true;
      if (e instanceof SModelRootEvent) return true;
      if (e instanceof SModelReferenceEvent) return true;
    }
    return false;
  }

  public static boolean isChange(List<SModelEvent> events) {
    for (SModelEvent e : events) {
      if (e.isChangeEvent()) {
        return true;
      }
    }
    return false;
  }

  public static boolean isRootNameChange(List<SModelEvent> events) {
    for (SModelEvent e : events) {
      if (e instanceof SModelPropertyEvent && ((SModelPropertyEvent) e).getNode().isRoot()) return true;
    }
    return false;
  }

  public static boolean isPropertyChange(List<SModelEvent> events) {
    if (events.size() != 1) return false;
    return events.get(0) instanceof SModelPropertyEvent;
  }

  public static boolean isPropertyAddedOrRemoved(SModelEvent event) {
    if (event instanceof SModelPropertyEvent) {
      SModelPropertyEvent propertyEvent = (SModelPropertyEvent) event;
      boolean oldEmpty = SModelUtil_new.isEmptyPropertyValue(propertyEvent.getOldPropertyValue());
      boolean newEmpty = SModelUtil_new.isEmptyPropertyValue(propertyEvent.getNewPropertyValue());
      return oldEmpty != newEmpty;
    } else {
      return false;
    }
  }
}
