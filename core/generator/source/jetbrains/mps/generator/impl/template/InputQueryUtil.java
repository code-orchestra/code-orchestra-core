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
import jetbrains.mps.generator.impl.ReductionContext;
import jetbrains.mps.generator.impl.RuleUtil;
import jetbrains.mps.generator.runtime.TemplateContext;
import jetbrains.mps.generator.template.ITemplateGenerator;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by: Sergey Dmitriev
 * Date: Jan 24, 2007
 */
public class InputQueryUtil {

  private static Set<String> requiredSourceNodesQuery = fillSet();

  private static Set<String> fillSet() {
    Set<String> res = new HashSet<String>();
    res.add(RuleUtil.concept_LoopMacro);
    res.add(RuleUtil.concept_MapSrcListMacro);
    res.add(RuleUtil.concept_CopySrcListMacro);
    res.add(RuleUtil.concept_CopySrcNodeMacro);
    return res;
  }

  public static SNode getNodeToInsert(SNode insertMacro, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext, @NotNull ITemplateGenerator generator) throws GenerationFailureException {
    try {
      SNode query = RuleUtil.getInsertMacro_Query(insertMacro);
      if(query != null) {
        return reductionContext.getQueryExecutor().evaluateInsertQuery(context.getInput(), insertMacro, query, context);
      }

      generator.showErrorMessage(context.getInput(), insertMacro, "couldn't get nodes to insert");
      throw new GenerationFailureException();
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(context.getInput(), insertMacro, "couldn't get nodes to insert (see exception)");
      throw new GenerationFailureException(t);
    }
  }

  public static List<SNode> getNewInputNodes(SNode nodeMacro, SNode currentInputNode, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext, @NotNull ITemplateGenerator generator) throws GenerationFailureException {
    try {
      SNode nodesQuery = RuleUtil.getSourceNodesQuery(nodeMacro);
      if (nodesQuery != null) {
        return getNewInputNodes(currentInputNode, nodeMacro, nodesQuery, context, reductionContext);
      }

      SNode nodeQuery = RuleUtil.getSourceNodeQuery(nodeMacro);
      if (nodeQuery != null) {
        SNode newInputNode = getNewInputNode(currentInputNode, nodeMacro, nodeQuery, context, reductionContext);
        return wrapAsList(newInputNode);
      }

      if (requiredSourceNodesQuery.contains(nodeMacro.getConceptFqName())) {
        generator.showErrorMessage(currentInputNode, nodeMacro, "couldn't get input nodes");
        throw new GenerationFailureException();
      }

      // <default> : propagate  current input node
      return Collections.singletonList(currentInputNode);

    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(currentInputNode, nodeMacro, "couldn't get input nodes (see exception)");
      throw new GenerationFailureException(t);
    }
  }

  private static <T> List<T> wrapAsList(T node) {
    return node == null ? Collections.<T>emptyList() : Collections.singletonList(node);
  }

  /*
   * only applicable to macros, which can yield 1 new output node
   */
  public static SNode getNewInputNode(SNode nodeMacro, SNode currentInputNode, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext, @NotNull ITemplateGenerator generator) throws GenerationFailureException {
    try {
      SNode query = RuleUtil.getSourceNodeQuery(nodeMacro);
      if (query != null) {
        return getNewInputNode(currentInputNode, nodeMacro, query, context, reductionContext);
      }

      // <default> : propagate  current input node
      return currentInputNode;
    } catch (Throwable t) {
      generator.getLogger().handleException(t);
      generator.showErrorMessage(currentInputNode, nodeMacro, "couldn't get new input node");
      throw new GenerationFailureException(t);
    }
  }

  private static SNode getNewInputNode(SNode currentInputNode, SNode macro, @NotNull SNode query, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) throws GenerationFailureException {
    return reductionContext.getQueryExecutor().evaluateSourceNodeQuery(currentInputNode, macro, query, context);
  }

  private static List<SNode> getNewInputNodes(SNode currentInputNode, SNode macro, @NotNull SNode query, @NotNull TemplateContext context, @NotNull ReductionContext reductionContext) throws GenerationFailureException {
    List<SNode> list = reductionContext.getQueryExecutor().evaluateSourceNodesQuery(currentInputNode, null, macro, query, context);
    return list != null ? list : Collections.<SNode>emptyList();
  }
}
