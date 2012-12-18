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
package jetbrains.mps.generator.impl;

import jetbrains.mps.generator.impl.plan.GenerationPlan;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.FlattenIterable;

import java.util.*;

/**
 * Manages rules/templates of major step.
 */
public class RuleManager {

  private FlattenIterable<TemplateCreateRootRule> myCreateRootRules;
  private FlattenIterable<TemplateRootMappingRule> myRoot_MappingRules;
  private FlattenIterable<TemplateWeavingRule> myWeaving_MappingRules;
  private FlattenIterable<TemplateDropRootRule> myDropRootRules;

  private TemplateSwitchGraph myTemplateSwitchGraph;

  private List<TemplateMappingScript> myPreScripts;
  private List<TemplateMappingScript> myPostScripts;

  private List<TemplateMappingConfiguration> myMappings;

  private Map<SModelReference, TemplateModel> myModelMap;

  private final FastRuleFinder myRuleFinder;

  public RuleManager(GenerationPlan plan, List<TemplateMappingConfiguration> configurations) {
    myMappings = configurations;
    myTemplateSwitchGraph = plan.getTemplateSwitchGraph();
    if (myTemplateSwitchGraph == null) throw new IllegalStateException("switch graph is not initialized");
    initialize(myMappings);
    myRuleFinder = initRules(myMappings);

    myModelMap = new HashMap<SModelReference, TemplateModel>();
    for(TemplateModel m : plan.getTemplateModels()) {
      myModelMap.put(m.getSModelReference(), m);
    }
  }

  private void initialize(List<TemplateMappingConfiguration> list) {
    myCreateRootRules = new FlattenIterable(new ArrayList<List<TemplateCreateRootRule>>(list.size()));
    myRoot_MappingRules = new FlattenIterable(new ArrayList<List<TemplateRootMappingRule>>(list.size()));
    myWeaving_MappingRules = new FlattenIterable(new ArrayList<List<TemplateWeavingRule>>(list.size()));
    myDropRootRules = new FlattenIterable(new ArrayList<List<TemplateDropRootRule>>(list.size()));

    for (TemplateMappingConfiguration mappingConfig : list) {
      myCreateRootRules.add(mappingConfig.getCreateRules());
      myRoot_MappingRules.add(mappingConfig.getRootRules());
      myWeaving_MappingRules.add(mappingConfig.getWeavingRules());
      myDropRootRules.add(mappingConfig.getDropRules());
    }

    myPostScripts = new LinkedList<TemplateMappingScript>();
    myPreScripts = new LinkedList<TemplateMappingScript>();
    for (TemplateMappingConfiguration mappingConfigs : myMappings) {
      myPostScripts.addAll(mappingConfigs.getPostScripts());
      myPreScripts.addAll(mappingConfigs.getPreScripts());
    }
  }

  private FastRuleFinder initRules(List<TemplateMappingConfiguration> configuration) {
    FlattenIterable<TemplateReductionRule> rules = new FlattenIterable<TemplateReductionRule>(new ArrayList<Iterable<TemplateReductionRule>>());
    for (TemplateMappingConfiguration c : configuration) {
      rules.add(c.getReductionRules());
    }

    return new FastRuleFinder(rules);
  }

  public Iterable<TemplateCreateRootRule> getCreateRootRules() {
    return myCreateRootRules;
  }

  public Iterable<TemplateRootMappingRule> getRoot_MappingRules() {
    return myRoot_MappingRules;
  }

  public FlattenIterable<TemplateWeavingRule> getWeaving_MappingRules() {
    return myWeaving_MappingRules;
  }

  public boolean hasWeavings() {
    // todo: optimize
    return myWeaving_MappingRules.iterator().hasNext();
  }

  public FlattenIterable<TemplateDropRootRule> getDropRootRules() {
    return myDropRootRules;
  }

  public FastRuleFinder getRuleFinder() {
    return myRuleFinder;
  }

  public FastRuleFinder getRuleFinder(SNodePointer switch_) {
    return myTemplateSwitchGraph.getRuleFinder(switch_);
  }

  public TemplateSwitchMapping getSwitch(SNodePointer switch_) {
    return myTemplateSwitchGraph.getSwitch(switch_);
  }

  public TemplateModel getTemplateModel(SModelReference modelReference) {
    return myModelMap.get(modelReference);
  }

  public List<TemplateMappingScript> getPreMappingScripts() {
    return myPreScripts;
  }

  public List<TemplateMappingScript> getPostMappingScripts() {
    return myPostScripts;
  }
}
