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
package jetbrains.mps.generator.impl.template;

import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.interpreted.TemplateCreateRootRuleInterpreted;
import jetbrains.mps.generator.impl.interpreted.TemplateRootMappingRuleInterpreted;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.generator.template.QueryExecutionContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.JavaNameUtil;
import jetbrains.mps.util.performance.IPerformanceTracer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;
import java.util.List;

/**
 * Evgeny Gryaznov, May 13, 2010
 */
public class QueryExecutionContextWithTracing implements QueryExecutionContext {

  private final QueryExecutionContext wrapped;
  private final IPerformanceTracer tracer;

  public QueryExecutionContextWithTracing(QueryExecutionContext wrapped, IPerformanceTracer tracer) {
    this.wrapped = wrapped;
    this.tracer = tracer;
  }

  private static String getRulePackage(SNode ruleNode) {
    return JavaNameUtil.packageNameForModelUID(ruleNode.getModel().getSModelReference());
  }

  private static String taskName(@NotNull String name, SNode ruleNode) {
    if (ruleNode == null || ruleNode.getModel() == null) {
      return name;
    }
    return "query in " + getRulePackage(ruleNode); //name;
  }

  @Override
  public boolean checkCondition(SNode condition, boolean required, SNode inputNode, SNode ruleNode) throws GenerationFailureException {
    try {
      tracer.push(taskName("check condition", ruleNode), true);
      return wrapped.checkCondition(condition, required, inputNode, ruleNode);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public boolean checkConditionForIfMacro(SNode inputNode, SNode ifMacro, @NotNull TemplateContext context) throws GenerationFailureException {
    try {
      tracer.push(taskName("check if condition", ifMacro), true);
      return wrapped.checkConditionForIfMacro(inputNode, ifMacro, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode executeMapSrcNodeMacro(SNode inputNode, SNode mapSrcNodeOrListMacro, SNode parentOutputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    try {
      tracer.push(taskName("map-src node macro", mapSrcNodeOrListMacro), true);
      return wrapped.executeMapSrcNodeMacro(inputNode, mapSrcNodeOrListMacro, parentOutputNode, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public void executeMapSrcNodeMacro_PostProc(SNode inputNode, SNode mapSrcNodeOrListMacro, SNode outputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    try {
      tracer.push(taskName("map-src postproc", mapSrcNodeOrListMacro), true);
      wrapped.executeMapSrcNodeMacro_PostProc(inputNode, mapSrcNodeOrListMacro, outputNode, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public void expandPropertyMacro(SNode propertyMacro, SNode inputNode, SNode templateNode, SNode outputNode, @NotNull TemplateContext context) throws GenerationFailureException {
    try {
      tracer.push(taskName("property macro", templateNode), true);
      wrapped.expandPropertyMacro(propertyMacro, inputNode, templateNode, outputNode, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode evaluateSourceNodeQuery(SNode inputNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    try {
      tracer.push(taskName("evaluate source node", macroNode), true);
      return wrapped.evaluateSourceNodeQuery(inputNode, macroNode, query, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public List<SNode> evaluateSourceNodesQuery(SNode inputNode, SNode ruleNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    try {
      tracer.push(taskName("evaluate source nodes", query), true);
      return wrapped.evaluateSourceNodesQuery(inputNode, ruleNode, macroNode, query, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode evaluateInsertQuery(SNode inputNode, SNode macroNode, SNode query, @NotNull TemplateContext context) {
    try {
      tracer.push(taskName("insert node query", query), true);
      return wrapped.evaluateInsertQuery(inputNode, macroNode, query, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode getContextNodeForTemplateFragment(SNode templateFragmentNode, SNode mainContextNode, @NotNull TemplateContext context) {
    try {
      tracer.push(taskName("context for template fragment", templateFragmentNode), true);
      return wrapped.getContextNodeForTemplateFragment(templateFragmentNode, mainContextNode, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public Object getReferentTarget(SNode node, SNode outputNode, SNode refMacro, TemplateContext context) {
    try {
      tracer.push(taskName("referent target", refMacro), true);
      return wrapped.getReferentTarget(node, outputNode, refMacro, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public Object evaluateArgumentQuery(SNode inputNode, SNode query, @Nullable TemplateContext context) {
    try {
      tracer.push(taskName("evaluate template argument query", query), true);
      return wrapped.evaluateArgumentQuery(inputNode, query, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public void executeInContext(SNode outputNode, TemplateContext context, PostProcessor processor) {
    try {
      tracer.push("query in " + processor.getClass().getCanonicalName(), true);
      wrapped.executeInContext(outputNode, context, processor);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode executeInContext(SNode outputNode, TemplateContext context, NodeMapper mapper) {
    try {
      tracer.push("query in " + mapper.getClass().getCanonicalName(), true);
      return wrapped.executeInContext(outputNode, context, mapper);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public Collection<SNode> tryToApply(TemplateReductionRule rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    try {
      tracer.push(taskName("trying to apply rule", rule.getRuleNode().getNode()), true);
      return wrapped.tryToApply(rule, environment, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public boolean isApplicable(TemplateRuleWithCondition rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    try {
      tracer.push(taskName("check condition", rule.getRuleNode().getNode()), true);
      return wrapped.isApplicable(rule, environment, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public Collection<SNode> applyRule(TemplateRootMappingRule rule, TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    if(rule instanceof TemplateRootMappingRuleInterpreted) {
      return wrapped.applyRule(rule, environment, context);
    }
    try {
      tracer.push(taskName("root mapping rule", rule.getRuleNode().getNode()), true);
      return wrapped.applyRule(rule, environment,context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public Collection<SNode> applyRule(TemplateCreateRootRule rule, TemplateExecutionEnvironment environment) throws GenerationException {
    if(rule instanceof TemplateCreateRootRuleInterpreted) {
      return wrapped.applyRule(rule, environment);
    }
    try {
      tracer.push(taskName("create root rule", rule.getRuleNode().getNode()), true);
      return wrapped.applyRule(rule, environment);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public SNode getContextNode(TemplateWeavingRule rule, TemplateExecutionEnvironment environment, TemplateContext context) {
    try {
      tracer.push(taskName("context for weaving", rule.getRuleNode().getNode()), true);
      return wrapped.getContextNode(rule, environment, context);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public void executeScript(TemplateMappingScript mappingScript, SModel model) {
    try {
      tracer.push(taskName("mapping script", mappingScript.getScriptNode().getNode()), true);
      wrapped.executeScript(mappingScript, model);
    } finally {
      tracer.pop();
    }
  }

  @Override
  public boolean isMultithreaded() {
    return false;
  }
}
