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

import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.impl.*;
import jetbrains.mps.generator.impl.TemplateProcessor.TemplateProcessingFailureException;
import jetbrains.mps.generator.runtime.GenerationException;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateReductionRule;
import jetbrains.mps.generator.template.PatternRuleContext;
import jetbrains.mps.generator.template.TemplateFunctionMethodName;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.QueryMethodGenerated;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Evgeny Gryaznov, 11/23/10
 */
public class TemplateReductionPatternRuleInterpreted implements TemplateReductionRule {

  private final SNode ruleNode;

  public TemplateReductionPatternRuleInterpreted(SNode ruleNode) {
    this.ruleNode = ruleNode;
  }

  @Override
  public SNodePointer getRuleNode() {
    return new SNodePointer(ruleNode);
  }

  @Override
  public String getApplicableConcept() {
    SNode patternNode = RuleUtil.getPatternReductionRulePatternNode(ruleNode);
    return patternNode.getConceptFqName();
  }

  @Override
  public boolean applyToInheritors() {
    return false;
  }

  @Override
  public Collection<SNode> tryToApply(TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    GeneratedMatchingPattern pattern = checkIfApplicable(context.getInput(), environment.getGenerator());
    if (pattern == null) {
      return null;
    }

    SNodePointer ruleNodeId = new SNodePointer(ruleNode);
    environment.getTracer().pushRule(ruleNodeId);
    try {
      return apply(context.getInput(), pattern, environment.getEnvironment(context.getInput(), this));
    } catch (AbandonRuleInputException e) {
      return Collections.emptyList();
    } finally {
      environment.getTracer().closeRule(ruleNodeId);
    }

  }

  public GeneratedMatchingPattern checkIfApplicable(SNode inputNode, TemplateGenerator generator) throws GenerationFailureException {
    String methodName = TemplateFunctionMethodName.patternRule_Condition(ruleNode);
    try {
      return (GeneratedMatchingPattern) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new PatternRuleContext(inputNode, ruleNode, generator),
        ruleNode.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      generator.getLogger().warning(ruleNode, "cannot find condition method '" + methodName + "' : not applied");
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(ruleNode, "cannot find condition method '" + methodName + "' : not applied");
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.getLogger().error(ruleNode, "error executing pattern/condition " + methodName + " (see exception)");
      throw new GenerationFailureException(t);
    }
    return null;
  }

  @Nullable
  private Collection<SNode> apply(SNode inputNode, @NotNull GeneratedMatchingPattern pattern, @NotNull TemplateExecutionEnvironment environment)
    throws DismissTopMappingRuleException, AbandonRuleInputException, GenerationFailureException, GenerationCanceledException {

    String ruleMappingName = RuleUtil.getPatternReductionRuleLabel(ruleNode);
    SNode ruleConsequence = RuleUtil.getPatternReductionRuleConsequence(ruleNode);
    if (ruleConsequence == null) {
      environment.getGenerator().showErrorMessage(inputNode, null, ruleNode, "error processing reduction rule: no rule consequence");
      return null;
    }
    TemplateContext conseqContext = GeneratorUtil.createConsequenceContext(inputNode, new DefaultTemplateContext(pattern, null, inputNode), environment.getReductionContext(), ruleConsequence, inputNode, environment.getGenerator());

    List<Pair<SNode, String>> nodeAndMappingNamePairs = GeneratorUtilEx.getTemplateNodesFromRuleConsequence(ruleConsequence, inputNode, ruleNode, environment.getReductionContext(), environment.getGenerator());
    if (nodeAndMappingNamePairs == null) {
      environment.getGenerator().showErrorMessage(inputNode, null, ruleConsequence, "error processing reduction rule consequence");
      return null;
    }

    List<SNode> result = new ArrayList<SNode>(nodeAndMappingNamePairs.size());
    TemplateProcessor templateProcessor = new TemplateProcessor(environment.getGenerator(), environment.getReductionContext());
    for (Pair<SNode, String> nodeAndMappingNamePair : nodeAndMappingNamePairs) {
      SNode templateNode = nodeAndMappingNamePair.o1;
      String mappingName = nodeAndMappingNamePair.o2 != null ? nodeAndMappingNamePair.o2 : ruleMappingName;
      try {
        result.addAll(templateProcessor.processTemplateNode(mappingName, templateNode, conseqContext));
      } catch (DismissTopMappingRuleException e) {
        throw e;
      } catch (TemplateProcessingFailureException e) {
        environment.getGenerator().showErrorMessage(inputNode, templateNode, ruleNode, "error processing reduction rule");
      } catch (GenerationFailureException e) {
        throw e;
      } catch (GenerationCanceledException e) {
        throw e;
      } catch (Throwable t) {
        environment.getGenerator().getLogger().handleException(t);
        environment.getGenerator().showErrorMessage(inputNode, templateNode, ruleNode, "error processing reduction rule");
      }
    }
    return result;
  }
}
