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
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.AbstractTemplateGenerator.RoleValidationStatus;
import jetbrains.mps.generator.impl.reference.*;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/**
 * Evgeny Gryaznov, 11/10/10
 */
public class TemplateExecutionEnvironmentImpl implements TemplateExecutionEnvironment {
  private final TemplateGenerator generator;
  private final ReductionContext reductionContext;
  private final IOperationContext operationContext;
  private final IGenerationTracer tracer;

  public TemplateExecutionEnvironmentImpl(@NotNull TemplateGenerator generator, @NotNull ReductionContext reductionContext, IOperationContext operationContext, @NotNull IGenerationTracer tracer) {
    this.generator = generator;
    this.reductionContext = reductionContext;
    this.operationContext = operationContext;
    this.tracer = tracer;
  }

  public IOperationContext getOperationContext() {
    return operationContext;
  }

  public SModel getOutputModel() {
    return generator.getOutputModel();
  }

  @NotNull
  public TemplateGenerator getGenerator() {
    return generator;
  }

  public IGenerationTracer getTracer() {
    return tracer;
  }

  @NotNull
  public ReductionContext getReductionContext() {
    return reductionContext;
  }

  @Override
  public TemplateExecutionEnvironment getEnvironment(SNode inputNode, TemplateReductionRule rule) {
    return new TemplateExecutionEnvironmentImpl(generator, new ReductionContext(reductionContext, inputNode, rule), operationContext, tracer);
  }

  public Collection<SNode> copyNodes(Iterable<SNode> inputNodes, SNodePointer templateNode, String templateId, String mappingName, TemplateContext templateContext) throws GenerationCanceledException, GenerationFailureException {
    Collection<SNode> outputNodes = null;
    for (SNode newInputNode : inputNodes) {
      Collection<SNode> _outputNodes =
        newInputNode.getModel() == generator.getInputModel() && newInputNode.isRegistered()
          ? generator.copyNodeFromInputNode(mappingName, templateNode, templateId, newInputNode, reductionContext, new boolean[]{false})
          : generator.copyNodeFromExternalNode(mappingName, templateNode, templateId, newInputNode, reductionContext);
      if (_outputNodes != null) {
        // check node languages : prevent 'input node' query from returning node, which language was not counted when
        // planning the generation steps.
        for (SNode outputNode : _outputNodes) {
          Language outputNodeLang = outputNode.getNodeLanguage();
          if (!generator.getGeneratorSessionContext().getGenerationPlan().isCountedLanguage(outputNodeLang)) {
            if (!outputNodeLang.getGenerators().isEmpty()) {
              SNode tNode = templateNode.getNode();
              generator.getLogger().error(outputNode, "language of output node is '" + outputNodeLang.getModuleFqName() + "' - this language did not show up when computing generation steps!",
                GeneratorUtil.describe(tNode, "template"),
                GeneratorUtil.describe(templateContext.getInput(), "input"),
                new ProblemDescription(null, "workaround: add the language '" + outputNodeLang.getModuleFqName() + "' to list of 'Languages Engaged On Generation' in model '" + generator.getGeneratorSessionContext().getOriginalInputModel().getSModelFqName() + "'"));
            }
          }
        }
        if (outputNodes == null) {
          outputNodes = Collections.unmodifiableCollection(_outputNodes);
        } else if (!(outputNodes instanceof ArrayList)) {
          Collection<SNode> old = outputNodes;
          outputNodes = new ArrayList<SNode>(old.size() + _outputNodes.size() + 16);
          outputNodes.addAll(old);
          outputNodes.addAll(_outputNodes);
        } else {
          outputNodes.addAll(_outputNodes);
        }
      }
    }
    return outputNodes == null ? Collections.<SNode>emptyList() : outputNodes;
  }

  @Override
  public SNode insertNode(SNode child, SNodePointer templateNode, TemplateContext templateContext) throws GenerationCanceledException, GenerationFailureException {
    // check node languages : prevent 'mapping func' query from returnning node, which language was not counted when
    // planning the generation steps.
    Language childLang = child.getNodeLanguage();
    if (!generator.getGeneratorSessionContext().getGenerationPlan().isCountedLanguage(childLang)) {
      if (!childLang.getGenerators().isEmpty()) {
        SNode tNode = templateNode.getNode();
        generator.getLogger().error(child, "language of output node is '" + childLang.getModuleFqName() + "' - this language did not show up when computing generation steps!",
          GeneratorUtil.describe(tNode, "template"),
          GeneratorUtil.describe(templateContext.getInput(), "input"),
          new ProblemDescription(null, "workaround: add the language '" + childLang.getModuleFqName() + "' to list of 'Languages Engaged On Generation' in model '" + generator.getGeneratorSessionContext().getOriginalInputModel().getSModelFqName() + "'"));
      }
    }

    if (child.isRegistered()) {
      // must be "in air"
      child = CopyUtil.copy(child);
    }
    // replace references back to input model
    validateReferences(child, templateContext.getInput());
    return child;
  }

  private void validateReferences(SNode node, SNode inputNode) {
    for (SReference reference : node.getReferencesArray()) {
      // reference to input model - illegal
      if (generator.getInputModel().getSModelReference().equals(reference.getTargetSModelReference())) {
        // replace
        ReferenceInfo_CopiedInputNode refInfo = new ReferenceInfo_CopiedInputNode(
          reference.getRole(),
          reference.getSourceNode(),
          inputNode,
          reference.getTargetNode());
        PostponedReference postponedReference = new PostponedReference(
          refInfo,
          generator);
        reference.getSourceNode().replaceReference(reference, postponedReference);
      }
    }
    for (SNode child : node.getChildren()) {
      validateReferences(child, inputNode);
    }
  }

  public Collection<SNode> trySwitch(SNodePointer switch_, String mappingName, TemplateContext context) throws GenerationException {
    Collection<SNode> collection = generator.tryToReduce(context, switch_, mappingName, reductionContext);
    if (collection != null) {
      return collection;
    }

    // try the default case
    TemplateSwitchMapping current = generator.getSwitch(switch_);
    if (current != null) {
      collection = current.applyDefault(this, switch_, mappingName, context);
      if (collection != null) {
        return collection;
      }
    }

    // no switch-case found for the inputNode - continue with templateNode under the $switch$
    return null;
  }

  @Override
  public Collection<SNode> applyTemplate(@NotNull SNodePointer templateDeclaration, @NotNull SNodePointer templateNode, @NotNull TemplateContext context, Object... arguments) throws GenerationException {
    TemplateModel templateModel = generator.getRuleManager().getTemplateModel(templateDeclaration.getModelReference());
    if (templateModel == null) {
      generator.getLogger().error(templateNode.getNode(), "template model not found: cannot apply template declaration, try to check & regenerate affected generators",
        GeneratorUtil.describeIfExists(context.getInput(), "input"),
        GeneratorUtil.describeIfExists(templateNode.getNode(), "template"),
        GeneratorUtil.describeIfExists(templateDeclaration.getNode(), "template declaration"));
      return Collections.emptyList();
    }

    TemplateDeclaration templateDeclarationInstance = templateModel.loadTemplate(templateDeclaration, arguments);
    if (templateDeclarationInstance == null) {
      generator.getLogger().error(templateNode.getNode(), "declaration not found: cannot apply template declaration, try to check & regenerate affected generators",
        GeneratorUtil.describeIfExists(context.getInput(), "input"),
        GeneratorUtil.describeIfExists(templateNode.getNode(), "template"),
        GeneratorUtil.describeIfExists(templateDeclaration.getNode(), "template declaration"));
      return Collections.emptyList();
    }

    return templateDeclarationInstance.apply(this, context);
  }

  @Override
  public Collection<SNode> weaveTemplate(@NotNull SNodePointer templateDeclaration, @NotNull SNodePointer templateNode, @NotNull TemplateContext context, @NotNull SNode outputContextNode, Object... arguments) throws GenerationException {
    TemplateModel templateModel = generator.getRuleManager().getTemplateModel(templateDeclaration.getModelReference());
    if (templateModel == null) {
      generator.getLogger().error(templateNode.getNode(), "template model not found: cannot apply template declaration, try to check & regenerate affected generators",
        GeneratorUtil.describeIfExists(context.getInput(), "input"),
        GeneratorUtil.describeIfExists(templateNode.getNode(), "template"),
        GeneratorUtil.describeIfExists(templateDeclaration.getNode(), "template declaration"));
      return Collections.emptyList();
    }

    TemplateDeclaration templateDeclarationInstance = templateModel.loadTemplate(templateDeclaration, arguments);
    if (templateDeclarationInstance == null || !(templateDeclarationInstance instanceof TemplateDeclarationWeavingAware)) {
      generator.getLogger().error(templateNode.getNode(), "declaration not found: cannot apply template declaration, try to check & regenerate affected generators",
        GeneratorUtil.describeIfExists(context.getInput(), "input"),
        GeneratorUtil.describeIfExists(templateNode.getNode(), "template"),
        GeneratorUtil.describeIfExists(templateDeclaration.getNode(), "template declaration"));
      return Collections.emptyList();
    }

    return ((TemplateDeclarationWeavingAware) templateDeclarationInstance).weave(this, context, outputContextNode);
  }


  public void nodeCopied(TemplateContext context, SNode outputNode, String templateNodeId) {
    GeneratorMappings mappings = generator.getMappings();
    mappings.addOutputNodeByInputAndTemplateNode(context.getInput(), templateNodeId, outputNode);
    for (SNode historyInputNode : context.getInputHistory()) {
      mappings.addOutputNodeByIndirectInputAndTemplateNode(historyInputNode, templateNodeId, outputNode);
    }
    mappings.addOutputNodeByTemplateNode(templateNodeId, outputNode);
  }

  public void registerLabel(SNode inputNode, SNode outputNode, String mappingLabel) {
    generator.getMappings().addOutputNodeByInputNodeAndMappingName(inputNode, mappingLabel, outputNode);
  }

  public void registerLabel(SNode inputNode, Iterable<SNode> outputNodes, String mappingLabel) {
    for (SNode outputNode : outputNodes) {
      generator.getMappings().addOutputNodeByInputNodeAndMappingName(inputNode, mappingLabel, outputNode);
    }
  }

  public void resolveInTemplateLater(SNode outputNode, String role, SNodePointer sourceNode, int parentIndex, String resolveInfo, TemplateContext context) {
    ReferenceInfo_TemplateParent refInfo = new ReferenceInfo_TemplateParent(
      outputNode,
      role,
      sourceNode,
      parentIndex,
      resolveInfo,
      context);
    PostponedReference postponedReference = new PostponedReference(
      refInfo,
      generator
    );
    outputNode.addReference(postponedReference);
  }

  public void resolveInTemplateLater(SNode outputNode, String role, SNodePointer sourceNode, String templateNodeId, String resolveInfo, TemplateContext context) {
    ReferenceInfo_Template refInfo = new ReferenceInfo_Template(
      outputNode,
      role,
      sourceNode,
      templateNodeId,
      resolveInfo,
      context);
    PostponedReference postponedReference = new PostponedReference(
      refInfo,
      generator
    );
    outputNode.addReference(postponedReference);
  }

  public void resolve(ReferenceResolver resolver, SNode outputNode, String role, TemplateContext context) {
    ReferenceInfo_Macro refInfo = new ReferenceInfo_MacroResolver(
      resolver, outputNode,
      role, context,
      reductionContext);
    PostponedReference postponedReference = new PostponedReference(
      refInfo,
      generator
    );
    outputNode.addReference(postponedReference);
  }

  /*
  *  returns temporary node
  */
  public SNode insertLater(@NotNull NodeMapper mapper, PostProcessor postProcessor, TemplateContext context) {
    SNode childToReplaceLater = SModelUtil_new.instantiateConceptDeclaration(mapper.getConceptFqName(), generator.getOutputModel(), generator.getScope(), false);
    tracer.pushOutputNodeToReplaceLater(childToReplaceLater);
    generator.getDelayedChanges().addExecuteNodeMapper(mapper, postProcessor, childToReplaceLater, context, reductionContext);
    return childToReplaceLater;
  }

  public void postProcess(@NotNull PostProcessor processor, SNode outputNode, TemplateContext context) {
    generator.getDelayedChanges().addExecutePostProcessor(processor, outputNode, context, reductionContext);
  }

  @Override
  public void weaveNode(SNode contextParentNode, String childRole, SNode outputNodeToWeave, SNodePointer templateNode, SNode inputNode) {
    if (outputNodeToWeave == null) {
      return;
    }

    fillOriginalNode(inputNode, outputNodeToWeave);

    // check child
    RoleValidationStatus status = generator.validateChild(contextParentNode, childRole, outputNodeToWeave);
    if (status != null) {
      status.reportProblem(false, "",
        GeneratorUtil.describe(inputNode, "input"),
        GeneratorUtil.describe(templateNode.getNode(), "template"));
    }

    // add
    SNode/*LinkDeclaration*/ childLinkDeclaration = SModelSearchUtil.findLinkDeclaration(contextParentNode.getConceptDeclarationNode(), childRole);
    if (childLinkDeclaration == null) {
      // there should have been warning about that
      contextParentNode.addChild(childRole, outputNodeToWeave);
    } else {
      // if singular child then don't add more that 1 child
      if (SModelUtil.isMultipleLinkDeclaration(childLinkDeclaration)) {
        contextParentNode.addChild(childRole, outputNodeToWeave);
      } else {
        contextParentNode.setChild(childRole, outputNodeToWeave);
      }
    }
  }

  private void fillOriginalNode(SNode inputNode, SNode outputNode) {
    if (inputNode.getModel() == getGenerator().getGeneratorSessionContext().getOriginalInputModel()) {
      outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode);
    } else {
      Object userObject = inputNode.getUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE);
      if (userObject != null) {
        outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, userObject);
      }
    }
  }

}
