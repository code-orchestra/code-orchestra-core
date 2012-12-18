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

import jetbrains.mps.generator.impl.plan.GenerationPartitioner.AbsoluteFirstSetData;
import jetbrains.mps.generator.impl.plan.GenerationPartitioner.CoherentSetData;
import jetbrains.mps.generator.impl.plan.GenerationPartitioner.PriorityData;
import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;

/**
 * evgeny, 3/10/11
 */
public class PartitioningSolver {

  /*
   *   Dependencies graph. For each mapping contains a set of mappings which should be applied together or after
   *   it (PriorityData.isStrict means only after).
   */
  private final Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> myPriorityMap;

  /*
   *   Each entry defines a set of mappings, which should be applied together.
   */
  private final List<CoherentSetData> myCoherentMappings;

  /*
   *   result: Contains rules which caused conflicts.
   */
  private final Set<TemplateMappingPriorityRule> myConflictingRules;

  @CodeOrchestraPatch
  private List<AbsoluteFirstSetData> myAbsoluteFirstMappings;

  @CodeOrchestraPatch
  public PartitioningSolver(Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> priorityMap, List<CoherentSetData> coherentMappings, Set<TemplateMappingPriorityRule> conflictingRules, List<AbsoluteFirstSetData> absoluteFirstMappings) {
    myPriorityMap = priorityMap;
    myCoherentMappings = coherentMappings;
    myConflictingRules = conflictingRules;
    myAbsoluteFirstMappings = absoluteFirstMappings; // CO-4941
  }

  @CodeOrchestraPatch
  List<List<TemplateMappingConfiguration>> solve() {
    // early error detection
    for (TemplateMappingConfiguration mapping : myPriorityMap.keySet()) {
      checkSelfLocking(mapping);
    }

    // process coherent mappings
    PriorityMapUtil.joinIntersectingCoherentMappings(myCoherentMappings);
    PriorityMapUtil.makeLockedByAllCoherentIfLockedByOne(myCoherentMappings, myPriorityMap);
    PriorityMapUtil.makeLocksEqualsForCoherentMappings(myCoherentMappings, myPriorityMap, myConflictingRules);

    // remove 'weak' priorities
    boolean need_more_passes = true;
    while (need_more_passes) {
      need_more_passes = false;
      iterate_all_mappings:
      for (TemplateMappingConfiguration lockedMapping : myPriorityMap.keySet()) {
        while (true) {
          List<TemplateMappingConfiguration> weakLockMappings = PriorityMapUtil.getWeakLockMappingsForLockedMapping(lockedMapping, myPriorityMap);
          if (weakLockMappings.isEmpty()) break;
          for (TemplateMappingConfiguration weakLockMapping : weakLockMappings) {
            // remove 'weak' dependency but don't allow locked-lockedMapping to go before weak-lock lockedMapping
            PriorityMapUtil.replaceWeakLock(lockedMapping, weakLockMapping, myPriorityMap);
            checkSelfLocking(lockedMapping);
//          // if locked-mapping is strict lock for other mappings,
//          // then weak-lock-mapping should be strict lock for them as well.
//          List<TemplateMappingConfiguration> lockedMappings_1 = PriorityMapUtil.getStrictLockedMappingsForLockMapping(lockedMapping, myPriorityMap);
//          for (TemplateMappingConfiguration lockedMapping_1 : lockedMappings_1) {
//            Map<TemplateMappingConfiguration, PriorityData> locks_1 = myPriorityMap.get(lockedMapping_1);
//            PriorityData priorityDataToApply = locks_1.get(lockedMapping);
//            PriorityMapUtil.addLock(lockedMapping_1, weakLockMapping, priorityDataToApply, myPriorityMap);
//            checkSelfLocking(lockedMapping_1);
//          }

            // if locked-lockedMapping is a lock for other mappings,
            // then weak-lock-lockedMapping should be a lock for them as well.
            List<TemplateMappingConfiguration> lockedMappings_1 = PriorityMapUtil.getLockedMappingsForLockMapping(lockedMapping, myPriorityMap);
            for (TemplateMappingConfiguration lockedMapping_1 : lockedMappings_1) {
              Map<TemplateMappingConfiguration, PriorityData> locks_1 = myPriorityMap.get(lockedMapping_1);
              PriorityData priorityDataToApply = locks_1.get(lockedMapping);
              boolean newLockAdded = PriorityMapUtil.addLock(lockedMapping_1, weakLockMapping, priorityDataToApply, myPriorityMap);
              checkSelfLocking(lockedMapping_1);
              if (newLockAdded) {
                // if new lock is a weak lock, then better start all over again (weak locks cleaning)
                PriorityData priorityData = myPriorityMap.get(lockedMapping_1).get(weakLockMapping);
                // checkSelfLocking may removed it, check if not null
                if (priorityData != null && priorityData.isWeak()) {
                  need_more_passes = true;
                  break iterate_all_mappings;
                }
              }
            }
          }
        }
      }
    }

    // paranoid check
    for (Map<TemplateMappingConfiguration, PriorityData> locks : myPriorityMap.values()) {
      for (PriorityData priorityData : locks.values()) {
        if (!priorityData.isStrict()) {
          throw new RuntimeException("Unexpected weak priority");
        }
      }
    }

    // create mappings partitioning
    List<List<TemplateMappingConfiguration>> mappingSets = createMappingSets();
    // if the priority map is still not empty, then there are some conflicting rules
    for (Map<TemplateMappingConfiguration, PriorityData> grtPriMappings : myPriorityMap.values()) {
      for (PriorityData priorityData : grtPriMappings.values()) {
        myConflictingRules.addAll(priorityData.myCauseRules);
      }
    }
    return mappingSets;
  }

  private void checkSelfLocking(TemplateMappingConfiguration mapping) {
    Map<TemplateMappingConfiguration, PriorityData> locks = myPriorityMap.get(mapping);
    PriorityData priorityData = locks.get(mapping);
    if (priorityData != null) {
      if (priorityData.isStrict()) {
        // error
        myConflictingRules.addAll(priorityData.myCauseRules);
      }
      locks.remove(mapping);
    }
  }

  @CodeOrchestraPatch
  private List<List<TemplateMappingConfiguration>> createMappingSets() {
    // reversed order
    boolean topPriorityGroup = false;
    List<List<TemplateMappingConfiguration>> mappingSets = new ArrayList<List<TemplateMappingConfiguration>>();
    while (!myPriorityMap.isEmpty()) {
      List<TemplateMappingConfiguration> mappingSet = createMappingSet(topPriorityGroup);
      if (mappingSet.isEmpty()) {
        if (!topPriorityGroup) {
          topPriorityGroup = true;
          continue;
        }
        // error!!!
        break;
      }
      mappingSets.add(mappingSet);
    }
    Collections.reverse(mappingSets);

    // CO-4941 - Absolute first rule
    Collections.sort(mappingSets, new Comparator<List<TemplateMappingConfiguration>>() {
      @Override
      public int compare(List<TemplateMappingConfiguration> templateMappingConfigurationsLeft, List<TemplateMappingConfiguration> templateMappingConfigurationsRight) {
        for (AbsoluteFirstSetData absoluteFirstMapping : myAbsoluteFirstMappings) {
          if (CollectionUtil.intersects(templateMappingConfigurationsLeft, absoluteFirstMapping.myMappings)) {
            return -1;
          }
          if (CollectionUtil.intersects(templateMappingConfigurationsRight, absoluteFirstMapping.myMappings)) {
            return 1;
          }
        }

        return 0;
      }
    });

    // sort mappings within each set: generation must be deterministic
    for (List<TemplateMappingConfiguration> mappingSet : mappingSets) {
      Collections.sort(mappingSet, new Comparator<TemplateMappingConfiguration>() {
        public int compare(TemplateMappingConfiguration o1, TemplateMappingConfiguration o2) {
          return o1.getMappingNode().getNodeId().compareTo(o2.getMappingNode().getNodeId());
        }
      });
    }
    return mappingSets;
  }

  private List<TemplateMappingConfiguration> createMappingSet(boolean topPriorityGroup) {
    // add all not-locking-mappinds to set
    List<TemplateMappingConfiguration> mappingSet = new ArrayList<TemplateMappingConfiguration>();
    for (TemplateMappingConfiguration mapping : myPriorityMap.keySet()) {
      if (mapping.isTopPriority() != topPriorityGroup) continue;
      if (!PriorityMapUtil.isLockingMapping(mapping, myPriorityMap)) {
        mappingSet.add(mapping);
      }
    }
    for (TemplateMappingConfiguration mapping : mappingSet) {
      myPriorityMap.remove(mapping);
    }
    return mappingSet;
  }
}
