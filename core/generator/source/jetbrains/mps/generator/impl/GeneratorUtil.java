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

import com.intellij.openapi.util.Computable;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.IGenerationTracer;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.template.ITemplateGenerator;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class GeneratorUtil {

  private static SNode[] getArguments(SNode templateCall) {
    final List<SNode> args = RuleUtil.getTemplateCall_Arguments(templateCall);
    if (args == null || args.size() == 0) {
      return null;
    }
    return args.toArray(new SNode[args.size()]);
  }

  private static String[] getParameters(SNode templateCall, ITemplateGenerator generator) {
    final SNode template = RuleUtil.getTemplateCall_Template(templateCall);
    if (template == null) {
      return null;
    }
    String[] templateDeclarationParameterNames = RuleUtil.getTemplateDeclarationParameterNames(template);
    if(templateDeclarationParameterNames == null) {
      generator.showErrorMessage(null, template, "broken template");
      return null;
    }
    return templateDeclarationParameterNames.length == 0 ? null : templateDeclarationParameterNames;
  }

  @NotNull
  public static TemplateContext createConsequenceContext(SNode inputNode, @Nullable TemplateContext outerContext, @NotNull ReductionContext reductionContext, @NotNull SNode consequence, SNode newInputNode, ITemplateGenerator generator) {
    if (consequence.isInstanceOfConcept(RuleUtil.concept_ITemplateCall)) {
      return createTemplateCallContext(inputNode, outerContext, reductionContext, consequence, newInputNode, generator);
    }
    return outerContext != null ? outerContext : new DefaultTemplateContext(newInputNode);
  }

  @NotNull
  static TemplateContext createTemplateCallContext(SNode inputNode, @Nullable TemplateContext outerContext, @NotNull ReductionContext reductionContext, SNode templateCall, SNode newInputNode, ITemplateGenerator generator) {
    final SNode[] arguments = getArguments(templateCall);
    final String[] parameters = getParameters(templateCall, generator);

    if (arguments == null && parameters == null) {
      return outerContext != null ? outerContext.subContext(null, newInputNode) : new DefaultTemplateContext(newInputNode);
    }
    if (arguments == null || parameters == null || arguments.length != parameters.length) {
      generator.showErrorMessage(inputNode, templateCall, "number of arguments doesn't match template");
      return outerContext != null ? outerContext.subContext(null, newInputNode) : new DefaultTemplateContext(newInputNode);
    }

    final Map<String, Object> vars = new HashMap<String, Object>(arguments.length);
    for (int i = 0; i < arguments.length; i++) {
      SNode exprNode = arguments[i];
      String name = parameters[i];
      Object value = null;

      if (exprNode.isInstanceOfConcept(RuleUtil.concept_TemplateArgumentParameterExpression) && outerContext != null) {
        SNode parameter = RuleUtil.getTemplateArgumentParameterExpression_Parameter(exprNode);
        if (parameter == null) {
          generator.showErrorMessage(inputNode, exprNode, "cannot evaluate template argument #" + (i + 1) + ": invalid parameter reference");
        } else {
          value = outerContext.getVariable(parameter.getName());
        }
      } else if (exprNode.isInstanceOfConcept(RuleUtil.concept_TemplateArgumentPatternRef) && outerContext != null) {
        String patternVar = GeneratorUtilEx.getPatternVariableName(exprNode);
        if (patternVar == null) {
          generator.showErrorMessage(inputNode, exprNode, "cannot evaluate template argument #" + (i + 1) + ": invalid pattern reference");
        } else {
          // TODO FIXME using PatternVarsUtil directly, which is loaded by MPS
          value = outerContext.getPatternVariable(patternVar);
        }
      } else if (exprNode.isInstanceOfConcept(RuleUtil.concept_TemplateArgumentQueryExpression)) {
        SNode query = RuleUtil.getTemplateArgumentQueryExpression_Query(exprNode);
        value = reductionContext.getQueryExecutor().evaluateArgumentQuery(inputNode, query, outerContext);
      } else {
        try {
          value = RuleUtil.evaluateBaseLanguageExpression(exprNode);
        } catch(IllegalArgumentException ex) {
          generator.showErrorMessage(inputNode, templateCall, "cannot evaluate template argument #" + (i + 1));
        }
      }

      vars.put(name, value);
    }
    return new DefaultTemplateContext(null, vars, newInputNode);
  }


  public static void logCurrentGenerationBranch(IGeneratorLogger logger, IGenerationTracer generationTracer, boolean error) {
    List<Pair<SNode, String>> pairs = generationTracer.getNodesWithTextFromCurrentBranch();
    StringBuilder indent = new StringBuilder();
    boolean indentInc = true;
    for (Pair<SNode, String> pair : pairs) {
      String logMessage = indent + pair.o2 + (pair.o1 != null ? ": " + pair.o1.getDebugText() : "");
      if (error) {
        logger.error(pair.o1, logMessage);
      } else {
        logger.info(pair.o1, logMessage);
      }
      if (indentInc && indent.length() >= 80) {
        indentInc = false;
      } else if (indent.length() == 0) {
        indentInc = true;
      }

      if (indentInc) {
        indent.append(".");
      } else {
        indent.deleteCharAt(indent.length() - 1);
      }
    }
  }

  public static ProblemDescription describe(SNode node, String nodeRole) {
    return new ProblemDescription(node, " -- was " + nodeRole + ": " + (node == null ? "null" : node.getDebugText()));
  }

  public static ProblemDescription describeIfExists(SNode node, String nodeRole) {
    return node != null ? new ProblemDescription(node, " -- was " + nodeRole + ": " + node.getDebugText()) : null;
  }

  public static <T> T[] concat(T[] arr1, T[] arr2) {
    if (arr1 == null || arr1.length == 0) return arr2;
    if (arr2 == null || arr2.length == 0) return arr1;
    T[] result = Arrays.copyOf(arr1, arr1.length + arr2.length);
    System.arraycopy(arr2, 0, result, arr1.length, arr2.length);
    return result;
  }

  public static <T> T runReadInWrite(final GenerationComputable<T> c) throws GenerationCanceledException, GenerationFailureException {
    if (ModelAccess.instance().canRead() && !ModelAccess.instance().canWrite()) {
      return c.compute();
    }

    //throw new UnsupportedOperationException("no read from write");

    try {
      return ModelAccess.instance().runReadInWriteAction(new Computable<T>() {
        @Override
        public T compute() {
          try {
            return c.compute();
          } catch (GenerationFailureException e) {
            throw new RuntimeException(e);
          } catch (GenerationCanceledException e) {
            throw new RuntimeException(e);
          }
        }
      });
    } catch (RuntimeException th) {
      Throwable inner = th.getCause();
      if (inner instanceof GenerationFailureException) {
        throw (GenerationFailureException) inner;
      } else if (inner instanceof GenerationCanceledException) {
        throw (GenerationCanceledException) inner;
      }
      throw th;
    }
  }

  public static String getTemplateNodeId(SNode templateNode) {
    return "tpl/" + templateNode.getModel().getSModelId() + "/" + templateNode.getSNodeId();
  }
}
