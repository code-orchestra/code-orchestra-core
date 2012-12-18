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
package jetbrains.mps.generator.template;

import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.RuleUtil;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.QueryMethodGenerated;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * Evgeny Gryaznov, Feb 10, 2010
 */
public class DefaultQueryExecutionContext implements QueryExecutionContext {

  private ITemplateGenerator generator;

  public DefaultQueryExecutionContext(ITemplateGenerator generator) {
    this.generator = generator;
  }

  public boolean checkCondition(SNode condition, boolean required, SNode inputNode, SNode ruleNode) throws GenerationFailureException {
    if (condition == null) {
      if (required) {
        generator.showErrorMessage(inputNode, null, ruleNode, "rule condition required");
        return false;
      }
      return true;
    }

    String methodName = TemplateFunctionMethodName.baseMappingRule_Condition(condition);
    try {
      return (Boolean) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new BaseMappingRuleContext(inputNode, ruleNode, generator),
        ruleNode.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      generator.getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.getLogger().error(condition, "error executing condition " + methodName + ", exception was thrown");
      throw new GenerationFailureException(t);
    }
    return false;
  }

  public boolean checkConditionForIfMacro(SNode inputNode, SNode ifMacro, @NotNull TemplateContext context) throws GenerationFailureException {
    SNode function = RuleUtil.getIfMacro_ConditionFunction(ifMacro);
    if (function == null) {
      generator.showErrorMessage(inputNode, ifMacro, null, "cannot evaluate if-macro condition");
      throw new GenerationFailureException();
    }

    String methodName = TemplateFunctionMethodName.ifMacro_Condition(function);
    try {
      return (Boolean) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new IfMacroContext(inputNode, ifMacro, context, generator),
        ifMacro.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      generator.getLogger().warning(ifMacro, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(ifMacro, "cannot find condition method '" + methodName + "' : evaluate to FALSE");
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.getLogger().error(ifMacro, "error executing condition " + methodName + ", exception was thrown");
      throw new GenerationFailureException(t);
    }

    return false;
  }

  public SNode executeMapSrcNodeMacro(SNode inputNode, SNode mapSrcNodeOrListMacro, SNode parentOutputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    SNode mapperFunction = RuleUtil.getMapSrc_MapperFunction(mapSrcNodeOrListMacro);

    String methodName = TemplateFunctionMethodName.mapSrcMacro_MapperFunction(mapperFunction);
    try {
      return (SNode) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new MapSrcMacroContext(inputNode, mapSrcNodeOrListMacro, parentOutputNode, context, generator),
        mapSrcNodeOrListMacro.getModel());
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(inputNode, mapSrcNodeOrListMacro, "cannot evaluate macro: mapping func failed, exception was thrown");
      throw new GenerationFailureException(t);
    }
  }

  public void executeMapSrcNodeMacro_PostProc(SNode inputNode, SNode mapSrcNodeOrListMacro, SNode outputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    SNode postMapperFunction = RuleUtil.getMapSrc_PostMapperFunction(mapSrcNodeOrListMacro);
    // post-proc function is optional
    if (postMapperFunction == null) return;

    String methodName = TemplateFunctionMethodName.mapSrcMacro_PostMapperFunction(postMapperFunction);
    try {
      QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new MapSrcMacroPostProcContext(inputNode, mapSrcNodeOrListMacro, outputNode, context, generator),
        mapSrcNodeOrListMacro.getModel());
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(inputNode, mapSrcNodeOrListMacro, "cannot evaluate macro: post-processing failed, exception was thrown");
      throw new GenerationFailureException(t);
    }
  }

  public void expandPropertyMacro(SNode propertyMacro, SNode inputNode, SNode templateNode, SNode outputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    String propertyName = AttributeOperations.getPropertyName(propertyMacro);

    SNode function = RuleUtil.getPropertyMacro_ValueFunction(propertyMacro);
    if (propertyName == null || function == null) {
      generator.showErrorMessage(inputNode, templateNode, propertyMacro, "cannot evaluate property macro");
      throw new GenerationFailureException();
    }

    String templateValue = templateNode.getProperty(propertyName);
    String methodName = TemplateFunctionMethodName.propertyMacro_GetPropertyValue(function);
    try {
      Object macroValue = QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new PropertyMacroContext(inputNode, templateValue, propertyMacro, context, generator),
        propertyMacro.getModel());
      String propertyValue = macroValue == null ? null : String.valueOf(macroValue);
      outputNode.setProperty(propertyName, propertyValue);
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(inputNode, templateNode, propertyMacro, "cannot evaluate property macro, exception was thrown");
      throw new GenerationFailureException(t);
    }
  }

  public SNode evaluateSourceNodeQuery(SNode inputNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    String methodName = TemplateFunctionMethodName.sourceSubstituteMacro_SourceNodeQuery(query);
    try {
      return (SNode) QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new SourceSubstituteMacroNodeContext(inputNode, macroNode, context, generator),
        query.getModel());
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(macroNode, "cannot find nodes query '" + methodName + "' : evaluate to null");
      return null;
    } catch (Exception e) {
      generator.getLogger().handleException(e);
      generator.showErrorMessage(inputNode, query, "cannot evaluate query, exception was thrown");
      return null;
    }
  }

  public Object evaluateArgumentQuery(SNode inputNode, SNode query, @Nullable TemplateContext context) {
    String methodName = TemplateFunctionMethodName.templateArgumentQuery(query);
    try {
      return QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new TemplateQueryContext(inputNode, query.getParent(), context, generator),
        query.getModel());
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(query.getParent(), "cannot find nodes query '" + methodName + "' : evaluate to null");
      return null;
    } catch (Exception e) {
      generator.getLogger().handleException(e);
      generator.showErrorMessage(inputNode, query, "cannot evaluate query, exception was thrown");
      return null;
    }
  }

  /**
   * used to evaluate 'sourceNodesQuery' in macros and in rules
   */
  public List<SNode> evaluateSourceNodesQuery(SNode inputNode, SNode ruleNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    String methodName = TemplateFunctionMethodName.sourceSubstituteMacro_SourceNodesQuery(query);
    try {
      Object result = QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new SourceSubstituteMacroNodesContext(inputNode, ruleNode, macroNode, context, generator),
        query.getModel());

      List<SNode> resultList;
      if (result instanceof List) {
        resultList = (List<SNode>) result;
      } else {
        resultList = new ArrayList<SNode>(IterableUtil.asCollection((Iterable<SNode>) result));
      }

      CollectionUtil.checkForNulls(resultList);

      return resultList;
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(macroNode, "cannot find nodes query '" + methodName + "' : evaluate to empty list");
      return new ArrayList<SNode>();
    } catch (Exception e) {
      generator.getLogger().handleException(e);
      generator.showErrorMessage(inputNode, query, "cannot evaluate query, exception was thrown");
      return new LinkedList<SNode>();
    }
  }

  @Override
  public SNode evaluateInsertQuery(SNode inputNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    String methodName = TemplateFunctionMethodName.insertMacro_Query(query);
    try {
      Object result = QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new TemplateQueryContextWithMacro(inputNode, macroNode, context, generator),
        query.getModel());

      return (SNode) result;
    } catch (NoSuchMethodException e) {
      generator.getLogger().warning(macroNode, "cannot find query '" + methodName + "' : evaluate to null");
      return null;
    } catch (Exception e) {
      generator.getLogger().handleException(e);
      generator.showErrorMessage(inputNode, query, "cannot evaluate query, exception was thrown");
      return null;
    }
  }

  public SNode getContextNodeForTemplateFragment(SNode templateFragmentNode, SNode mainContextNode, @NotNull TemplateContext context) {
    SNode fragment = RuleUtil.getTemplateFragmentByAnnotatedNode(templateFragmentNode);
    // has custom context builder provider?
    SNode query = RuleUtil.getTemplateFragment_ContextNodeQuery(fragment);
    if (query != null) {
      String methodName = TemplateFunctionMethodName.templateFragment_ContextNodeQuery(query);
      try {
        return (SNode) QueryMethodGenerated.invoke(
          methodName,
          generator.getGeneratorSessionContext(),
          new TemplateFragmentContext(mainContextNode, templateFragmentNode, context, generator),
          query.getModel());
      } catch (NoSuchMethodException e) {
        generator.getLogger().warning(templateFragmentNode, "cannot find context node method for template fragment '" + methodName + "' : evaluate to null");
        return null;
      } catch (Exception e) {
        generator.getLogger().handleException(e);
        generator.showErrorMessage(context.getInput(), null, templateFragmentNode, "cannot evaluate template fragment context query, exception was thrown");
        return null;
      }
    }

    // ok, main context node by default
    return mainContextNode;
  }

  public Object getReferentTarget(SNode node, SNode outputNode, SNode refMacro, TemplateContext context) {
    SNode function = RuleUtil.getReferenceMacro_GetReferent(refMacro);
    if (function == null) {
      generator.showErrorMessage(node, refMacro, "cannot evaluate reference macro: no function");
      return null;
    }

    String methodName = TemplateFunctionMethodName.referenceMacro_GetReferent(function);
    try {
      return QueryMethodGenerated.invoke(
        methodName,
        generator.getGeneratorSessionContext(),
        new ReferenceMacroContext(node, outputNode, refMacro, context, generator),
        refMacro.getModel());

    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(node, refMacro, "cannot evaluate reference macro, exception was thrown");
    }
    return null;
  }

  public void executeInContext(SNode outputNode, TemplateContext context, PostProcessor processor) {
    processor.process(outputNode, context);
  }

  public SNode executeInContext(SNode outputNode, TemplateContext context, NodeMapper mapper) {
    return mapper.map(outputNode, context);
  }

  public Collection<SNode> tryToApply(TemplateReductionRule rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    return rule.tryToApply(environment, context);
  }

  public boolean isApplicable(TemplateRuleWithCondition rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    return rule.isApplicable(environment, context);
  }

  public Collection<SNode> applyRule(TemplateRootMappingRule rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    return rule.apply(environment, context);
  }

  public Collection<SNode> applyRule(TemplateCreateRootRule rule, TemplateExecutionEnvironment environment) throws GenerationException {
    return rule.apply(environment);
  }

  public SNode getContextNode(TemplateWeavingRule rule, TemplateExecutionEnvironment environment, TemplateContext context) {
    return rule.getContextNode(environment, context);
  }

  public void executeScript(TemplateMappingScript mappingScript, SModel model) {
    mappingScript.apply(model, generator);
  }

  public boolean isMultithreaded() {
    return true;
  }
}
