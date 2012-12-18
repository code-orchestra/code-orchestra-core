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
package jetbrains.mps.generator.impl.interpreted;

import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.RuleUtil;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.generator.template.ITemplateGenerator;
import jetbrains.mps.generator.template.TemplateFunctionMethodName;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.QueryMethodGenerated;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Evgeny Gryaznov, Nov 29, 2010
 */
public class TemplateMappingConfigurationInterpreted implements TemplateMappingConfiguration {

  private final SNode myMappingConfiguration;

  private List<TemplateReductionRule> myReductionRules = new ArrayList<TemplateReductionRule>();
  private List<TemplateCreateRootRule> myCreateRootRules = new ArrayList<TemplateCreateRootRule>();
  private List<TemplateRootMappingRule> myRootMappingRules = new ArrayList<TemplateRootMappingRule>();
  private List<TemplateWeavingRule> myWeaving_MappingRules = new ArrayList<TemplateWeavingRule>();
  private List<TemplateDropRootRule> myDropRootRules = new ArrayList<TemplateDropRootRule>();

  private List<TemplateMappingScript> myPreScripts = new ArrayList<TemplateMappingScript>();
  private List<TemplateMappingScript> myPostScripts = new ArrayList<TemplateMappingScript>();
  private TemplateModel myModel;

  public TemplateMappingConfigurationInterpreted(TemplateModel model, SNode mappingConfiguration) {
    myModel = model;
    myMappingConfiguration = mappingConfiguration;
    int patternRulesCount = 0;

    for (SNode child : mappingConfiguration.getChildrenIterable()) {
      String conceptName = child.getConceptFqName();
      if (conceptName.equals(RuleUtil.concept_Reduction_MappingRule)) {
        myReductionRules.add(new TemplateReductionRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_Root_MappingRule)) {
        myRootMappingRules.add(new TemplateRootMappingRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_PatternReduction_MappingRule)) {
        // TODO make more effective
        myReductionRules.add(patternRulesCount++, new TemplateReductionPatternRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_CreateRootRule)) {
        myCreateRootRules.add(new TemplateCreateRootRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_Weaving_MappingRule)) {
        myWeaving_MappingRules.add(new TemplateWeavingRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_DropRootRule)) {
        myDropRootRules.add(new TemplateDropRuleInterpreted(child));
      } else if (conceptName.equals(RuleUtil.concept_MappingScriptReference)) {
        SNode mappingScript = RuleUtil.getMappingScriptReference_Script(child);
        if (mappingScript == null) {
          continue;
        }
        if (child.getRole_().equals(RuleUtil.link_MappingConfiguration_preMappingScript)) {
          myPreScripts.add(new TemplateMappingScriptInterpreted(mappingScript));
        } else {
          myPostScripts.add(new TemplateMappingScriptInterpreted(mappingScript));
        }
      }
    }
  }

  @Override
  public boolean isTopPriority() {
    return RuleUtil.getMappingConfiguration_TopPrio(myMappingConfiguration);
  }

  @Override
  public SNodePointer getMappingNode() {
    return new SNodePointer(myMappingConfiguration);
  }

  @Override
  public boolean isApplicable(ITemplateGenerator generator) throws GenerationException {
    SNode condition = RuleUtil.getMappingConfiguration_IsApplicable(myMappingConfiguration);
    if (condition == null) {
      return true;
    }

    return checkCondition(condition, generator);
  }

  public boolean checkCondition(SNode condition, ITemplateGenerator generator) throws GenerationFailureException {
    String methodName = TemplateFunctionMethodName.mappingConfiguration_Condition(condition);
    try {
      return (Boolean) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new TemplateQueryContext(null, null, null, generator),
        condition.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      generator.getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to TRUE");
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to TRUE");
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.getLogger().error(condition, "error executing condition " + methodName + " (see exception)");
      throw new GenerationFailureException(t);
    }
    return true;
  }

  @Override
  public String getName() {
    return myMappingConfiguration.getName();
  }

  @Override
  public Collection<TemplateRootMappingRule> getRootRules() {
    return myRootMappingRules;
  }

  @Override
  public Collection<TemplateCreateRootRule> getCreateRules() {
    return myCreateRootRules;
  }

  @Override
  public Collection<TemplateDropRootRule> getDropRules() {
    return myDropRootRules;
  }

  @Override
  public Collection<TemplateReductionRule> getReductionRules() {
    return myReductionRules;
  }

  @Override
  public Collection<TemplateWeavingRule> getWeavingRules() {
    return myWeaving_MappingRules;
  }

  @Override
  public Collection<TemplateMappingScript> getPreScripts() {
    return myPreScripts;
  }

  @Override
  public Collection<TemplateMappingScript> getPostScripts() {
    return myPostScripts;
  }

  @Override
  public TemplateModel getModel() {
    return myModel;
  }
}
