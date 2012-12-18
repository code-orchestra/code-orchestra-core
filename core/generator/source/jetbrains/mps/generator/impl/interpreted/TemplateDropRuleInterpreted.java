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
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.runtime.TemplateDropRootRule;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.template.DropRootRuleContext;
import jetbrains.mps.generator.template.TemplateFunctionMethodName;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.QueryMethodGenerated;

/**
 * Evgeny Gryaznov, Nov 30, 2010
 */
public class TemplateDropRuleInterpreted implements TemplateDropRootRule {

  private final SNode ruleNode;
  private final SNode applicableConcept;

  public TemplateDropRuleInterpreted(SNode child) {
    this.ruleNode = child;
    this.applicableConcept = RuleUtil.getDropRuleApplicableConcept(ruleNode);
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
  public boolean isApplicable(TemplateExecutionEnvironment environment, TemplateContext context) throws GenerationFailureException {
    SNode condition = RuleUtil.getDropRuleCondition(ruleNode);
    if (condition == null) {
      // condition is not required
      return true;
    }

    String methodName = TemplateFunctionMethodName.dropRootRule_Condition(condition);
    try {
      return (Boolean) QueryMethodGenerated.invoke(
        methodName,
        environment.getGenerator().getGeneratorSessionContext(),
        new DropRootRuleContext(context.getInput(), ruleNode, environment.getGenerator()),
        ruleNode.getModel(),
        true);
    } catch (ClassNotFoundException e) {
      environment.getGenerator().getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to TRUE");
    } catch (NoSuchMethodException e) {
      environment.getGenerator().getLogger().warning(condition, "cannot find condition method '" + methodName + "' : evaluate to TRUE");
    } catch (Throwable t) {
      environment.getGenerator().getLogger().handleException(t);
      environment.getGenerator().getLogger().error(condition, "error executing condition " + methodName + " (see exception)");
      throw new GenerationFailureException(t);
    }
    // in this case 'true' is better default
    return true;
  }
}
