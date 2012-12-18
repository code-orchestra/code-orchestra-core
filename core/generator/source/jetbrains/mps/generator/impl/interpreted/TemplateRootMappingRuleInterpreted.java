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
import jetbrains.mps.generator.impl.TemplateProcessor;
import jetbrains.mps.generator.runtime.GenerationException;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateRootMappingRule;
import jetbrains.mps.generator.template.BaseMappingRuleContext;
import jetbrains.mps.generator.template.TemplateFunctionMethodName;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.QueryMethodGenerated;

import java.util.Collection;

/**
 * Evgeny Gryaznov, Nov 30, 2010
 */
public class TemplateRootMappingRuleInterpreted implements TemplateRootMappingRule {

  private final SNode ruleNode;
  private final SNode applicableConcept;

  public TemplateRootMappingRuleInterpreted(SNode rule) {
    ruleNode = rule;
    applicableConcept = RuleUtil.getBaseRuleApplicableConcept(rule);
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
  public boolean keepSourceRoot() {
    return RuleUtil.getRootRuleKeepSourceRoot(ruleNode);
  }

  @Override
  public boolean isApplicable(TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationFailureException {
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
  public Collection<SNode> apply(TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationException {
    SNode templateNode = RuleUtil.getRootRuleTemplateNode(ruleNode);
    if (templateNode != null) {
      String ruleMappingName = RuleUtil.getBaseRuleLabel(ruleNode);

      return new TemplateProcessor(environment.getGenerator(), environment.getReductionContext())
        .processTemplateNode(ruleMappingName, templateNode, context);
    } else {
      environment.getGenerator().showErrorMessage(context.getInput(), null, ruleNode, "no template is defined for the rule");
    }
    return null;
  }
}
