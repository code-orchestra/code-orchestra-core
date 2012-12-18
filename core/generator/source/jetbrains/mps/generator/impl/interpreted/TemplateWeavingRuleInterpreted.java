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
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.*;
import jetbrains.mps.generator.impl.TemplateProcessor.TemplateProcessingFailureException;
import jetbrains.mps.generator.runtime.GenerationException;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateWeavingRule;
import jetbrains.mps.generator.template.BaseMappingRuleContext;
import jetbrains.mps.generator.template.TemplateFunctionMethodName;
import jetbrains.mps.generator.template.WeavingMappingRuleContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.QueryMethodGenerated;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Evgeny Gryaznov, Nov 30, 2010
 */
public class TemplateWeavingRuleInterpreted implements TemplateWeavingRule {

  private final SNode ruleNode;
  private final SNode applicableConcept;

  public TemplateWeavingRuleInterpreted(SNode rule) {
    ruleNode = rule;
    applicableConcept = RuleUtil.getBaseRuleApplicableConcept(ruleNode);
  }

  @Override
  public SNodePointer getRuleNode() {
    return new SNodePointer(ruleNode);
  }

  @Override
  public String getApplicableConcept() {
    return NameUtil.nodeFQName(this.applicableConcept);
  }

  @Override
  public boolean applyToInheritors() {
    return RuleUtil.getBaseRuleApplyToConceptInheritors(ruleNode);
  }

  @Override
  public SNode getContextNode(TemplateExecutionEnvironment environment, TemplateContext context) {
    SNode contextQuery = RuleUtil.getWeaving_ContextNodeQuery(ruleNode);
    if (contextQuery == null) {
      return null;
    }

    String methodName = TemplateFunctionMethodName.weaving_MappingRule_ContextNodeQuery(contextQuery);
    try {
      return (SNode) QueryMethodGenerated.invoke(
        methodName,
        environment.getGenerator().getGeneratorSessionContext(),
        new WeavingMappingRuleContext(context.getInput(), ruleNode, environment.getGenerator()),
        ruleNode.getModel());
    } catch (NoSuchMethodException e) {
      environment.getGenerator().getLogger().warning(ruleNode, "cannot find context node query '" + methodName + "' : evaluate to null");
      return null;
    } catch (Exception e) {
      environment.getGenerator().showErrorMessage(context.getInput(), null, ruleNode, "cannot evaluate rule context query");
      environment.getGenerator().getLogger().handleException(e);
    }
    return null;
  }

  @Override
  public boolean isApplicable(TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    SNode condition = RuleUtil.getBaseRuleCondition(ruleNode);
    if (condition == null) {
      return true;
    }

    String methodName = TemplateFunctionMethodName.baseMappingRule_Condition(condition);
    try {
      return (Boolean) QueryMethodGenerated.invoke(
        methodName,
        environment.getGenerator().getGeneratorSessionContext(),
        new BaseMappingRuleContext(context.getInput(), ruleNode, environment.getGenerator()),
        ruleNode.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      environment.getGenerator().getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (NoSuchMethodException e) {
      environment.getGenerator().getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (Throwable t) {
      environment.getGenerator().getLogger().handleException(t);
      environment.getGenerator().getLogger().error(condition, "error executing condition " + methodName + " (see exception)");
      throw new GenerationFailureException(t);
    }
    return false;
  }

  @Override
  public boolean apply(TemplateExecutionEnvironment environment, TemplateContext context, SNode outputContextNode) throws GenerationException {
    SNode consequence = RuleUtil.getWeaving_Consequence(ruleNode);
    if (consequence == null) {
      environment.getGenerator().showErrorMessage(context.getInput(), null, ruleNode, "weaving rule: no rule consequence");
      return false;
    }

    environment.getTracer().pushRuleConsequence(new SNodePointer(consequence));
    String consequenceConceptFQName = consequence.getConceptFqName();
    if (consequenceConceptFQName.equals(RuleUtil.concept_TemplateDeclarationReference)) {
      SNode template = RuleUtil.getTemplateDeclarationReference_Template(consequence);
      weaveTemplateDeclaration(template, outputContextNode,
        GeneratorUtil.createConsequenceContext(context.getInput(), null, environment.getReductionContext(), consequence, context.getInput(), environment.getGenerator()), environment);
      return true;

    } else if (consequenceConceptFQName.equals(RuleUtil.concept_WeaveEach_RuleConsequence)) {
      SNode query = RuleUtil.getWeaveEach_SourceNodesQuery(consequence);
      if (query == null) {
        environment.getGenerator().showErrorMessage(context.getInput(), ruleNode, "weaving rule: cannot create list of source nodes");
        return false;
      }
      SNode template = RuleUtil.getWeaveEach_Template(consequence);
      Collection<SNode> queryNodes = environment.getReductionContext().getQueryExecutor().evaluateSourceNodesQuery(context.getInput(), ruleNode, null, query, context);
      if (queryNodes.isEmpty()) {
        return false;
      }
      for (SNode queryNode : queryNodes) {
        weaveTemplateDeclaration(template, outputContextNode,
          GeneratorUtil.createConsequenceContext(queryNode, null, environment.getReductionContext(), consequence, queryNode, environment.getGenerator()), environment);
      }

      return true;
    } else {
      environment.getGenerator().showErrorMessage(context.getInput(), null, consequence, "weaving rule: unsupported rule consequence");
      return false;
    }
  }

  private void weaveTemplateDeclaration(SNode template,
                                        SNode outputContextNode, @NotNull TemplateContext context, @NotNull TemplateExecutionEnvironment environment)
    throws GenerationFailureException, GenerationCanceledException {

    environment.getTracer().pushInputNode(context.getInput());
    try {
      weaveTemplateDeclaration_intern(template, outputContextNode, context, environment);
    } finally {
      environment.getTracer().closeInputNode(context.getInput());
    }
  }

  private void weaveTemplateDeclaration_intern(SNode template, SNode outputContextNode, @NotNull TemplateContext context, @NotNull TemplateExecutionEnvironment environment)
    throws GenerationFailureException, GenerationCanceledException {

    if (template == null) {
      environment.getGenerator().showErrorMessage(context.getInput(), null, ruleNode, "couldn't evaluate weaving rule: no template");
      return;
    }

    List<SNode> templateFragments = GeneratorUtilEx.getTemplateFragments(template);
    if (templateFragments.isEmpty()) {
      environment.getGenerator().showErrorMessage(context.getInput(), template, ruleNode, "nothing to weave: no template fragments found in template");
      return;
    }

    // check fragments: all fragments with <default context> should have the same parent
    checkTemplateFragmentsForWeaving(template, templateFragments, environment.getGenerator());

    String ruleMappingName = RuleUtil.getBaseRuleLabel(ruleNode);

    // for each template fragment create output nodes
    TemplateProcessor templateProcessor = new TemplateProcessor(environment.getGenerator(), environment.getReductionContext());
    for (SNode templateFragment : templateFragments) {
      SNode templateFragmentNode = templateFragment.getParent();
      SNode contextParentNode = null;
      try {
        contextParentNode = environment.getReductionContext().getQueryExecutor().getContextNodeForTemplateFragment(templateFragmentNode, outputContextNode, context);
      } catch (Exception e) {
        environment.getGenerator().getLogger().handleException(e);
      }
      if (contextParentNode != null) {
        try {
          List<SNode> outputNodesToWeave = templateProcessor.processTemplateNode(
            GeneratorUtilEx.getMappingName(templateFragment, ruleMappingName),
            templateFragmentNode, context);
          String childRole = templateFragmentNode.getRole_();
          for (SNode outputNodeToWeave : outputNodesToWeave) {
            environment.weaveNode(contextParentNode, childRole, outputNodeToWeave, new SNodePointer(templateFragment), context.getInput());
          }
        } catch (DismissTopMappingRuleException e) {
          environment.getGenerator().showErrorMessage(context.getInput(), templateFragment, ruleNode, "wrong template: dismission of weaving rule is not supported");
        } catch (TemplateProcessingFailureException e) {
          // FIXME
          environment.getGenerator().showErrorMessage(context.getInput(), templateFragment, ruleNode, "error processing template fragment");
          environment.getGenerator().getLogger().info(contextParentNode, " -- was output context node:");
        }
      } else {
        environment.getGenerator().showErrorMessage(context.getInput(), templateFragment, ruleNode, "couldn't define 'context' for template fragment");
      }
    }
  }

  public static void checkTemplateFragmentsForWeaving(SNode template, List<SNode> templateFragments, TemplateGenerator generator) {

    // all fragments with <default context> should have the same parent
    boolean sameParent = true;
    SNode defaultContext = null;
    for (SNode templateFragment : templateFragments) {
      if (RuleUtil.getTemplateFragment_ContextNodeQuery(templateFragment) == null) { // uses <default context>
        SNode fragmentContextNode = templateFragment.getParent().getParent();
        if (defaultContext == null) {
          defaultContext = fragmentContextNode;
        } else if (defaultContext != fragmentContextNode) {
          sameParent = false;
          break;
        }
      }
    }
    if (!sameParent) {
      List<ProblemDescription> list = new ArrayList<ProblemDescription>();
      for (SNode templateFragment : templateFragments) {
        if (RuleUtil.getTemplateFragment_ContextNodeQuery(templateFragment) == null) { // uses <default context>
          list.add(GeneratorUtil.describe(templateFragment, "template fragment"));
        }
      }
      generator.getLogger().error(template, "all fragments with <default context> should have the same parent",
        list.toArray(new ProblemDescription[list.size()]));
    }
  }
}
