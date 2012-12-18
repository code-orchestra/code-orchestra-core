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
package jetbrains.mps.project.structure.modules.mappingpriorities;

import jetbrains.mps.smodel.SModelReference;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MappingConfig_RefSet extends MappingConfig_AbstractRef {
  private List<MappingConfig_AbstractRef> myRefs;

  public MappingConfig_RefSet() {
    myRefs = new ArrayList<MappingConfig_AbstractRef>();
  }

  public List<MappingConfig_AbstractRef> getMappingConfigs() {
    return myRefs;
  }

  public MappingConfig_RefSet getCopy() {
    MappingConfig_RefSet result = new MappingConfig_RefSet();
    for (MappingConfig_AbstractRef ref : myRefs) {
      result.myRefs.add(ref != null ? ref.getCopy() : null);
    }
    return result;
  }

  @Override
  public boolean isIncomplete() {
    for (MappingConfig_AbstractRef ref : myRefs) {
      if (ref.isIncomplete()) return true;
    }
    return false;
  }

  @Override
  public boolean updateReferences() {
    boolean result = false;

    for (MappingConfig_AbstractRef ref : myRefs) {
      boolean res = ref.updateReferences();
      result = result || res;
    }

    return result;
  }

  @Override
  public boolean removeModelReference(SModelReference ref, boolean[] mappingsChanged) {
    Iterator<MappingConfig_AbstractRef> it = myRefs.iterator();
    boolean affected = false;
    while (it.hasNext()) {
      MappingConfig_AbstractRef curr = it.next();
      if (curr.removeModelReference(ref, mappingsChanged)) {
        it.remove();
        affected = true;
      }
    }
    if (affected && myRefs.size() == 0) {
      return true;
    }
    return false;
  }
}
