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
package jetbrains.mps.generator.impl.plan;

import jetbrains.mps.generator.impl.plan.GenerationPartitioner.CoherentSetData;
import jetbrains.mps.generator.impl.plan.GenerationPartitioner.PriorityData;
import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.util.CollectionUtil;

import java.util.*;

class PriorityMapUtil {

  /*
   *   Merges sets.
   */
  public static void joinIntersectingCoherentMappings(List<CoherentSetData> coherentMappings) {
    Map<TemplateMappingConfiguration, CoherentSetData> myMappingToSet = new HashMap<TemplateMappingConfiguration, CoherentSetData>();
    boolean executeOneMore = true;

    outer:
    while(executeOneMore) {
      executeOneMore = false;
      myMappingToSet.clear();
      for(CoherentSetData data : coherentMappings) {
        for (TemplateMappingConfiguration mapping : data.myMappings) {
          CoherentSetData original = myMappingToSet.get(mapping);
          if(original != null && original != data) {
            // merge sets
            original.myMappings.addAll(data.myMappings);
            original.myCauseRules.addAll(data.myCauseRules);
            coherentMappings.remove(data);
            executeOneMore = true;
            continue outer;
          }
          myMappingToSet.put(mapping, data);
        }
      }
    }
  }

  public static void makeLocksEqualsForCoherentMappings(List<CoherentSetData> coherentMappings, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap, Set<TemplateMappingPriorityRule> conflictingRules) {
    for (CoherentSetData coherentSetData : coherentMappings) {
      Set<TemplateMappingConfiguration> coherentMappingSet = coherentSetData.myMappings;
      // collect
      Map<TemplateMappingConfiguration, PriorityData> joinedLocks = new HashMap<TemplateMappingConfiguration, PriorityData>();
      for (TemplateMappingConfiguration coherentMapping : coherentMappingSet) {
        Map<TemplateMappingConfiguration, PriorityData> locks = priorityMap.get(coherentMapping);
        for (Map.Entry<TemplateMappingConfiguration, PriorityData> entry : locks.entrySet()) {
          TemplateMappingConfiguration lockMapping = entry.getKey();
          PriorityData priorityData = entry.getValue();
          // exclude coherent mappings themself
          if (coherentMappingSet.contains(lockMapping)) {
            if (priorityData.isStrict()) {
              // error
              conflictingRules.addAll(priorityData.myCauseRules);
              conflictingRules.addAll(coherentSetData.myCauseRules);
            }
            continue;
          }

          PriorityData joinedPriorityData = joinedLocks.get(lockMapping);
          if (joinedPriorityData != null) {
            joinedPriorityData.update(priorityData);
          } else {
            joinedLocks.put(lockMapping, new PriorityData(priorityData));
          }
        }
      }

      // update
      for (TemplateMappingConfiguration coherentMapping : coherentMappingSet) {
        // make deep copy
        Map<TemplateMappingConfiguration, PriorityData> joinedLocks_1 = new HashMap<TemplateMappingConfiguration, PriorityData>(joinedLocks.size());
        for (Map.Entry<TemplateMappingConfiguration, PriorityData> entry : joinedLocks.entrySet()) {
          joinedLocks_1.put(entry.getKey(), new PriorityData(entry.getValue()));
        }
        priorityMap.put(coherentMapping, joinedLocks_1);
      }
    }
  }

  /*
   * mappings locked by any of 'coherent mapping' should be locked by all 'coherent mappings'
   */
  public static void makeLockedByAllCoherentIfLockedByOne(List<CoherentSetData> coherentMappings, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    for (CoherentSetData coherentSetData : coherentMappings) {
      Set<TemplateMappingConfiguration> coherentMappingSet = coherentSetData.myMappings;
      for (TemplateMappingConfiguration mapping : priorityMap.keySet()) {
        if (coherentMappingSet.contains(mapping)) continue;
        Map<TemplateMappingConfiguration, PriorityData> locks = priorityMap.get(mapping);
        if (locks.isEmpty()) continue;
        List<TemplateMappingConfiguration> lockingCoherentMappings = CollectionUtil.intersect(coherentMappingSet, locks.keySet());
        if (lockingCoherentMappings.isEmpty()) continue;
        // if any one locks strictly, then all should lock strictly
        boolean isStrict = false;
        for (TemplateMappingConfiguration mapping1 : lockingCoherentMappings) {
          if (locks.get(mapping1).isStrict()) {
            isStrict = true;
            break;
          }
        }
        // update
        for (TemplateMappingConfiguration coherentMapping : coherentMappingSet) {
          PriorityData priorityData = locks.get(coherentMapping);
          if (priorityData != null) {
            priorityData.myCauseRules.addAll(coherentSetData.myCauseRules);
            if(isStrict) priorityData.myStrict = true;
          } else {
            locks.put(coherentMapping, new PriorityData(isStrict, coherentSetData.myCauseRules));
          }
        }
      }
    }
  }

  static List<TemplateMappingConfiguration> getWeakLockMappingsForLockedMapping(TemplateMappingConfiguration mapping, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    List<TemplateMappingConfiguration> result = new ArrayList<TemplateMappingConfiguration>();
    Map<TemplateMappingConfiguration, PriorityData> grtPriMappings = priorityMap.get(mapping);
    for (Map.Entry<TemplateMappingConfiguration, PriorityData> entry : grtPriMappings.entrySet()) {
      if (!entry.getValue().isStrict()) {
        result.add(entry.getKey());
      }
    }
    return result;
  }

  static List<TemplateMappingConfiguration> getStrictLockedMappingsForLockMapping(TemplateMappingConfiguration lockMapping, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    List<TemplateMappingConfiguration> result = new ArrayList<TemplateMappingConfiguration>();
    for (Map.Entry<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> entry : priorityMap.entrySet()) {
      Map<TemplateMappingConfiguration, PriorityData> locks = entry.getValue();
      PriorityData priorityData = locks.get(lockMapping);
      if (priorityData != null && priorityData.isStrict()) {
        result.add(entry.getKey());
      }
    }
    return result;
  }

  static boolean addLock(TemplateMappingConfiguration lockedMapping, TemplateMappingConfiguration lockMapping, PriorityData priorityDataToApply, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    Map<TemplateMappingConfiguration, PriorityData> locks = priorityMap.get(lockedMapping);
    PriorityData priorityData = locks.get(lockMapping);
    if (priorityData != null) {
      priorityData.update(priorityDataToApply);
    } else {
      locks.put(lockMapping, new PriorityData(priorityDataToApply));
    }
    return priorityData == null; // true - new lock added
  }

  static List<TemplateMappingConfiguration> getLockedMappingsForLockMapping(TemplateMappingConfiguration lockMapping, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    List<TemplateMappingConfiguration> result = new ArrayList<TemplateMappingConfiguration>();
    for (Map.Entry<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> entry : priorityMap.entrySet()) {
      if (entry.getValue().containsKey(lockMapping)) {
        result.add(entry.getKey());
      }
    }
    return result;
  }

  static boolean isLockingMapping(TemplateMappingConfiguration mapping, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    for (Map<TemplateMappingConfiguration, PriorityData> locks : priorityMap.values()) {
      if (locks.containsKey(mapping)) {
        return true;
      }
    }
    return false;
  }


  /**
   * replaces dependency
   * lockedMapping -> ..., weak-lock ,...
   * with
   * lockedMapping -> ..., all locks from weak-lockMapping ,...
   */
  static void replaceWeakLock(TemplateMappingConfiguration lockedMapping, TemplateMappingConfiguration weakLockMapping, Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap) {
    Map<TemplateMappingConfiguration, PriorityData> locksToUpdate = priorityMap.get(lockedMapping);
    PriorityData dataToKeep = locksToUpdate.remove(weakLockMapping);

    Map<TemplateMappingConfiguration, PriorityData> locksToAdd = priorityMap.get(weakLockMapping);
    for (TemplateMappingConfiguration lockMappingToAdd : locksToAdd.keySet()) {
      PriorityData priorityData = locksToUpdate.get(lockMappingToAdd);
      if (priorityData != null) {
        priorityData.update(locksToAdd.get(lockMappingToAdd));
      } else {
        priorityData = new PriorityData(locksToAdd.get(lockMappingToAdd));
        locksToUpdate.put(lockMappingToAdd, priorityData);
      }
      priorityData.update(dataToKeep);
    }
  }
}
