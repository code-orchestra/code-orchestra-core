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
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.AbstractTemplateGenerator.RoleValidationStatus;
import jetbrains.mps.generator.impl.interpreted.TemplateWeavingRuleInterpreted;
import jetbrains.mps.generator.impl.reference.*;
import jetbrains.mps.generator.impl.template.InputQueryUtil;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Applies template to input node.
 */
public class TemplateProcessor {
  private final TemplateGenerator myGenerator;
  private final ReductionContext myReductionContext;
  private final SModel myOutputModel;

  public TemplateProcessor(@NotNull TemplateGenerator generator, @NotNull ReductionContext reductionContext) {
    myGenerator = generator;
    myReductionContext = reductionContext;
    myOutputModel = myGenerator.getOutputModel();
  }

  @NotNull
  public List<SNode> processTemplateNode(String mappingName, SNode templateNode, @NotNull TemplateContext context)
    throws DismissTopMappingRuleException, TemplateProcessingFailureException, GenerationFailureException, GenerationCanceledException {
    IGeneratorLogger logger = myGenerator.getLogger();

    if (myGenerator.getProgressMonitor().isCanceled()) {
      if (myGenerator.getGenerationTracer().isTracing() && logger.needsInfo()) {
        logger.info("generation canceled when processing branch:");
        GeneratorUtil.logCurrentGenerationBranch(logger, myGenerator.getGenerationTracer(), false);
      }
      throw new GenerationCanceledException();
    }

    try {
      List<SNode> outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, context.subContext(mappingName), 0);
      if (outputNodes == null) {
        throw new TemplateProcessingFailureException();
      }
      return outputNodes;
    } catch (StackOverflowError e) {
      // this is critical
      logger.error("generation thread run out of stack space :(");
      if (myGenerator.getGenerationTracer().isTracing()) {
        logger.error("failed branch was:");
        GeneratorUtil.logCurrentGenerationBranch(logger, myGenerator.getGenerationTracer(), true);
      } else {
        logger.error("try to increase JVM stack size (-Xss option)");
        logger.error("to get more diagnostic generate model with the 'save transient models' option");
      }
      myGenerator.showErrorMessage(context.getInput(), templateNode, "couldn't process template");
      throw new GenerationFailureException(e);
    }
  }

  @Nullable
  private List<SNode> createOutputNodesForTemplateNode(String mappingName,
                                                       SNode templateNode,
                                                       @NotNull TemplateContext context,
                                                       int nodeMacrosToSkip)
    throws DismissTopMappingRuleException, GenerationFailureException, GenerationCanceledException {

    IGenerationTracer generationTracer = myGenerator.getGenerationTracer();
    assert mappingName == null || mappingName.equals(context.getInputName());

    int macroCount = 0;
    // templateNode has unprocessed node-macros?
    for (SNode templateChildNode : templateNode.getChildren()) {
      if (!(templateChildNode.isInstanceOfConcept(RuleUtil.concept_NodeMacro))) continue;
      macroCount++;
      if (macroCount <= nodeMacrosToSkip) continue;
      generationTracer.pushMacro(new SNodePointer(templateChildNode));
      try {
        return createOutputNodesForTemplateNodeWithMacro(templateChildNode, templateNode, context, nodeMacrosToSkip, mappingName);
      } finally {
        generationTracer.closeMacro(new SNodePointer(templateChildNode));
      }
    }

    // templateNode has no unprocessed node-macros - create output instance for the tempate node
    generationTracer.pushTemplateNode(new SNodePointer(templateNode));
    SNode outputNode = new SNode(myOutputModel, templateNode.getConceptFqName(), false);
    GeneratorMappings mappings = myGenerator.getMappings();
    mappings.addOutputNodeByInputAndTemplateNode(context.getInput(), templateNode, outputNode);
    for (SNode historyInputNode : context.getInputHistory()) {
      mappings.addOutputNodeByIndirectInputAndTemplateNode(historyInputNode, templateNode, outputNode);
    }
    mappings.addOutputNodeByInputNodeAndMappingName(context.getInput(), mappingName, outputNode);
    mappings.addOutputNodeByTemplateNode(templateNode, outputNode);
    outputNode.putProperties(templateNode);

    SModel templateModel = templateNode.getModel();
    for (SReference reference : templateNode.getReferencesIterable()) {
      if (AttributeOperations.getLinkAttribute(templateNode, "referenceMacro", reference.getRole()) != null) {
        continue;
      }
      SNode templateReferentNode = reference.getTargetNode();
      if (templateReferentNode == null) {
        myGenerator.getLogger().error(templateNode, "cannot resolve reference in template model; role: " + reference.getRole() + " in " + templateNode.getDebugText());
        continue;
      }
      if (templateReferentNode.getModel() == templateModel) { // internal reference
        ReferenceInfo_TemplateNode refInfo = new ReferenceInfo_TemplateNode(
          outputNode,
          reference,
          context);
        PostponedReference postponedReference = new PostponedReference(
          refInfo,
          myGenerator
        );
        outputNode.addReference(postponedReference);
      } else {
        outputNode.setReferent(reference.getRole(), templateReferentNode);
      }
    }

    // process property and reference macros
    List<SNode> templateChildNodes = new ArrayList<SNode>();
    for (SNode templateChildNode : templateNode.getChildren()) {
      String templateChildNodeConcept = templateChildNode.getConceptFqName();

      if (templateChildNodeConcept.equals(RuleUtil.concept_PropertyMacro)) {
        myReductionContext.getQueryExecutor().expandPropertyMacro(templateChildNode, context.getInput(), templateNode, outputNode, context);
      } else if (templateChildNodeConcept.equals(RuleUtil.concept_ReferenceMacro)) {
        ReferenceInfo_Macro refInfo = new ReferenceInfo_MacroNode(
          outputNode, templateChildNode,
          templateNode,
          context, myReductionContext
        );
        PostponedReference postponedReference = new PostponedReference(
          refInfo,
          myGenerator
        );
        outputNode.addReference(postponedReference);
      } else if (!GeneratorUtilEx.isTemplateLanguageElement(templateChildNode)) {
        templateChildNodes.add(templateChildNode);
      }
    }

    // process children
    try {
      for (SNode templateChildNode : templateChildNodes) {
        List<SNode> outputChildNodes = createOutputNodesForTemplateNode(null, templateChildNode, context, 0);
        if (outputChildNodes != null) {
          String role = templateChildNode.getRole_();
          for (SNode outputChildNode : outputChildNodes) {
            // check child
            RoleValidationStatus status = myGenerator.validateChild(outputNode, role, outputChildNode);
            if (status != null) {
              status.reportProblem(false, "",
                GeneratorUtil.describe(context.getInput(), "input"),
                GeneratorUtil.describe(templateNode, "parent in template"),
                GeneratorUtil.describe(templateChildNode, "child in template"));
            }
            outputNode.addChild(role, outputChildNode);
          }
        }
      }
    } finally {
      generationTracer.pushOutputNode(outputNode);
      generationTracer.closeTemplateNode(new SNodePointer(templateNode));
    }
    return Collections.singletonList(outputNode);
  }

  @Nullable
  private List<SNode> createOutputNodesForTemplateNodeWithMacro(SNode macro, SNode templateNode, @NotNull TemplateContext templateContext, int nodeMacrosToSkip, String outerMappingName) throws DismissTopMappingRuleException, GenerationFailureException, GenerationCanceledException {
    String macroConceptFQName = macro.getConceptFqName();
    IGenerationTracer generationTracer = myGenerator.getGenerationTracer();
    List<SNode> outputNodes = new ArrayList<SNode>();
    String mappingName = GeneratorUtilEx.getMappingName(macro, outerMappingName);

    if (macroConceptFQName.equals(RuleUtil.concept_LoopMacro)) {
      // $LOOP$
      List<SNode> newInputNodes = getNewInputNodes(macro, templateContext);
      for (SNode newInputNode : newInputNodes) {
        boolean inputChanged = (newInputNode != templateContext.getInput());
        if (inputChanged) {
          generationTracer.pushInputNode(newInputNode);
        }
        try {
          List<SNode> _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName, newInputNode), nodeMacrosToSkip + 1);
          if (_outputNodes != null) outputNodes.addAll(_outputNodes);
        } finally {
          if (inputChanged) {
            generationTracer.closeInputNode(newInputNode);
          }
        }
      }
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_CopySrcNodeMacro) || macroConceptFQName.equals(RuleUtil.concept_CopySrcListMacro)) {
      // $COPY-SRC$ / $COPY-SRCL$
      List<SNode> newInputNodes = getNewInputNodes(macro, templateContext);
      SNodePointer templateNodeRef = templateNode == null ? null : new SNodePointer(templateNode);
      for (SNode newInputNode : newInputNodes) {
        Collection<SNode> _outputNodes =
          newInputNode.getModel() == myGenerator.getInputModel() && newInputNode.isRegistered()
            ? myGenerator.copyNodeFromInputNode(mappingName, templateNodeRef, null, newInputNode, myReductionContext, new boolean[]{false})
            : myGenerator.copyNodeFromExternalNode(mappingName, templateNodeRef, null, newInputNode, myReductionContext);
        if (_outputNodes != null) {
          // check node languages : prevent 'input node' query from returning node, which language was not counted when
          // planning the generation steps.
          for (SNode outputNode : _outputNodes) {
            Language outputNodeLang = outputNode.getNodeLanguage();
            if (!myGenerator.getGeneratorSessionContext().getGenerationPlan().isCountedLanguage(outputNodeLang)) {
              if (!outputNodeLang.getGenerators().isEmpty()) {
                myGenerator.getLogger().error(outputNode, "language of output node is '" + outputNodeLang.getModuleFqName() + "' - this language did not show up when computing generation steps!",
                  GeneratorUtil.describe(macro, "template"),
                  GeneratorUtil.describe(templateContext.getInput(), "input"),
                  new ProblemDescription(null, "workaround: add the language '" + outputNodeLang.getModuleFqName() + "' to list of 'Languages Engaged On Generation' in model '" + myGenerator.getGeneratorSessionContext().getOriginalInputModel().getSModelFqName() + "'"));
              }
            }
          }
          outputNodes.addAll(_outputNodes);
        }
      }
      return outputNodes;
    } else if (macroConceptFQName.equals(RuleUtil.concept_InsertMacro)) {
      // $INSERT$
      SNode child = InputQueryUtil.getNodeToInsert(macro, templateContext.subContext(mappingName), myReductionContext, myGenerator);
      if (child != null) {
        // check node languages : prevent 'insert' query from returnning node, which language was not counted when
        // planning the generation steps.
        Language childLang = child.getNodeLanguage();
        if (!myGenerator.getGeneratorSessionContext().getGenerationPlan().isCountedLanguage(childLang)) {
          if (!childLang.getGenerators().isEmpty()) {
            myGenerator.getLogger().error(child, "language of output node is '" + childLang.getModuleFqName() + "' - this language did not show up when computing generation steps!",
              GeneratorUtil.describe(macro, "template"),
              GeneratorUtil.describe(templateContext.getInput(), "input"),
              new ProblemDescription(null, "workaround: add the language '" + childLang.getModuleFqName() + "' to list of 'Languages Engaged On Generation' in model '" + myGenerator.getGeneratorSessionContext().getOriginalInputModel().getSModelFqName() + "'"));
          }
        }

        if (child.isRegistered()) {
          // must be "in air"
          child = CopyUtil.copy(child);
        }
        // replace references back to input model
        validateReferences(child, templateContext.getInput());

        // label
        myGenerator.getMappings().addOutputNodeByInputNodeAndMappingName(templateContext.getInput(), mappingName, child);
        outputNodes.add(child);
      }
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_WeaveMacro)) {
      // $WEAVE$
      List<SNode> _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName), nodeMacrosToSkip + 1);
      if (_outputNodes != null && _outputNodes.size() > 0) {

        if(_outputNodes.size() == 1) {
          SNode contextNode = _outputNodes.get(0);

          List<SNode> nodesToWeave = getNewInputNodes(macro, templateContext);
          for(SNode node : nodesToWeave) {
            try {
              generationTracer.pushInputNode(node);
              generationTracer.pushRuleConsequence(new SNodePointer(macro));
              SNode consequence = RuleUtil.getWeaveMacro_Consequence(macro);
              if (consequence == null) {
                myGenerator.showErrorMessage(templateContext.getInput(), macro, "couldn't evaluate weave macro: no consequence");
                break;
              }

              SNode template = RuleUtil.getTemplateDeclarationReference_Template(consequence);
              weaveMacro(template, contextNode, templateContext.subContext(null, node), macro);
            } finally {
              generationTracer.closeInputNode(node);
            }
          }
        } else {
          myGenerator.getLogger().error(templateContext.getInput(), "cannot apply $WEAVE$ to a list of nodes",
            GeneratorUtil.describe(macro, "template"),
            GeneratorUtil.describe(templateContext.getInput(), "input"));
        }


        outputNodes.addAll(_outputNodes);
      }
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_LabelMacro)) {
      // $LABEL$
      List<SNode> _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName), nodeMacrosToSkip + 1);
      if (_outputNodes != null) outputNodes.addAll(_outputNodes);
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_IfMacro)) {
      // $IF$
      List<SNode> _outputNodes = null;
      if (myReductionContext.getQueryExecutor().checkConditionForIfMacro(templateContext.getInput(), macro, templateContext)) {
        _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName), nodeMacrosToSkip + 1);
      } else {
        // alternative consequence
        SNode altConsequence = RuleUtil.getIfMacro_AlternativeConsequence(macro);
        if (altConsequence != null) {
          try {
            List<Pair<SNode, String>> nodeAndMappingNamePairs = GeneratorUtilEx.getTemplateNodesFromRuleConsequence(altConsequence, templateContext.getInput(), macro, myReductionContext, myGenerator);
            if (nodeAndMappingNamePairs == null) {
              myGenerator.showErrorMessage(templateContext.getInput(), null, macro, "error processing $IF$/alternative");
              return null;
            }

            for (Pair<SNode, String> nodeAndMappingNamePair : nodeAndMappingNamePairs) {
              SNode altTemplateNode = nodeAndMappingNamePair.o1;
              String innerMappingName = nodeAndMappingNamePair.o2 != null ? nodeAndMappingNamePair.o2 : mappingName;
              List<SNode> __outputNodes = createOutputNodesForExternalTemplateNode(innerMappingName, altTemplateNode, templateContext.subContext(innerMappingName));
              if (__outputNodes != null) {
                if (_outputNodes == null) _outputNodes = new ArrayList<SNode>();
                _outputNodes.addAll(__outputNodes);
              }
            }
          } catch (AbandonRuleInputException e) {
            // it's ok. just ignore
          }
        }
      }
      if (_outputNodes != null) outputNodes.addAll(_outputNodes);
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_MapSrcNodeMacro) || macroConceptFQName.equals(RuleUtil.concept_MapSrcListMacro)) {
      // $MAP-SRC$ or $MAP-SRCL$
      SNode macro_mapperFunction = RuleUtil.getMapSrc_MapperFunction(macro);
      List<SNode> newInputNodes = getNewInputNodes(macro, templateContext);
      for (SNode newInputNode : newInputNodes) {
        boolean inputChanged = (newInputNode != templateContext.getInput());
        if (inputChanged) {
          generationTracer.pushInputNode(newInputNode);
        }
        try {
          TemplateContext newcontext = templateContext.subContext(mappingName, newInputNode);
          if (macro_mapperFunction != null) {
            SNode childToReplaceLater = SModelUtil_new.instantiateConceptDeclaration(templateNode.getConceptFqName(), myOutputModel, myGenerator.getScope(), false);
            generationTracer.pushOutputNodeToReplaceLater(childToReplaceLater);
            outputNodes.add(childToReplaceLater);
            // execute the 'mapper' function later
            myGenerator.getDelayedChanges().addExecuteMapSrcNodeMacroChange(
              macro, childToReplaceLater, newcontext, myReductionContext);
          } else {
            List<SNode> _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, newcontext, nodeMacrosToSkip + 1);
            if (_outputNodes != null) {
              outputNodes.addAll(_outputNodes);
              // do post-processing here (it's not really a post-processing because model is not completed yet - output nodes are not added to parent node).
              for (SNode outputNode : _outputNodes) {
                myGenerator.getDelayedChanges().addExecuteMapSrcNodeMacroPostProcChange(
                  macro, outputNode, newcontext, myReductionContext);
              }
            }
          }
        } finally {
          if (inputChanged) {
            generationTracer.closeInputNode(newInputNode);
          }
        }
      }
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_SwitchMacro)) {
      // $SWITCH$
      SNode templateSwitch = RuleUtil.getSwitchMacro_TemplateSwitch(macro);
      if (templateSwitch == null) {
        myGenerator.showErrorMessage(templateContext.getInput(), macro, "error processing $SWITCH$ - bad TemplateSwitch reference");
        return null;
      }

      final SNodePointer switchPtr = new SNodePointer(templateSwitch);
      SNode newInputNode = getNewInputNode(macro, templateContext);
      if (newInputNode == null) {
        TemplateSwitchMapping tswitch = myGenerator.getSwitch(switchPtr);
        if (tswitch != null) {
          tswitch.processNull(new TemplateExecutionEnvironmentImpl(myGenerator, myReductionContext, myGenerator.getOperationContext(), myGenerator.getGenerationTracer()), switchPtr, templateContext);
        }
        return Collections.emptyList(); // skip template
      }

      boolean inputChanged = (newInputNode != templateContext.getInput());
      if (inputChanged) {
        generationTracer.pushInputNode(newInputNode);
      }
      generationTracer.pushSwitch(new SNodePointer(templateSwitch));
      try {
        final TemplateContext switchContext = templateContext.subContext(mappingName, newInputNode);

        Collection<SNode> collection = myGenerator.tryToReduce(switchContext, switchPtr, mappingName, myReductionContext);
        if (collection == null) {
          // try the default case
          TemplateSwitchMapping tswitch = myGenerator.getSwitch(switchPtr);
          if (tswitch != null) {
            TemplateExecutionEnvironment environment = new TemplateExecutionEnvironmentImpl(myGenerator, myReductionContext, myGenerator.getOperationContext(), myGenerator.getGenerationTracer());
            try {
              collection = tswitch.applyDefault(environment, switchPtr, mappingName, switchContext);
            } catch (GenerationException e) {
              if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
              if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
              if (e instanceof DismissTopMappingRuleException) throw (DismissTopMappingRuleException) e;
              myGenerator.showErrorMessage(null, tswitch.getSwitchNode().getNode(), "internal error in switch.applyDefault: " + e.toString());
            }
          }

          // no switch-case found for the inputNode - continue with templateNode under the $switch$
          if (collection == null) {
            collection = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName, newInputNode), nodeMacrosToSkip + 1);
          }
        }

        if (collection != null) {
          outputNodes.addAll(collection);
        }

      } finally {
        if (inputChanged) {
          generationTracer.closeInputNode(newInputNode);
        }
      }
      return outputNodes;

    } else if (macroConceptFQName.equals(RuleUtil.concept_IncludeMacro)) {
      // $INCLUDE$
      SNode newInputNode = getNewInputNode(macro, templateContext);
      if (newInputNode == null) {
        return outputNodes; // skip template
      }

      SNode includeTemplate = RuleUtil.getIncludeMacro_Template(macro);
      if (includeTemplate == null) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $INCLUDE$ : no 'include template'");
        return null;
      }

      final String[] parameterNames = RuleUtil.getTemplateDeclarationParameterNames(includeTemplate);
      if (parameterNames == null) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $INCLUDE$: target template is broken");
        return null;
      }

      for (String name : parameterNames) {
        if (!templateContext.hasVariable(name)) {
          myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $INCLUDE$: parameter `" + name + "' is missing");
        }
      }
/*
      TemplateFragment fragment = GeneratorUtil.getFragmentFromTemplate(includeTemplate, newInputNode, macro, myGenerator);
      if (fragment == null) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $INCLUDE$");
        return null;
      }
*/
      List<SNode> fragments = GeneratorUtilEx.getTemplateFragments(includeTemplate);
      if (!GeneratorUtilEx.checkIfOneOrMaryAdjacentFragments(fragments, includeTemplate, newInputNode, macro, myGenerator)) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $INCLUDE$");
        return null;
      }

      boolean inputChanged = (newInputNode != templateContext.getInput());
      if (inputChanged) {
        generationTracer.pushInputNode(newInputNode);
      }
      generationTracer.pushTemplateNode(new SNodePointer(includeTemplate));

      try {
        for (SNode fragment : fragments) {
          SNode templateForInclude = fragment.getParent();
          mappingName = GeneratorUtilEx.getMappingName(fragment, mappingName);
          List<SNode> _outputNodes = createOutputNodesForExternalTemplateNode(mappingName, templateForInclude, templateContext.subContext(mappingName, newInputNode));
          if (_outputNodes != null) outputNodes.addAll(_outputNodes);
        }
      } finally {
        if (inputChanged) {
          generationTracer.closeInputNode(newInputNode);
        }
      }

      return outputNodes;
    } else if (macroConceptFQName.equals(RuleUtil.concept_TemplateCallMacro)) {
      // $CALL$
      SNode newInputNode = getNewInputNode(macro, templateContext);
      if (newInputNode == null) {
        return outputNodes; // skip template
      }

      SNode template = RuleUtil.getCallMacro_Template(macro);
      if (template == null) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $CALL$ : no 'include template'");
        return null;
      }

      TemplateContext newcontext = GeneratorUtil.createTemplateCallContext(templateContext.getInput(), templateContext, myReductionContext, macro, newInputNode, myGenerator);

/*
      TemplateFragment fragment = GeneratorUtil.getFragmentFromTemplate(template, newInputNode, macro, myGenerator);
      if (fragment == null) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $CALL$");
        return null;
      }
*/
      List<SNode> fragments = GeneratorUtilEx.getTemplateFragments(template);
      if (!GeneratorUtilEx.checkIfOneOrMaryAdjacentFragments(fragments, template, newInputNode, macro, myGenerator)) {
        myGenerator.showErrorMessage(newInputNode, null, macro, "error processing $CALL$");
        return null;
      }

      boolean inputChanged = (newInputNode != templateContext.getInput());
      if (inputChanged) {
        generationTracer.pushInputNode(newInputNode);
      }
      generationTracer.pushTemplateNode(new SNodePointer(template));

      try {
        for (SNode fragment : fragments) {
          SNode templateForInclude = fragment.getParent();
          mappingName = GeneratorUtilEx.getMappingName(fragment, mappingName);
          List<SNode> _outputNodes = createOutputNodesForExternalTemplateNode(mappingName, templateForInclude, newcontext.subContext(mappingName));
          if (_outputNodes != null) outputNodes.addAll(_outputNodes);
        }
      } finally {
        if (inputChanged) {
          generationTracer.closeInputNode(newInputNode);
        }
      }

      return outputNodes;
    } else {

      // $$
      List<SNode> newInputNodes = getNewInputNodes(macro, templateContext);
      for (SNode newInputNode : newInputNodes) {
        boolean inputChanged = (newInputNode != templateContext.getInput());
        if (inputChanged) {
          generationTracer.pushInputNode(newInputNode);
        }
        try {
          List<SNode> _outputNodes = createOutputNodesForTemplateNode(mappingName, templateNode, templateContext.subContext(mappingName, newInputNode), nodeMacrosToSkip + 1);
          if (_outputNodes != null) outputNodes.addAll(_outputNodes);
        } finally {
          if (inputChanged) {
            generationTracer.closeInputNode(newInputNode);
          }
        }
      }
      return outputNodes;
    }
  }

  private void validateReferences(SNode node, SNode inputNode) {
    for (SReference reference : node.getReferencesArray()) {
      // reference to input model - illegal
      if (myGenerator.getInputModel().getSModelReference().equals(reference.getTargetSModelReference())) {
        // replace
        ReferenceInfo_CopiedInputNode refInfo = new ReferenceInfo_CopiedInputNode(
          reference.getRole(),
          reference.getSourceNode(),
          inputNode,
          reference.getTargetNode());
        PostponedReference postponedReference = new PostponedReference(
          refInfo,
          myGenerator);
        reference.getSourceNode().replaceReference(reference, postponedReference);
      }
    }
    for (SNode child : node.getChildren()) {
      validateReferences(child, inputNode);
    }
  }

  private SNode getNewInputNode(SNode nodeMacro, @NotNull TemplateContext context) throws GenerationFailureException {
    return InputQueryUtil.getNewInputNode(nodeMacro, context.getInput(), context, myReductionContext, myGenerator);
  }

  private List<SNode> getNewInputNodes(SNode nodeMacro, @NotNull TemplateContext context) throws GenerationFailureException {
    return InputQueryUtil.getNewInputNodes(nodeMacro, context.getInput(), context, myReductionContext, myGenerator);
  }

  @Nullable
  private List<SNode> createOutputNodesForExternalTemplateNode(String mappingName,
                                                               SNode templateNode,
                                                               TemplateContext context)
    throws
    DismissTopMappingRuleException,
    GenerationFailureException, GenerationCanceledException {
    TemplateProcessor templateProcessor = new TemplateProcessor(myGenerator, myReductionContext);
    return templateProcessor.createOutputNodesForTemplateNode(mappingName, templateNode, context, 0);
  }

  private void weaveMacro(SNode template, SNode outputContextNode, @NotNull TemplateContext context, SNode macro)
    throws GenerationFailureException, GenerationCanceledException {

    if (template == null) {
      myGenerator.showErrorMessage(context.getInput(), macro, "couldn't evaluate weave macro: no template");
      return;
    }

    List<SNode> templateFragments = GeneratorUtilEx.getTemplateFragments(template);
    if (templateFragments.isEmpty()) {
      myGenerator.showErrorMessage(context.getInput(), template, macro, "nothing to weave: no template fragments found in template");
      return;
    }

    // check fragments: all fragments with <default context> should have the same parent
    TemplateWeavingRuleInterpreted.checkTemplateFragmentsForWeaving(template, templateFragments, myGenerator);

    // for each template fragment create output nodes
    TemplateProcessor templateProcessor = new TemplateProcessor(myGenerator, myReductionContext);
    for (SNode templateFragment : templateFragments) {
      SNode templateFragmentNode = templateFragment.getParent();
      SNode contextParentNode = null;
      try {
        contextParentNode = myReductionContext.getQueryExecutor().getContextNodeForTemplateFragment(templateFragmentNode, outputContextNode, context);
      } catch (Exception e) {
        myGenerator.getLogger().handleException(e);
      }
      if (contextParentNode != null) {
        try {
          List<SNode> outputNodesToWeave = templateProcessor.processTemplateNode(
            GeneratorUtilEx.getMappingName(templateFragment, null),
            templateFragmentNode, context);
          String childRole = templateFragmentNode.getRole_();

          TemplateExecutionEnvironment env = new TemplateExecutionEnvironmentImpl(myGenerator, myReductionContext, null, myGenerator.getGenerationTracer());
          for (SNode outputNodeToWeave : outputNodesToWeave) {
            env.weaveNode(contextParentNode, childRole, outputNodeToWeave, new SNodePointer(templateFragment), context.getInput());
          }
        } catch (DismissTopMappingRuleException e) {
          myGenerator.showErrorMessage(context.getInput(), templateFragment, macro, "wrong template: dismission in weave macro is not supported");
        } catch (TemplateProcessingFailureException e) {
          // FIXME
          myGenerator.showErrorMessage(context.getInput(), templateFragment, macro, "error processing template fragment");
          myGenerator.getLogger().info(contextParentNode, " -- was output context node:");
        }
      } else {
        myGenerator.showErrorMessage(context.getInput(), templateFragment, macro, "couldn't define 'context' for template fragment");
      }
    }
  }

  public static class TemplateProcessingFailureException extends GenerationException {
  }
}
