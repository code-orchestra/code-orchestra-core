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

import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.generator.*;
import jetbrains.mps.generator.IGeneratorLogger.ProblemDescription;
import jetbrains.mps.generator.impl.FastRuleFinder.BlockedReductionsData;
import jetbrains.mps.generator.impl.TemplateProcessor.TemplateProcessingFailureException;
import jetbrains.mps.generator.impl.dependencies.DependenciesBuilder;
import jetbrains.mps.generator.impl.dependencies.DependenciesReadListener;
import jetbrains.mps.generator.impl.dependencies.RootDependenciesBuilder;
import jetbrains.mps.generator.impl.reference.PostponedReference;
import jetbrains.mps.generator.impl.reference.ReferenceInfo_CopiedInputNode;
import jetbrains.mps.generator.impl.template.QueryExecutionContextWithDependencyRecording;
import jetbrains.mps.generator.impl.template.QueryExecutionContextWithTracing;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.generator.template.DefaultQueryExecutionContext;
import jetbrains.mps.generator.template.QueryExecutionContext;
import jetbrains.mps.generator.template.TemplateQueryContext;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.performance.IPerformanceTracer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by: Sergey Dmitriev
 * Date: Jan 23, 2007
 * <p/>
 * Created once per micro-step.
 */
public class TemplateGenerator extends AbstractTemplateGenerator {

  private boolean myChanged = false;
  private final RuleManager myRuleManager;
  private final DelayedChanges myDelayedChanges;
  private final Map<SNode, SNode> myNewToOldRoot = new HashMap<SNode, SNode>();
  private final Map<SNode, Object> myAdditionalInputNodes = new ConcurrentHashMap<SNode, Object>();
  protected final List<SNode> myOutputRoots;

  private final QueryExecutionContext myExecutionContext;
  private Map<DependenciesReadListener, QueryExecutionContext> myExecutionContextMap;

  private final boolean myIsStrict;
  private boolean myAreMappingsReady = false;

  /* cached session data */
  private BlockedReductionsData myReductionData;

  private final IGenerationTracer myGenerationTracer;
  private IPerformanceTracer ttrace;
  private DependenciesBuilder myDependenciesBuilder;

  public TemplateGenerator(GenerationSessionContext operationContext, ProgressIndicator progressMonitor,
                           IGeneratorLogger logger, RuleManager ruleManager,
                           SModel inputModel, SModel outputModel, GenerationOptions options,
                           DependenciesBuilder dependenciesBuilder, IPerformanceTracer performanceTracer) {

    super(operationContext, progressMonitor, logger, inputModel, outputModel, options.isShowBadChildWarning());
    myRuleManager = ruleManager;
    myGenerationTracer = getGeneratorSessionContext().getGenerationTracer();
    myIsStrict = options.isStrictMode();
    myDelayedChanges = new DelayedChanges(this);
    myDependenciesBuilder = dependenciesBuilder;
    ttrace = performanceTracer;
    myOutputRoots = new ArrayList<SNode>();
    myExecutionContext = options.getTracingMode() >= GenerationOptions.TRACE_LANGS
      ? new QueryExecutionContextWithTracing(new DefaultQueryExecutionContext(this), performanceTracer)
      : new DefaultQueryExecutionContext(this);

  }

  public boolean apply(boolean isPrimary) throws GenerationFailureException, GenerationCanceledException {
    checkMonitorCanceled();
    myAreMappingsReady = false;

    ttrace.push("reductions", false);
    applyReductions(isPrimary);
    ttrace.pop();

    myAreMappingsReady = true;
    myChanged |= myDependenciesBuilder.isStepRequired(); // TODO optimize: if step is required, it should be the last step

    // optimization: no changes? quit
    if (!isPrimary && !myChanged && myDelayedChanges.isEmpty() && !myRuleManager.hasWeavings()) {
      return false;
    }

    // publish roots
    for (SNode outputRoot : myOutputRoots) {
      myOutputModel.addRoot(outputRoot);
    }

    // reload "required" roots from cache
    ttrace.push("reloading roots from cache", false);
    myDependenciesBuilder.reloadRequired(myMappings);
    ttrace.pop();

    // weaving
    ttrace.push("weavings", false);
    applyWeaving_MappingRules();
    ttrace.pop();

    // optimization: no changes? quit
    if (!isPrimary && !myChanged && myDelayedChanges.isEmpty()) {
      return false;
    }

    // execute mapper in all $MAP_SRC$/$MAP_SRCL$
    ttrace.push("delayed mappings", false);
    myDelayedChanges.doAllChanges();
    ttrace.pop();

    if (myChanged || isPrimary) {
      // new unresolved references could appear after applying reduction rules (all delayed changes should be done before this, like replacing children)
      ttrace.push("restoring references", false);
      revalidateAllReferences();
      ttrace.pop();
      checkMonitorCanceled();

      // advance blocked reduction data
      getBlockedReductionsData().advanceStep();
    }
    return myChanged;
  }

  protected void applyReductions(boolean isPrimary) throws GenerationCanceledException, GenerationFailureException {
    // create all roots
    if (isPrimary) {
      ttrace.push("create root", false);

      final QueryExecutionContext executionContext = getExecutionContext(null);
      if (executionContext != null) {
        TemplateExecutionEnvironment environment = new TemplateExecutionEnvironmentImpl(this, new ReductionContext(executionContext), getOperationContext(), myGenerationTracer);
        for (TemplateCreateRootRule rule : myRuleManager.getCreateRootRules()) {
          checkMonitorCanceled();
          applyCreateRootRule(rule, environment);
        }
      }
      ttrace.pop();
    }

    // root mapping rules
    ttrace.push("root mappings", false);
    ArrayList<SNode> rootsToCopy = new ArrayList<SNode>();
    for (SNode root : myInputModel.roots()) {
      rootsToCopy.add(root);
    }
    for (TemplateRootMappingRule rule : myRuleManager.getRoot_MappingRules()) {
      checkMonitorCanceled();
      applyRootMappingRule(rule, rootsToCopy);
    }
    ttrace.pop();

    // copy roots
    checkMonitorCanceled();
    getGeneratorSessionContext().clearCopiedRootsSet();
    for (SNode rootToCopy : rootsToCopy) {
      QueryExecutionContext context = getExecutionContext(rootToCopy);
      if (context != null) {
        TemplateExecutionEnvironmentImpl rootenv = new TemplateExecutionEnvironmentImpl(this, new ReductionContext(context), getOperationContext(), myGenerationTracer);
        copyRootNodeFromInput(rootToCopy, rootenv);
      }
    }
  }

  private void applyCreateRootRule(TemplateCreateRootRule rule, TemplateExecutionEnvironment environment) throws GenerationFailureException, GenerationCanceledException {
    try {
      if (environment.getReductionContext().getQueryExecutor().isApplicable(rule, environment, null)) {
        myGenerationTracer.pushRule(rule.getRuleNode());
        try {
          createRootNodeByRule(rule, environment);
        } finally {
          myGenerationTracer.closeRule(rule.getRuleNode());
        }
      }
    } catch (GenerationException e) {
      if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
      if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
      showErrorMessage(null, rule.getRuleNode().getNode(), "internal error: " + e.toString());
    }
  }

  private void applyRootMappingRule(TemplateRootMappingRule rule, List<SNode> rootsToCopy) throws GenerationFailureException, GenerationCanceledException {
    String applicableConcept = rule.getApplicableConcept();
    if (applicableConcept == null) {
      showErrorMessage(null, null, rule.getRuleNode().getNode(), "rule has no applicable concept defined");
      return;
    }
    boolean includeInheritors = rule.applyToInheritors();
    Iterable<SNode> inputNodes = myInputModel.getFastNodeFinder().getNodes(applicableConcept, includeInheritors);
    for (SNode inputNode : inputNodes) {
      // do not apply root mapping if root node has been copied from input model on previous micro-step
      // because some roots can be already mapped and copied as well (if some rule has 'keep root' = true)
      if (getGeneratorSessionContext().isCopiedRoot(inputNode)) continue;

      final QueryExecutionContext executionContext = getExecutionContext(inputNode);
      if (executionContext != null) {
        TemplateExecutionEnvironment environment = new TemplateExecutionEnvironmentImpl(this, new ReductionContext(executionContext), getOperationContext(), myGenerationTracer);
        try {
          if (executionContext.isApplicable(rule, environment, new DefaultTemplateContext(inputNode))) {
            myGenerationTracer.pushInputNode(inputNode);
            myGenerationTracer.pushRule(rule.getRuleNode());
            try {
              boolean copyRootOnFailure = false;
              if (inputNode.isRoot() && !rule.keepSourceRoot()) {
                rootsToCopy.remove(inputNode);
                copyRootOnFailure = true;
              }
              createRootNodeByRule(rule, inputNode, copyRootOnFailure, environment);
            } finally {
              myGenerationTracer.closeInputNode(inputNode);
            }
          }
        } catch (GenerationException e) {
          if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
          if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
          showErrorMessage(null, rule.getRuleNode().getNode(), "internal error: " + e.toString());
        }
      }
    }
  }

  protected void createRootNodeByRule(TemplateCreateRootRule rule, TemplateExecutionEnvironment environment) throws GenerationCanceledException, GenerationFailureException {
    try {
      Collection<SNode> outputNodes = environment.getReductionContext().getQueryExecutor().applyRule(rule, environment);
      if (outputNodes == null) {
        return;
      }

      for (SNode outputNode : outputNodes) {
        registerRoot(outputNode, null, rule.getRuleNode(), false);
        setChanged();
      }
    } catch (DismissTopMappingRuleException ex) {
      // it's ok, just continue
    } catch (TemplateProcessingFailureException e) {
      showErrorMessage(null, rule.getRuleNode().getNode(), "couldn't create root node");
    } catch (GenerationException e) {
      if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
      if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
      showErrorMessage(null, rule.getRuleNode().getNode(), "internal error: " + e.toString());
    }
  }

  protected void createRootNodeByRule(TemplateRootMappingRule rule, SNode inputNode, boolean copyRootOnFailure, TemplateExecutionEnvironment environment)
    throws GenerationCanceledException, GenerationFailureException {
    try {
      Collection<SNode> outputNodes = environment.getReductionContext().getQueryExecutor().applyRule(rule, environment, new DefaultTemplateContext(inputNode));
      if (outputNodes == null) {
        return;
      }

      for (SNode outputNode : outputNodes) {
        registerRoot(outputNode, inputNode, rule.getRuleNode(), false);
        setChanged();
        outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode.getUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE));
      }

      if (inputNode.getModel() == getGeneratorSessionContext().getOriginalInputModel()) {
        for (SNode outputNode : outputNodes) {
          outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode);
        }
      }

    } catch (DismissTopMappingRuleException e) {
      // it's ok, just continue
      if (copyRootOnFailure && inputNode.isRoot()) {
        copyRootNodeFromInput(inputNode, environment);
      }
    } catch (TemplateProcessingFailureException e) {
      showErrorMessage(inputNode, rule.getRuleNode().getNode(), "couldn't create root node");
    } catch (GenerationException e) {
      if (e instanceof GenerationCanceledException) throw (GenerationCanceledException) e;
      if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
      showErrorMessage(inputNode, rule.getRuleNode().getNode(), "internal error: " + e.toString());
    }
  }

  protected void copyRootNodeFromInput(@NotNull SNode inputRootNode, @NotNull TemplateExecutionEnvironment environment) throws GenerationFailureException, GenerationCanceledException {
    // check if can drop
    for (TemplateDropRootRule dropRootRule : myRuleManager.getDropRootRules()) {
      if (isApplicableDropRootRule(inputRootNode, dropRootRule, environment)) {
        return;
      }
    }

    // copy
    myGenerationTracer.pushInputNode(inputRootNode);
    try {
      boolean[] changed = new boolean[]{false};
      SNode root = copyNodeFromInputNode_internal(null, null, inputRootNode, environment.getReductionContext(), changed);
      registerRoot(root, inputRootNode, null, true);
      if (changed[0]) {
        setChanged();
      }
    } finally {
      myGenerationTracer.closeInputNode(inputRootNode);
    }
  }

  private void applyWeaving_MappingRules() throws GenerationFailureException, GenerationCanceledException {
    WeavingProcessor wp = new WeavingProcessor(this);
    for (TemplateWeavingRule rule : myRuleManager.getWeaving_MappingRules()) {
      checkMonitorCanceled();
      wp.apply(rule);
    }
  }

  private boolean isApplicableDropRootRule(SNode inputRootNode, TemplateDropRootRule rule, TemplateExecutionEnvironment environment) throws GenerationFailureException {
    String applicableConcept = rule.getApplicableConcept();
    if (applicableConcept == null) {
      showErrorMessage(null, null, rule.getRuleNode().getNode(), "rule has no applicable concept defined");
      return false;
    }

    try {
      if (inputRootNode.isInstanceOfConcept(applicableConcept)) {
        if (environment.getReductionContext().getQueryExecutor().isApplicable(rule, environment, new DefaultTemplateContext(inputRootNode))) {
          myGenerationTracer.pushInputNode(inputRootNode);
          myGenerationTracer.pushRule(rule.getRuleNode());
          myGenerationTracer.closeInputNode(inputRootNode);
          return true;
        }
      }
    } catch (GenerationException e) {
      if (e instanceof GenerationFailureException) throw (GenerationFailureException) e;
      showErrorMessage(null, rule.getRuleNode().getNode(), "internal error: " + e.toString());
    }

    return false;
  }

  public boolean isDirty(SNode node) {
    RootDependenciesBuilder builder = myDependenciesBuilder.getRootBuilder(node);
    if (builder != null && builder.isUnchanged()) {
      return false;
    }
    return true;
  }

  /*
   * Unsynchronized
   */
  @Nullable
  protected QueryExecutionContext getExecutionContext(SNode inputNode) {
    RootDependenciesBuilder builder = myDependenciesBuilder.getRootBuilder(inputNode);
    if (builder != null) {
      if (builder.isUnchanged()) {
        return null;
      }

      QueryExecutionContext value;
      if (myExecutionContextMap == null) {
        myExecutionContextMap = new HashMap<DependenciesReadListener, QueryExecutionContext>();
        value = null;
      } else {
        value = myExecutionContextMap.get(builder);
      }
      if (value == null) {
        value = new QueryExecutionContextWithDependencyRecording(myExecutionContext, builder);
        myExecutionContextMap.put(builder, value);
      }
      return value;
    }
    return getDefaultExecutionContext(inputNode);
  }

  protected QueryExecutionContext getDefaultExecutionContext(SNode inputNode) {
    return myExecutionContext;
  }

  /*
   * returns null if no reductions found
   */
  @Nullable
  Collection<SNode> tryToReduce(TemplateContext context, SNodePointer templateSwitch, String mappingName, @NotNull ReductionContext reductionContext) throws GenerationFailureException, GenerationCanceledException {
    SNode inputNode = context.getInput();
    TemplateReductionRule reductionRule = null;
    checkGenerationCanceledFast();
    try {
      // find rule
      TemplateReductionRule[] conceptRules =
        templateSwitch != null
          ? myRuleManager.getRuleFinder(templateSwitch).findReductionRules(inputNode)
          : myRuleManager.getRuleFinder().findReductionRules(inputNode);
      if (conceptRules == null) {
        return null;
      }
      TemplateExecutionEnvironment environment = new TemplateExecutionEnvironmentImpl(this, reductionContext, getOperationContext(), getGenerationTracer());
      for (TemplateReductionRule rule : conceptRules) {
        reductionRule = rule;
        if (!getBlockedReductionsData().isReductionBlocked(inputNode, rule, reductionContext)) {
          Collection<SNode> outputNodes = reductionContext.getQueryExecutor().tryToApply(rule, environment, context);
          if (outputNodes != null) {
            if (outputNodes.size() == 1) {
              SNode reducedNode = outputNodes.iterator().next();
              // register copied node
              getMappings().addOutputNodeByInputNodeAndMappingName(inputNode, mappingName, reducedNode);
              if (templateSwitch == null) {
                // output node should be accessible via 'findCopiedNode'
                getMappings().addCopiedOutputNodeForInputNode(inputNode, reducedNode);
                // preserve user objects
                reducedNode.putUserObjects(inputNode);
                // keep track of 'original input node'
                if (inputNode.getModel() == getGeneratorSessionContext().getOriginalInputModel()) {
                  reducedNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode);
                }
              }
            }
            return outputNodes;
          }
        }
      }

    } catch (DismissTopMappingRuleException ex) {
      // it's ok, just continue
      if (ex.isLoggingNeeded() && reductionRule != null) {
        SNode ruleNode = reductionRule.getRuleNode().getNode();
        String messageText = "-- dismissed reduction rule: " + (ruleNode != null ? ruleNode.getDebugText() : "unknown");
        if (ex.isInfo()) {
          myLogger.info(ruleNode, messageText);
        } else if (ex.isWarning()) {
          myLogger.warning(ruleNode, messageText);
        } else {
          myLogger.error(ruleNode, messageText);
        }
      }
    } catch (GenerationException ex) {
      if (ex instanceof GenerationFailureException) {
        throw (GenerationFailureException) ex;
      } else if (ex instanceof GenerationCanceledException) {
        throw (GenerationCanceledException) ex;
      }
      // ignore
    }
    return null;
  }

  protected void checkGenerationCanceledFast() throws GenerationCanceledException {
  }

  Collection<SNode> copyNodeFromExternalNode(String mappingName, SNodePointer templateNode, String templateNodeId, SNode inputNode, ReductionContext reductionContext) throws GenerationFailureException, GenerationCanceledException {
    if (inputNode.isRegistered()) {
      // TODO fail in strict mode
      inputNode = CopyUtil.copy(inputNode);
      // TODO inputNode.changeModel();
    }

    synchronized (myAdditionalInputNodes) {
      if (!myAdditionalInputNodes.containsKey(inputNode)) {
        for (SNode n : inputNode.getDescendantsIterable(null, true)) {
          myAdditionalInputNodes.put(n, Boolean.TRUE);
        }
      }
    }

    // replace all references to input model => output model
    //invalidateReferencesInCopiedNode(inputNode);
    //return Collections.singletonList(inputNode);

    return copyNodeFromInputNode(mappingName, templateNode, templateNodeId, inputNode, reductionContext, new boolean[]{false});
  }

  Collection<SNode> copyNodeFromInputNode(String mappingName, SNodePointer templateNode, String templateNodeId, SNode inputNode, ReductionContext reductionContext, boolean[] changed) throws GenerationFailureException, GenerationCanceledException {
    myGenerationTracer.pushInputNode(inputNode);
    try {
      Collection<SNode> outputNodes = tryToReduce(new DefaultTemplateContext(inputNode), null, mappingName, reductionContext);
      if (outputNodes != null) {
        changed[0] = true;
        return outputNodes;
      }

      SNode copiedNode = copyNodeFromInputNode_internal(templateNode, templateNodeId, inputNode, reductionContext, changed);
      myMappings.addOutputNodeByInputNodeAndMappingName(inputNode, mappingName, copiedNode);
      return Collections.singletonList(copiedNode);
    } finally {
      myGenerationTracer.closeInputNode(inputNode);
    }
  }

  private SNode copyNodeFromInputNode_internal(@Nullable SNodePointer templateNode, String templateNodeId, SNode inputNode, ReductionContext reductionContext, boolean[] changed) throws GenerationFailureException, GenerationCanceledException {
    // no reduction found - do node copying
    myGenerationTracer.pushCopyOperation();
    SNode outputNode = new SNode(myOutputModel, inputNode.getConceptFqName(), false);
    if (inputNode.hasId() && inputNode.isRegistered()) {
      outputNode.setId(inputNode.getSNodeId());
    }
    blockReductionsForCopiedNode(inputNode, outputNode, reductionContext); // prevent infinite applying of the same reduction to the 'same' node.

    if (templateNodeId != null) {
      myMappings.addOutputNodeByInputAndTemplateNode(inputNode, templateNodeId, outputNode);
    } else if (templateNode != null) {
      myMappings.addOutputNodeByInputAndTemplateNode(inputNode, templateNode.getNode(), outputNode);
    }
    // output node should be accessible via 'findCopiedNode'
    myMappings.addCopiedOutputNodeForInputNode(inputNode, outputNode);

    outputNode.putProperties(inputNode);
    outputNode.putUserObjects(inputNode);
    // keep track of 'original input node'
    if (inputNode.getModel() == getGeneratorSessionContext().getOriginalInputModel()) {
      outputNode.putUserObject(TemplateQueryContext.ORIGINAL_INPUT_NODE, inputNode);
    }

    for (SReference inputReference : inputNode.getReferencesIterable()) {
      if (inputNode.isRegistered() && (inputReference instanceof DynamicReference || inputReference.isExternal())) {
        // dynamic & external references don't need validation => replace input model with output
        SModelReference targetModelReference = inputReference.isExternal() ? inputReference.getTargetSModelReference() : myOutputModel.getSModelReference();
        if (inputReference instanceof StaticReference) {
          if (targetModelReference == null) {
            myLogger.error(templateNode != null ? templateNode.getNode() : inputNode, "broken reference '" + inputReference.getRole() + "' in " + inputNode.getDebugText() + " (target model is null)",
              GeneratorUtil.describeIfExists(inputNode, "input node"),
              GeneratorUtil.describeIfExists(templateNode != null ? templateNode.getNode() : null, "template"));
            continue;
          }

          outputNode.addReference(new StaticReference(
            inputReference.getRole(),
            outputNode,
            targetModelReference,
            inputReference.getTargetNodeId(),
            inputReference.getResolveInfo()));
        } else if (inputReference instanceof DynamicReference) {
          DynamicReference outputReference = new DynamicReference(
            inputReference.getRole(),
            outputNode,
            targetModelReference,
            inputReference.getResolveInfo());
          outputReference.setOrigin(((DynamicReference) inputReference).getOrigin());
          outputNode.addReference(outputReference);
        } else {
          myLogger.error(inputNode, "internal error: can't clone reference '" + inputReference.getRole() + "' in " + inputNode.getDebugText(),
            new ProblemDescription(inputNode, " -- was reference class: " + inputReference.getClass().getName()));
        }
        continue;
      }

      SNode inputTargetNode = inputReference.getTargetNodeSilently();
      if (inputTargetNode == null) {
        myLogger.error(templateNode != null ? templateNode.getNode() : inputNode, "broken reference '" + inputReference.getRole() + "' in " + inputNode.getDebugText(),
          GeneratorUtil.describeIfExists(inputNode, "input node"),
          GeneratorUtil.describeIfExists(templateNode != null ? templateNode.getNode() : null, "template"));
        continue;
      }
      if (inputTargetNode.isRegistered() && inputTargetNode.getModel().equals(myInputModel) || myAdditionalInputNodes.containsKey(inputTargetNode)) {
        ReferenceInfo_CopiedInputNode refInfo = new ReferenceInfo_CopiedInputNode(
          inputReference.getRole(),
          outputNode,
          inputReference.getSourceNode(),
          inputTargetNode);
        PostponedReference reference = new PostponedReference(
          refInfo,
          this
        );
        outputNode.addReference(reference);
      } else if (inputTargetNode.isRegistered()) {
        outputNode.setReferent(inputReference.getRole(), inputTargetNode);
      } else {
        myLogger.error(templateNode != null ? templateNode.getNode() : inputNode, "broken reference '" + inputReference.getRole() + "' in " + inputNode.getDebugText() + " (unregistered target node)",
          GeneratorUtil.describeIfExists(inputNode, "input node"),
          GeneratorUtil.describeIfExists(templateNode != null ? templateNode.getNode() : null, "template"));
      }
    }

    for (SNode inputChildNode : inputNode.getChildrenIterable()) {
      String childRole = inputChildNode.getRole_();
      assert childRole != null;
      myGenerationTracer.pushInputNode(inputChildNode);
      try {
        Collection<SNode> outputChildNodes = tryToReduce(new DefaultTemplateContext(inputChildNode), null, null, reductionContext);
        if (outputChildNodes != null) {
          changed[0] = true;
          for (SNode outputChildNode : outputChildNodes) {
            // check child
            RoleValidationStatus status = validateChild(outputNode, childRole, outputChildNode);
            if (status != null) {
              status.reportProblem(false, "",
                GeneratorUtil.describe(inputNode, "input"),
                templateNode != null ?
                  GeneratorUtil.describe(templateNode.getNode(), "template") : null);
            }
            outputNode.addChild(childRole, outputChildNode);
          }
        } else {
          outputNode.addChild(childRole, copyNodeFromInputNode_internal(null, null, inputChildNode, reductionContext, changed));
        }
      } finally {
        myGenerationTracer.closeInputNode(inputChildNode);
      }
    }

    myGenerationTracer.pushOutputNode(outputNode);
    return outputNode;
  }

  private void revalidateAllReferences() throws GenerationCanceledException {
    // replace all postponed references
    for (SNode root : myOutputModel.roots()) {
      checkMonitorCanceled();
      revalidateAllReferences(root);
    }
  }

  private void revalidateAllReferences(SNode node) throws GenerationCanceledException {
    for (SReference reference : node.getReferencesArray()) {
      if (reference instanceof PostponedReference) {
        ((PostponedReference) reference).validateAndReplace();
      }
    }

    for (SNode child : node.getChildrenIterable()) {
      revalidateAllReferences(child);
    }
  }

  /**
   * prevents applying of reduction rules which have already been applied to the input node.
   */
  void blockReductionsForCopiedNode(SNode inputNode, SNode outputNode, ReductionContext reductionContext) {
    getBlockedReductionsData().blockReductionsForCopiedNode(inputNode, outputNode, reductionContext);
  }

  BlockedReductionsData getBlockedReductionsData() {
    if (myReductionData == null) {
      Object blockedReductions = getGeneratorSessionContext().getStepObject(BlockedReductionsData.KEY);
      if (blockedReductions == null) {
        blockedReductions = new BlockedReductionsData();
        getGeneratorSessionContext().putStepObject(BlockedReductionsData.KEY, blockedReductions);
      }
      myReductionData = (BlockedReductionsData) blockedReductions;
    }
    return myReductionData;
  }

  IGenerationTracer getGenerationTracer() {
    return myGenerationTracer;
  }

  DelayedChanges getDelayedChanges() {
    return myDelayedChanges;
  }

  RuleManager getRuleManager() {
    return myRuleManager;
  }

  public TemplateSwitchMapping getSwitch(SNodePointer switch_) {
    return myRuleManager.getSwitch(switch_);
  }

  @Override
  public boolean areMappingsAvailable() {
    return myIsStrict ? myAreMappingsReady : true;
  }

  public GenerationSessionContext getGeneratorSessionContext() {
    return (GenerationSessionContext) getOperationContext();
  }

  public boolean isStrict() {
    return myIsStrict;
  }

  void setChanged() {
    myChanged = true;
  }

  private void registerRoot(@NotNull SNode outputRoot, SNode inputNode, SNodePointer templateNode, boolean isCopied) {
    synchronized (this) {
      registerInModel(outputRoot, inputNode, templateNode);
      myNewToOldRoot.put(outputRoot, inputNode);
      myDependenciesBuilder.registerRoot(outputRoot, inputNode);
      if (isCopied) {
        getGeneratorSessionContext().registerCopiedRoot(outputRoot);
      }
    }
  }

  void rootReplaced(SNode old, SNode new_) {
    myDependenciesBuilder.rootReplaced(old, new_);
  }

  protected void registerInModel(SNode outputRoot, SNode inputNode, SNodePointer templateNode) {
    myOutputRoots.add(outputRoot);
  }

  SNode getOriginalRootByGenerated(SNode root) {
    SNode node = myNewToOldRoot.get(root);
    if (node != null && !node.isRoot()) {
      SNode noderoot = node.getContainingRoot();
      if (noderoot != null) {
        return noderoot;
      }
    }
    return node;
  }
}
