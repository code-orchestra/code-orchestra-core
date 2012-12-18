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

import jetbrains.mps.generator.impl.TemplateSwitchGraph;
import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.generator.runtime.TemplateModel;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.mappingpriorities.MappingPriorityRule;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * Evgeny Gryaznov, Jan 18, 2010
 */
public class GenerationPlan {

  private static final Logger LOG = Logger.getLogger(GenerationPlan.class);

  private Collection<TemplateModule> myGenerators;
  private Collection<TemplateModel> myTemplateModels;

  //  private Set<Language> myLanguages = new HashSet<Language>();
  private List<List<TemplateMappingConfiguration>> myPlan;
  private Set<TemplateMappingPriorityRule> myConflictingPriorityRules;
  private final String myInputName;
  private TemplateSwitchGraph myTemplateSwitchGraph;

  public GenerationPlan(@NotNull SModel inputModel, IScope scope) {
    myInputName = inputModel.getLongName();
    try {
      myGenerators = GenerationPartitioningUtil.getTemplateModules(inputModel);

      initTemplateModels();
//      for (Generator generator : generators) {
//        myLanguages.add(generator.getSourceLanguage());
//      }

      GenerationPartitioner partitioner = new GenerationPartitioner(myGenerators);
      myPlan = partitioner.createMappingSets();
      if (myPlan.isEmpty()) {
        myPlan.add(new ArrayList<TemplateMappingConfiguration>());
      }
      myConflictingPriorityRules = partitioner.getConflictingPriorityRules();
    } catch (Throwable t) {
      LOG.error(t);
      throw new RuntimeException("Couldn't compute generation steps for model '" + inputModel.getLongName() + "'", t);
    }
  }

  public Collection<TemplateModule> getGenerators() {
    return myGenerators;
  }

  public void initTemplateModels() {
    myTemplateModels = new ArrayList<TemplateModel>();
    for (TemplateModule module : myGenerators) {
      myTemplateModels.addAll(module.getModels());
    }
  }

  public int getStepCount() {
    return myPlan.size();
  }

  public List<TemplateMappingConfiguration> getMappingConfigurations(int step) {
    return myPlan.get(step);
  }

  public boolean isCountedLanguage(Language language) {
//    return myLanguages.contains(language);

    //
    // disable checking temporarily:
    // when generating model jetbrains.mps.baseLanguage.closures.dataFlow,
    // type SetType (from collections lang) uppears at some moment inside InternalStaticMethodCall node.
    // While language 'jetbrains.mps.baseLanguage.collections' wasn't detected when computing generation steps,
    // this is harmless for generation (because no text is generated for that node)
    // but it sets off the alarms in generator.
    //
    // todo: postpone the error reporting till text generation phase?
    // or
    // todo: in a very base text_gen class catch nodes which was not reduced (and has no text_gen) ?
    return true;
  }

  public boolean hasConflictingPriorityRules() {
    return !myConflictingPriorityRules.isEmpty();
  }

  public List<Pair<MappingPriorityRule, String>> getConflictingPriorityRulesAsStrings() {
    return GenerationPartitioningUtil.toStrings(myConflictingPriorityRules, true);
  }

  public String getSignature() {
    StringBuilder sb = new StringBuilder();
    sb.append(myInputName);
    sb.append(", ");
    sb.append(myPlan.size());
    sb.append(" steps\n");
    int i = 0;
    for (List<TemplateMappingConfiguration> step : myPlan) {
      sb.append("[" + (i++) + "]\n");
      List<String> res = new ArrayList<String>(step.size());
      for (TemplateMappingConfiguration mconfig : step) {
        res.add(toString(mconfig));
      }
      Collections.sort(res);
      for (String s : res) {
        sb.append(s);
        sb.append('\n');
      }
    }
    return sb.toString();
  }

  private static String toString(TemplateMappingConfiguration mappingConfig) {
    TemplateModel model = mappingConfig.getModel();
    return model.getLongName() + "#" + mappingConfig.getName();
  }

  public TemplateSwitchGraph getTemplateSwitchGraph() {
    return myTemplateSwitchGraph;
  }

  public void createSwitchGraph() {
    myTemplateSwitchGraph = new TemplateSwitchGraph(myTemplateModels);
  }

  public Collection<TemplateModel> getTemplateModels() {
    return myTemplateModels;
  }
}
