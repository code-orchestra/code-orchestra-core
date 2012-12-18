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

import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.IGenerationTracer;
import jetbrains.mps.generator.impl.TemplateProcessor.TemplateProcessingFailureException;
import jetbrains.mps.generator.runtime.GenerationException;
import jetbrains.mps.generator.runtime.TemplateExecutionEnvironment;
import jetbrains.mps.generator.runtime.TemplateWeavingRule;
import jetbrains.mps.generator.template.QueryExecutionContext;
import jetbrains.mps.smodel.FastNodeFinder;
import jetbrains.mps.smodel.SNode;

/**
 * Evgeny Gryaznov, Feb 15, 2010
 */
public class WeavingProcessor {

  private IGenerationTracer myGenerationTracer;
  private TemplateGenerator myGenerator;
  private FastNodeFinder myFastNodeFinder;

  public WeavingProcessor(TemplateGenerator generator) {
    myGenerator = generator;
    myGenerationTracer = myGenerator.getGenerationTracer();
    myFastNodeFinder = myGenerator.getInputModel().getFastNodeFinder();
  }

  public void apply(TemplateWeavingRule rule)
    throws GenerationFailureException, GenerationCanceledException {

    String applicableConcept = rule.getApplicableConcept();
    if (applicableConcept == null) {
      myGenerator.showErrorMessage(null, null, rule.getRuleNode().getNode(), "rule has no applicable concept defined");
      return;
    }

    boolean includeInheritors = rule.applyToInheritors();
    Iterable<SNode> nodes = myFastNodeFinder.getNodes(applicableConcept, includeInheritors);
    for (SNode applicableNode : nodes) {
      QueryExecutionContext executionContext = myGenerator.getExecutionContext(applicableNode);
      if (executionContext == null) {
        continue;
      }
      ReductionContext reductionContext = new ReductionContext(executionContext);
      TemplateExecutionEnvironment environment = new TemplateExecutionEnvironmentImpl(myGenerator, reductionContext, myGenerator.getOperationContext(), myGenerationTracer);

      try {
        DefaultTemplateContext context = new DefaultTemplateContext(applicableNode);
        if (executionContext.isApplicable(rule, environment, context)) {
          SNode outputContextNode = executionContext.getContextNode(rule, environment, context);
          if (!checkContext(rule, applicableNode, outputContextNode)) {
            continue;
          }
          myGenerator.setChanged();

          boolean someOutputGenerated = true;
          myGenerationTracer.pushInputNode(applicableNode);
          myGenerationTracer.pushRule(rule.getRuleNode());
          try {
            someOutputGenerated = rule.apply(environment, context, outputContextNode);

          } catch (DismissTopMappingRuleException e) {
            environment.getGenerator().showErrorMessage(context.getInput(), null, rule.getRuleNode().getNode(), "wrong template: dismission of weaving rule is not supported");
          } catch (TemplateProcessingFailureException e) {
            environment.getGenerator().showErrorMessage(context.getInput(), null, rule.getRuleNode().getNode(), "weaving rule: error processing template fragment");
          } finally {
            if (someOutputGenerated) {
              myGenerationTracer.closeInputNode(applicableNode);
            } else {
              myGenerationTracer.popInputNode(applicableNode);
            }
          }
        }
      } catch (GenerationException e) {
        if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
        if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
        myGenerator.showErrorMessage(null, rule.getRuleNode().getNode(), "internal error: " + e.toString());
      }
    }
  }

  private boolean checkContext(TemplateWeavingRule rule, SNode applicableNode, SNode contextNode) {
    if (contextNode == null) {
      myGenerator.showErrorMessage(applicableNode, rule.getRuleNode().getNode(), "weaving rule: cannot find context node");
      return false;
    }

    // Additional check - context should be generated from the same root
    SNode contextRoot = contextNode.getContainingRoot();
    boolean wasError = false;
    if (contextRoot != null) {
      SNode inputRoot = applicableNode.getContainingRoot();
      SNode originalContextRoot = myGenerator.getOriginalRootByGenerated(contextRoot);
      if (originalContextRoot == null) {
        myGenerator.showErrorIfStrict(rule.getRuleNode().getNode(), "bad context for weaving rule: " + contextRoot + " is generated by 'create root' rule");
        wasError = true;
      } else {
        if (originalContextRoot != inputRoot && inputRoot != null) {
          myGenerator.showErrorIfStrict(rule.getRuleNode().getNode(),
            "bad context for weaving rule: " + contextRoot.toString() + " is generated from " + originalContextRoot.toString()
              + ", while input node is from " + inputRoot.toString());
          wasError = true;
        }
      }
    } else {
      myGenerator.showErrorIfStrict(rule.getRuleNode().getNode(), "bad context for weaving rule: no root for context " + contextNode);
      wasError = true;
    }
    return !(wasError && myGenerator.isStrict());
  }
}
