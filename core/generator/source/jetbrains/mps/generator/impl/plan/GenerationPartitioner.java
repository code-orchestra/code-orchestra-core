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

import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.generator.runtime.TemplateModel;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.mappingpriorities.*;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;
import java.util.Map.Entry;

/**
 * Igor Alshannikov
 * Date: Mar 27, 2007
 */
public class GenerationPartitioner {
  private static final Logger LOG = Logger.getLogger(GenerationPartitioner.class);

  // generators
  private final Collection<TemplateModule> myGenerators;

  // maps
  private final Map<ModuleReference, TemplateModule> myModulesMap;
  private final Map<SModelReference, TemplateModel> myModelMap;

  // result
  private final Map<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>> myPriorityMap;
  private final List<CoherentSetData> myCoherentMappings;
  private final List<AbsoluteFirstSetData> myAbsoluteFirstMappings;
  private Set<TemplateMappingPriorityRule> myConflictingRules;

  @CodeOrchestraPatch
  public GenerationPartitioner(Collection<TemplateModule> generators) {
    myGenerators = generators;
    myPriorityMap = new HashMap<TemplateMappingConfiguration, Map<TemplateMappingConfiguration, PriorityData>>();
    myCoherentMappings = new ArrayList<CoherentSetData>();
    myAbsoluteFirstMappings = new ArrayList<AbsoluteFirstSetData>(); // CO-4941
    myConflictingRules = new HashSet<TemplateMappingPriorityRule>();

    myModulesMap = new HashMap<ModuleReference, TemplateModule>(myGenerators.size());
    myModelMap = new HashMap<SModelReference, TemplateModel>();
    for (TemplateModule module : myGenerators) {
      myModulesMap.put(module.getReference(), module);
      for (TemplateModel model : module.getModels()) {
        myModelMap.put(model.getSModelReference(), model);
      }
    }

  }

  @CodeOrchestraPatch
  public List<List<TemplateMappingConfiguration>> createMappingSets() {
    for (TemplateModule generator : myGenerators) {
      for (TemplateModel model : generator.getModels()) {
        for (TemplateMappingConfiguration m : model.getConfigurations()) {
          myPriorityMap.put(m, new HashMap<TemplateMappingConfiguration, PriorityData>());
        }
      }
    }

    // get priority mapping rules from generators and build 'priority map'
    loadRules();

    // solve
    return new PartitioningSolver(myPriorityMap, myCoherentMappings, myConflictingRules, myAbsoluteFirstMappings).solve(); // CO-4941
  }

  private void loadRules() {
    for (TemplateModule generator : myGenerators) {
      Collection<TemplateMappingPriorityRule> priorities = generator.getPriorities();
      if (priorities == null) {
        continue;
      }
      for (TemplateMappingPriorityRule rule : priorities) {
        processRule((MappingPriorityRule) rule, generator);
      }
    }
  }

  private void printRules() {
    for (TemplateMappingConfiguration left : myPriorityMap.keySet()) {
      Map<TemplateMappingConfiguration, PriorityData> right = myPriorityMap.get(left);

      System.out.println(left.getName() + " (" + left.getModel().getLongName() + ")");
      for (Entry<TemplateMappingConfiguration, PriorityData> entry : right.entrySet()){
        System.out.println("\t\t" + (entry.getValue().isStrict() ? "<   " : "<= ") + entry.getKey().getName() + " (" + entry.getKey().getModel().getLongName() + ")");
      }
    }
  }

  @CodeOrchestraPatch
  private void processRule(MappingPriorityRule rule, TemplateModule generator) {
    MappingConfig_AbstractRef left = rule.getLeft();
    MappingConfig_AbstractRef right = rule.getRight();
    if (left == null || right == null) return;

    Collection<TemplateMappingConfiguration> hiPrio = getMappingsFromRef(left, generator);
    Collection<TemplateMappingConfiguration> loPrio = getMappingsFromRef(right, generator);

    // CO-4941
    if (rule.getType() == RuleType.ABSOLUTE_FIRST) {
      myAbsoluteFirstMappings.add(new AbsoluteFirstSetData(new HashSet<TemplateMappingConfiguration>(hiPrio)));
    } else if (rule.getType() == RuleType.STRICTLY_TOGETHER) {
      Set<TemplateMappingConfiguration> coherentMappings = new HashSet<TemplateMappingConfiguration>(loPrio);
      coherentMappings.addAll(hiPrio);
      myCoherentMappings.add(new CoherentSetData(coherentMappings, rule));
    } else {

      // swap
      if(rule.getType() == RuleType.STRICTLY_AFTER || rule.getType() == RuleType.AFTER_OR_TOGETHER) {
        Collection<TemplateMappingConfiguration> temp = hiPrio;
        hiPrio = loPrio;
        loPrio = temp;
      }

      // map: lo-pri mapping -> {hi-pri mapping, .... , hi-pri mapping }
      loPrio = CollectionUtil.subtract(loPrio, hiPrio);
      boolean isStrict = rule.getType() == RuleType.STRICTLY_BEFORE || rule.getType() == RuleType.STRICTLY_AFTER;

      for (TemplateMappingConfiguration lesserPriMapping : loPrio) {
        Map<TemplateMappingConfiguration, PriorityData> grtPriMappingsFromMap = myPriorityMap.get(lesserPriMapping);

        for (TemplateMappingConfiguration grtPriMapping : hiPrio) {
          if (!grtPriMappingsFromMap.containsKey(grtPriMapping)) {
            grtPriMappingsFromMap.put(grtPriMapping, new PriorityData(isStrict, rule));
          } else {
            PriorityData priorityData = grtPriMappingsFromMap.get(grtPriMapping);
            if (isStrict) priorityData.myStrict = true;
            priorityData.myCauseRules.add(rule);
          }
        }
      }
    }
  }

  private Collection<TemplateMappingConfiguration> getMappingsFromRef(MappingConfig_AbstractRef mappingRef, TemplateModule refGenerator) {
    if (mappingRef instanceof MappingConfig_RefAllGlobal) {
      return new ArrayList<TemplateMappingConfiguration>(myPriorityMap.keySet());
    }

    if (mappingRef instanceof MappingConfig_RefAllLocal) {
      List<TemplateMappingConfiguration> mappingConf = new ArrayList<TemplateMappingConfiguration>();
      for (TemplateModel templateModel : refGenerator.getModels()) {
        for (TemplateMappingConfiguration n : templateModel.getConfigurations()) {
          mappingConf.add(n);
        }
      }
      return mappingConf;
    }

    if (mappingRef instanceof MappingConfig_RefSet) {
      List<TemplateMappingConfiguration> result = new ArrayList<TemplateMappingConfiguration>();
      MappingConfig_RefSet refSet = ((MappingConfig_RefSet) mappingRef);
      for (MappingConfig_AbstractRef simpleRef : refSet.getMappingConfigs()) {
        result.addAll(getMappingsFromRef(simpleRef, refGenerator));
      }
      return result;
    }

    if (mappingRef instanceof MappingConfig_ExternalRef) {
      ModuleReference generatorRef = ((MappingConfig_ExternalRef) mappingRef).getGenerator();
      if (generatorRef != null) {
        ModuleReference genRef = generatorRef;
        TemplateModule newRefGenerator = myModulesMap.get(genRef);
        if (newRefGenerator != null) {
          return getMappingsFromRef(((MappingConfig_ExternalRef) mappingRef).getMappingConfig(), newRefGenerator);
        } else {
          // generator is not in the plan - just ignore
          // LOG.error("couldn't get generator by uid: '" + genRef + "'");
        }
      }
      return Collections.emptyList();
    }

    if (mappingRef instanceof MappingConfig_SimpleRef) {
      String modelUID = ((MappingConfig_SimpleRef) mappingRef).getModelUID();
      String nodeID = ((MappingConfig_SimpleRef) mappingRef).getNodeID();
      if (modelUID != null && nodeID != null) {
        SModelReference reference = SModelReference.fromString(modelUID);
        TemplateModel refModel = myModelMap.get(reference);

        if (refModel != null) {
          if (nodeID.equals("*")) {
            return refModel.getConfigurations();
          } else {
            SNodePointer node = new SNodePointer(reference, SNodeId.fromString(nodeID));
            for (TemplateMappingConfiguration m : refModel.getConfigurations()) {
              if (node != null && node.equals(m.getMappingNode())) {
                return Collections.singletonList(m);
              }
            }
            LOG.warning("couldn't get node by id: '" + nodeID + "' in model " + modelUID);
          }
        } else {
          LOG.warning("couldn't get model by uid: '" + modelUID + "' in generator " + refGenerator.getAlias());
        }
      }
      return Collections.emptyList();
    }

    return Collections.emptyList();
  }

  public Set<TemplateMappingPriorityRule> getConflictingPriorityRules() {
    return myConflictingRules;
  }


  static class PriorityData {
    boolean myStrict;
    Set<MappingPriorityRule> myCauseRules = new HashSet<MappingPriorityRule>();

    public PriorityData(boolean strict, MappingPriorityRule causeRule) {
      this.myStrict = strict;
      this.myCauseRules.add(causeRule);
    }

    public PriorityData(boolean strict, Set<MappingPriorityRule> causeRules) {
      this.myStrict = strict;
      this.myCauseRules.addAll(causeRules);
    }

    public PriorityData(PriorityData pd) {
      update(pd);
    }

    public boolean isStrict() {
      return myStrict;
    }

    public boolean isWeak() {
      return !myStrict;
    }

    public void update(PriorityData pd) {
      myCauseRules.addAll(pd.myCauseRules);
      if (pd.myStrict) {
        myStrict = true;
      }
    }

    public String toString() {
      return "[" + (myStrict ? "strict" : "weak") + " " + myCauseRules.size() + "]";
    }
  } // class PriorityData

  static class CoherentSetData {
    Set<TemplateMappingConfiguration> myMappings;
    Set<MappingPriorityRule> myCauseRules;

    public CoherentSetData(Set<TemplateMappingConfiguration> mappings, MappingPriorityRule rule) {
      myMappings = mappings;
      myCauseRules = new HashSet<MappingPriorityRule>();
      myCauseRules.add(rule);
    }
  } // class CoherentSetData

  @CodeOrchestraPatch
  static class AbsoluteFirstSetData {
    Set<TemplateMappingConfiguration> myMappings;

    public AbsoluteFirstSetData(Set<TemplateMappingConfiguration> mappings) {
      myMappings = mappings;
    }
  }
}
