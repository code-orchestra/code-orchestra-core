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

import jetbrains.mps.generator.impl.AbandonRuleInputException;
import jetbrains.mps.generator.impl.GeneratorUtilEx;
import jetbrains.mps.generator.impl.RuleUtil;
import jetbrains.mps.generator.impl.TemplateProcessor;
import jetbrains.mps.generator.impl.TemplateProcessor.TemplateProcessingFailureException;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.util.Pair;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Evgeny Gryaznov, Nov 29, 2010
 */
public class TemplateSwitchMappingInterpreted implements TemplateSwitchMapping {

  private final SNode mySwitch;
  private final Collection<TemplateReductionRule> rules;

  public TemplateSwitchMappingInterpreted(SNode aSwitch) {
    mySwitch = aSwitch;
    rules = new ArrayList<TemplateReductionRule>();
    for (SNode child : mySwitch.getChildrenIterable()) {
      String conceptName = child.getConceptFqName();
      if (conceptName.equals(RuleUtil.concept_Reduction_MappingRule)) {
        rules.add(new TemplateReductionRuleInterpreted(child));
      }
    }
  }

  @Override
  public SNodePointer getSwitchNode() {
    return new SNodePointer(mySwitch);
  }

  @Override
  public SNodePointer getModifiesSwitch() {
    SReference ref = mySwitch.getReference(RuleUtil.link_TemplateSwitch_modifiedSwitch);
    if (ref == null) {
      return null;
    }

    // proceed without resolving (at least for StaticReferences) 
    return new SNodePointer(ref.getTargetSModelReference(), ref.getTargetNodeId());
  }

  @Override
  public Iterable<TemplateReductionRule> getReductionRules() {
    return rules;
  }

  @Override
  public Collection<SNode> applyDefault(TemplateExecutionEnvironment environment, SNodePointer templateSwitch, String mappingName, TemplateContext context) throws GenerationException {
    SNode defaultConsequence = RuleUtil.getSwitchDefaultConsequence(mySwitch);
    if (defaultConsequence == null) {
      SNodePointer modifies = getModifiesSwitch();
      if (modifies == null) {
        return null;
      }
      TemplateSwitchMapping switchMapping = environment.getGenerator().getSwitch(modifies);
      if (switchMapping == null) {
        return null;
      }
      return switchMapping.applyDefault(environment, templateSwitch, mappingName, context);
    }

    List<SNode> collection = new ArrayList<SNode>();
    try {
      List<Pair<SNode, String>> nodeAndMappingNamePairs = GeneratorUtilEx.getTemplateNodesFromRuleConsequence(defaultConsequence, context.getInput(), templateSwitch.getNode(), environment.getReductionContext(), environment.getGenerator());
      if (nodeAndMappingNamePairs == null) {
        environment.getGenerator().showErrorMessage(context.getInput(), templateSwitch.getNode(), defaultConsequence, "error processing $SWITCH$/default");
        return null;
      }

      for (Pair<SNode, String> nodeAndMappingNamePair : nodeAndMappingNamePairs) {
        SNode altTemplateNode = nodeAndMappingNamePair.o1;
        String innerMappingName = nodeAndMappingNamePair.o2 != null ? nodeAndMappingNamePair.o2 : mappingName;
        try {
          TemplateProcessor templateProcessor = new TemplateProcessor(environment.getGenerator(), environment.getReductionContext());
          collection.addAll(templateProcessor.processTemplateNode(innerMappingName, altTemplateNode, context));
        } catch (TemplateProcessingFailureException e) {
          environment.getGenerator().showErrorMessage(context.getInput(), templateSwitch.getNode(), "error processing template fragment");
        }
      }
    } catch (AbandonRuleInputException e) {
      // it's ok. just ignore
    }
    return collection;
  }

  @Override
  public void processNull(TemplateExecutionEnvironment environment, SNodePointer templateSwitch, TemplateContext context) {

    SNode generatorMessage = RuleUtil.getSwitch_NullInputMessage(mySwitch);
    if (generatorMessage != null) {
      GeneratorUtilEx.processGeneratorMessage(generatorMessage, context.getInput(), templateSwitch.getNode(), null, environment.getGenerator());
    }
  }
}
