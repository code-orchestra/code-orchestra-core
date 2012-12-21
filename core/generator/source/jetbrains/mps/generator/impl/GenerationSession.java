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
import codeOrchestra.actionscript.cache.CacheManagerFacade;
import codeOrchestra.generator.listener.GenerateBroadcaster;
import codeOrchestra.generator.listener.GenerateEventType;
import jetbrains.mps.generator.*;
import jetbrains.mps.generator.impl.IGenerationTaskPool.ITaskPoolProvider;
import jetbrains.mps.generator.impl.cache.IntermediateModelsCache;
import jetbrains.mps.generator.impl.cache.TransientModelWithMetainfo;
import jetbrains.mps.generator.impl.dependencies.DependenciesBuilder;
import jetbrains.mps.generator.impl.plan.GenerationPartitioningUtil;
import jetbrains.mps.generator.impl.plan.GenerationPlan;
import jetbrains.mps.generator.impl.plan.ModelContentUtil;
import jetbrains.mps.generator.runtime.*;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.logging.LoggingHandlerAdapter;
import jetbrains.mps.messages.NodeWithContext;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.structure.modules.mappingpriorities.MappingPriorityRule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.performance.IPerformanceTracer;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * Igor Alshannikov
 * Oct 26, 2005
 * <p/>
 * Created once per model generation.
 */
public class GenerationSession {
  private final ITaskPoolProvider myTaskPoolProvider;
  private final SModelDescriptor myOriginalInputModel;
  private GenerationPlan myGenerationPlan;

  private final IOperationContext myInvocationContext;
  private final TransientModelsModule myTransientModelsModule;
  private final IGenerationTracer myGenerationTracer;
  private final boolean myDiscardTransients;
  private final boolean myKeepFinalOutput;
  private final ProgressIndicator myProgressMonitor;
  private ILoggingHandler myLoggingHandler;
  private final GenerationSessionLogger myLogger;
  private DependenciesBuilder myDependenciesBuilder;
  private Map<String, Object> myParameters;

  private IntermediateModelsCache myNewCache;
  private GenerationSessionContext mySessionContext;
  private IPerformanceTracer ttrace;

  private int myMajorStep = 0;
  private int myMinorStep = -1;
  private GenerationOptions myGenerationOptions;

  public GenerationSession(@NotNull SModelDescriptor inputModel, IOperationContext invocationContext, ITaskPoolProvider taskPoolProvider,
                           ProgressIndicator progressMonitor, GeneratorLoggerAdapter logger, TransientModelsModule transientModelsModule,
                           IPerformanceTracer tracer, GenerationOptions generationOptions) {
    myTaskPoolProvider = taskPoolProvider;
    myOriginalInputModel = inputModel;
    myInvocationContext = invocationContext;
    myTransientModelsModule = transientModelsModule;
    myGenerationTracer = generationOptions.getGenerationTracer();
    myDiscardTransients = !generationOptions.isSaveTransientModels();
    myKeepFinalOutput = generationOptions.isKeepOutputModel();
    myProgressMonitor = progressMonitor;
    myLogger = new GenerationSessionLogger(logger);
    ttrace = tracer;
    myGenerationOptions = generationOptions;
  }

  @CodeOrchestraPatch
  public GenerationStatus generateModel() throws GenerationCanceledException {
    GenerateBroadcaster.getInstance().fireGenerateEvent(myOriginalInputModel.getSModel(), GenerateEventType.GENERATION_STARTED); // RE-4215

    if (myMajorStep != 0) {
      throw new GenerationCanceledException();
    }

    // create a plan
    ttrace.push("analyzing dependencies", false);
    myGenerationPlan = new GenerationPlan(myOriginalInputModel.getSModel(), GlobalScope.getInstance());
    if (!checkGenerationPlan(myGenerationPlan)) {
      if(myGenerationOptions.isStrictMode()) {
        GenerateBroadcaster.getInstance().fireGenerateEvent(myOriginalInputModel.getSModel(), GenerateEventType.GENERATION_ENDED); // RE-4215
        throw new GenerationCanceledException();
      }
    }

    // generation parameters
    GenerationParametersProvider parametersProvider = myGenerationOptions.getParametersProvider();
    if (parametersProvider != null) {
      myParameters = parametersProvider.getParameters(myOriginalInputModel);
    } else {
      myParameters = null;
    }

    IncrementalGenerationHandler incrementalHandler = new IncrementalGenerationHandler(myOriginalInputModel, myInvocationContext, myGenerationOptions, myGenerationPlan.getSignature(), myParameters, null);
    myDependenciesBuilder = incrementalHandler.createDependenciesBuilder();

    if (incrementalHandler.canOptimize()) {
      int ignored = incrementalHandler.getIgnoredRoots().size();
      int total = incrementalHandler.getRootsCount();
      myLogger.info((!incrementalHandler.canIgnoreConditionals() ? "" : "descriptors and ") + ignored + " of " + total + " roots are unchanged");

      if (total > 0 && ignored == total && incrementalHandler.canIgnoreConditionals()) {
        myLogger.info("generated files are up-to-date");
        ttrace.pop();

        GenerateBroadcaster.getInstance().fireGenerateEvent(myOriginalInputModel.getSModel(), GenerateEventType.GENERATION_ENDED); // RE-4215

        return new GenerationStatus(myOriginalInputModel, null,
          myDependenciesBuilder.getResult(myInvocationContext, myGenerationOptions.getIncrementalStrategy()), false, false, false);
      }

      if (!incrementalHandler.getRequiredRoots().isEmpty() || incrementalHandler.requireConditionals()) {
        myLogger.info((!incrementalHandler.requireConditionals() ? "" : "descriptors and ") + incrementalHandler.getRequiredRoots().size() + " roots can be used from cache");
      }

      if (myGenerationOptions.getTracingMode() != GenerationOptions.TRACE_OFF) {
        myLogger.info("Processing:");
        for (SNode node : myOriginalInputModel.getSModel().roots()) {
          if (incrementalHandler.getRequiredRoots().contains(node)) {
            myLogger.info(node.getName() + " (cache)");
          } else if (!incrementalHandler.getIgnoredRoots().contains(node)) {
            myLogger.info(node.getName());
          }
        }
      }
    }

    boolean success = false;

    myNewCache = incrementalHandler.createNewCache();
    ttrace.pop();
    try {
      SModel currInputModel = myOriginalInputModel.getSModel();
      SModel currOutput = null;

      ttrace.push("steps", false);
      myGenerationPlan.createSwitchGraph();

      for (myMajorStep = 0; myMajorStep < myGenerationPlan.getStepCount(); myMajorStep++) {
        if (myLogger.needsInfo()) {
          myLogger.info("executing step " + (myMajorStep + 1));
        }
        //ttrace.push("step " + (myMajorStep + 1), false);

        currOutput = executeMajorStep(currInputModel);
        // RE-3969
        if (currOutput instanceof TransientSModel) {
          ((TransientSModel) currOutput).setObsolete(true);
        }

        // RE-2782
        // RE-3923
        CacheManagerFacade.getInstance().invalidateCache();

        //ttrace.pop();
        if (currOutput == null || myLogger.getErrorCount() > 0) {
          break;
        }
        if (myGenerationPlan.getMappingConfigurations(myMajorStep).isEmpty()) {
          break;
        }
        currInputModel = currOutput;
      }
      ttrace.pop();

      // we need this in order to prevent memory leaks from nodes which are reported to message view
      // since session objects might include objects with disposed class loaders
      if (mySessionContext != null) {
        mySessionContext.clearTransientObjects();
      }

      if (myKeepFinalOutput && mySessionContext != null) {
        mySessionContext.keepTransientModel(currOutput, true);
      }

      GenerationStatus generationStatus = new GenerationStatus(myOriginalInputModel, currOutput.getModelDescriptor(),
        myDependenciesBuilder.getResult(myInvocationContext, myGenerationOptions.getIncrementalStrategy()), myLogger.getErrorCount() > 0,
        myLogger.getWarningCount() > 0, false);
      success = generationStatus.isOk();

      GenerateBroadcaster.getInstance().fireGenerateEvent(currOutput, GenerateEventType.GENERATION_ENDED); // RE-4215

      return generationStatus;
    } catch (GenerationCanceledException gce) {
      throw gce;
    } catch (GenerationFailureException gfe) {
      if (gfe.getMessage() != null && gfe.getCause() == null) {
        myLogger.error(gfe.getMessage());
      }
      myLogger.error("model \"" + myOriginalInputModel.getSModelReference().getSModelFqName() + "\" generation failed : " + gfe);
      return new GenerationStatus.ERROR(myOriginalInputModel);
    } catch (Exception e) {
      myLogger.handleException(e);
      myLogger.error("model \"" + myOriginalInputModel.getSModelReference().getSModelFqName() + "\" generation failed (see exception)");
      return new GenerationStatus.ERROR(myOriginalInputModel);
    } finally {
      if (myNewCache != null) {
        if (success) {
          myNewCache.store();
        } else {
          myNewCache.remove();
        }
        myLogger.info("time spent saving cache: " + myNewCache.getTimeSpent());
      }
    }
  }

  private SModel executeMajorStep(SModel inputModel) throws GenerationCanceledException, GenerationFailureException {
    myMinorStep = -1;

    List<TemplateMappingConfiguration> mappingConfigurations = new ArrayList<TemplateMappingConfiguration>(myGenerationPlan.getMappingConfigurations(myMajorStep));
    if (mappingConfigurations.isEmpty()) {
      if (inputModel.rootsCount() > 0) {
        myLogger.warning("skip model \"" + inputModel.getSModelFqName() + "\" : no generator available");
      }
      return inputModel;
    }
    if (myGenerationTracer.isTracing() && myLogger.needsInfo()) {
      printGenerationStepData(inputModel);
    }

    // -- replace context
    mySessionContext = new GenerationSessionContext(myInvocationContext, myGenerationTracer, myTransientModelsModule, inputModel, myGenerationPlan, myParameters, mySessionContext);
    myLogger.setOperationContext(mySessionContext);

    // -- filter mapping configurations
    Iterator<TemplateMappingConfiguration> it = mappingConfigurations.iterator();
    TemplateGenerator templateGenerator = new TemplateGenerator(mySessionContext, myProgressMonitor, myLogger, null, inputModel, null, myGenerationOptions, myDependenciesBuilder, ttrace);
    while (it.hasNext()) {
      TemplateMappingConfiguration c = it.next();
      try {
        if (!c.isApplicable(templateGenerator)) {
          it.remove();
        }
      } catch (GenerationException e) {
        if (!(e instanceof GenerationFailureException)) {
          myLogger.handleException(e);
          myLogger.error("mapping configuration's isApplicable block threw an exception");
          throw new GenerationFailureException(e);
        }
        throw (GenerationFailureException) e;
      }
    }

    if (mappingConfigurations.isEmpty()) {
      // no applicable configurations found
      return inputModel;
    }

    // -- prepare generator
    Collections.sort(mappingConfigurations, new Comparator<TemplateMappingConfiguration>() {
      @Override
      public int compare(TemplateMappingConfiguration o1, TemplateMappingConfiguration o2) {
        TemplateModel m1 = o1.getModel();
        TemplateModel m2 = o2.getModel();
        int result = m1 == m2 ? 0 : m1.getLongName().compareTo(m2.getLongName());
        if(result != 0) {
          return result;
        }
        return o1.getName().compareTo(o2.getName());
      }
    });
    RuleManager ruleManager = new RuleManager(myGenerationPlan, mappingConfigurations);

    SModel outputModel = executeMajorStepInternal(inputModel, ruleManager);
    if (myLogger.getErrorCount() > 0) {
      myLogger.warning("model \"" + inputModel.getSModelFqName() + "\" has been generated with errors");
    }
    return outputModel;
  }

  private SModel executeMajorStepInternal(SModel inputModel, RuleManager ruleManager) throws GenerationFailureException, GenerationCanceledException {
    SModel currentInputModel = inputModel;
    IGenerationTracer tracer = mySessionContext.getGenerationTracer();

    // -----------------------
    // run pre-processing scripts
    // -----------------------
    ttrace.push("pre-processing", false);
    currentInputModel = preProcessModel(ruleManager, currentInputModel);
    ttrace.pop();

    SModel currentOutputModel = createTransientModel();
    tracer.startTracing(currentInputModel, currentOutputModel);

    // -----------------------
    // primary mapping
    // -----------------------
    currentInputModel.setLoading(false);
    if (myLogger.needsInfo()) {
      myLogger.info("generating model '" + currentInputModel.getSModelFqName() + "' --> '" + currentOutputModel.getSModelFqName() + "'");
    }
    GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.PRIMARY_MAPPING_GENERATION_STARTED, myMajorStep); // RE-4215
    boolean somethingHasBeenGenerated = applyRules(currentInputModel, currentOutputModel, true, ruleManager);
    GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.PRIMARY_MAPPING_GENERATION_ENDED, myMajorStep); // RE-4215
    if (!somethingHasBeenGenerated) {
      SModelOperations.validateLanguagesAndImports(currentOutputModel, false, false);
      myDependenciesBuilder.updateModel(currentOutputModel);
      recycleWasteModel(currentInputModel);
      return currentOutputModel;
    }

    // -----------------------
    // secondary mapping (infinite cycle until 'exit condition' is true)
    // -----------------------
    int secondaryMappingRepeatCount = 1;
    while (true) {
      if (secondaryMappingRepeatCount > 1) {
        GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.SECONDARY_MAPPING_GENERATION_ENDED, myMinorStep); // RE-4215
      }

      SModelOperations.validateLanguagesAndImports(currentOutputModel, false, false);
      myDependenciesBuilder.updateModel(currentOutputModel);

      // apply mapping to the output model
      mySessionContext.clearTransientObjects();
      // probably we can forget about former input model here
      recycleWasteModel(currentInputModel);
      currentInputModel = currentOutputModel;
      currentInputModel.setLoading(false);
      currentInputModel.disposeFastNodeFinder();

      SModel transientModel = createTransientModel();
      if (myLogger.needsInfo()) {
        myLogger.info("next minor step '" + currentInputModel.getSModelFqName().getStereotype() + "' --> '" + transientModel.getSModelFqName().getStereotype() + "'");
      }
      GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.SECONDARY_MAPPING_GENERATION_STARTED, myMinorStep); // RE-4215
      tracer.startTracing(currentInputModel, transientModel);
      if (!applyRules(currentInputModel, transientModel, false, ruleManager)) {
        // nothing has been generated
        myDependenciesBuilder.dropModel();
        tracer.discardTracing(currentInputModel, transientModel);
        mySessionContext.getModule().removeModel(transientModel.getModelDescriptor());

        GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.SECONDARY_MAPPING_GENERATION_ENDED, myMinorStep); // RE-4215

        myMinorStep--;
        if (myLogger.needsInfo()) {
          myLogger.info("unchanged, empty model '" + transientModel.getSModelFqName().getStereotype() + "' removed");
        }
        break;
      }

      if (++secondaryMappingRepeatCount > 10) {
        myLogger.error("failed to generate output after 10 repeated mappings");
        if (tracer.isTracing()) {
          myLogger.error("last rules applied:");
          List<Pair<SNode, SNode>> pairs = tracer.getAllAppiedRulesWithInputNodes(transientModel.getSModelReference());
          for (Pair<SNode, SNode> pair : pairs) {
            myLogger.error(pair.o1, "rule: " + pair.o1.getDebugText(),
              GeneratorUtil.describe(pair.o2, "input"));
          }
        } else {
          myLogger.error("to get more diagnostic generate model with the 'save transient models' option");
        }
        myLogger.error("failed to generate output after 10 repeated mappings");
        throw new GenerationFailureException();
      }

      // next iteration ...
      // RE-3969
      if (transientModel instanceof TransientSModel) {
        ((TransientSModel) transientModel).setObsolete(true);
      }
      currentOutputModel = transientModel;
    }
    currentOutputModel.setLoading(true);

    // -----------------------
    // run post-processing scripts
    // -----------------------
    ttrace.push("post-processing", false);
    currentOutputModel = postProcessModel(ruleManager, currentOutputModel);
    ttrace.pop();

    return currentOutputModel;
  }

  private boolean applyRules(SModel currentInputModel, SModel currentOutputModel, final boolean isPrimary,
                             RuleManager ruleManager) throws GenerationFailureException, GenerationCanceledException {
    boolean hasChanges;
    myDependenciesBuilder.setOutputModel(currentOutputModel, myMajorStep, myMinorStep);
    final TemplateGenerator tg =
      myGenerationOptions.isGenerateInParallel()
        ? new ParallelTemplateGenerator(myTaskPoolProvider, mySessionContext, myProgressMonitor, myLogger, ruleManager, currentInputModel, currentOutputModel, myGenerationOptions, myDependenciesBuilder, ttrace)
        : new TemplateGenerator(mySessionContext, myProgressMonitor, myLogger, ruleManager, currentInputModel, currentOutputModel, myGenerationOptions, myDependenciesBuilder, ttrace);
    if (tg instanceof ParallelTemplateGenerator) {
      hasChanges = GeneratorUtil.runReadInWrite(new GenerationComputable<Boolean>() {
        @Override
        public Boolean compute() throws GenerationCanceledException, GenerationFailureException {
          return tg.apply(isPrimary);
        }
      });
    } else {
      hasChanges = tg.apply(isPrimary);
    }
    if (myNewCache != null && (isPrimary || hasChanges)) {
      ttrace.push("saving cache", false);
      TransientModelWithMetainfo modelWithMetaInfo = TransientModelWithMetainfo.create(currentOutputModel, myDependenciesBuilder);
      tg.getMappings().export(modelWithMetaInfo, myDependenciesBuilder);
      myNewCache.store(myMajorStep, myMinorStep, modelWithMetaInfo);
      ttrace.pop();
    }
    return hasChanges;
  }

  private SModel preProcessModel(RuleManager ruleManager, SModel currentInputModel) throws GenerationFailureException {
    List<TemplateMappingScript> preMappingScripts = ruleManager.getPreMappingScripts();
    if (preMappingScripts.isEmpty()) {
      return currentInputModel;
    }

    // need to clone input model?
    boolean needToCloneInputModel = !myDiscardTransients;  // clone model if save transients (needed for tracing)
    if (!needToCloneInputModel) {
      for (TemplateMappingScript preMappingScript : preMappingScripts) {
        if (preMappingScript.getKind() == TemplateMappingScript.PREPROCESS) {
          if (preMappingScript.modifiesModel()) {
            needToCloneInputModel = true;
            break;
          }
        }
      }
    }
    SModel toRecycle = null;
    if (needToCloneInputModel) {
      ttrace.push("model clone", false);
      SModel currentInputModel_clone = createTransientModel();
      if (myLogger.needsInfo()) {
        myLogger.info("clone model '" + currentInputModel.getSModelFqName() + "' --> '" + currentInputModel_clone.getSModelFqName() + "'");
      }
      CloneUtil.cloneModel(currentInputModel, currentInputModel_clone, currentInputModel == mySessionContext.getOriginalInputModel());
      ttrace.pop();

      if (!myDiscardTransients) { // tracing
        mySessionContext.getGenerationTracer().registerPreMappingScripts(currentInputModel, currentInputModel_clone, preMappingScripts);
      }

      // probably we can forget about former input model here
      toRecycle = currentInputModel;
      currentInputModel = currentInputModel_clone;
      myDependenciesBuilder.scriptApplied(currentInputModel);
    }

    boolean preProcessed = false;
    for (TemplateMappingScript preMappingScript : preMappingScripts) {
      if (preMappingScript.getKind() != TemplateMappingScript.PREPROCESS) {
        myLogger.warning(preMappingScript.getScriptNode().getNode(), "skip script " + preMappingScript.getLongName() + " - wrong script kind");
        continue;
      }
      if (myLogger.needsInfo()) {
        myLogger.info(preMappingScript.getScriptNode().getNode(), "pre-process " + preMappingScript.getLongName());
      }
      TemplateGenerator templateGenerator = new TemplateGenerator(mySessionContext, myProgressMonitor, myLogger, ruleManager, currentInputModel, currentInputModel, myGenerationOptions, myDependenciesBuilder, ttrace);
      try {
        GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.PRE_GEN_SCRIPT_STARTED, preMappingScript.getLongName()); // RE-4215
        templateGenerator.getDefaultExecutionContext(null).executeScript(preMappingScript, currentInputModel);
        GenerateBroadcaster.getInstance().fireGenerateEvent(currentInputModel, GenerateEventType.PRE_GEN_SCRIPT_ENDED, preMappingScript.getLongName()); // RE-4215
      } catch (Exception t) {
        myLogger.handleException(t);
        myLogger.error(preMappingScript.getScriptNode().getNode(), "error executing script " + preMappingScript.getLongName() + " (see exception)");
        throw new GenerationFailureException(t);
      }
      preProcessed = true;
    }
    if (needToCloneInputModel) {
      myDependenciesBuilder.scriptApplied(currentInputModel);
      if (myNewCache != null) {
        TransientModelWithMetainfo modelWithMetaInfo = TransientModelWithMetainfo.create(currentInputModel, myDependenciesBuilder);
        myNewCache.store(myMajorStep, myMinorStep, modelWithMetaInfo);
      }
      recycleWasteModel(toRecycle);
    }
    if (myLogger.needsInfo() && preProcessed) {
      myLogger.info("pre-processing finished");
    }
    return currentInputModel;
  }

  private SModel postProcessModel(RuleManager ruleManager, SModel currentModel) throws GenerationFailureException {
    List<TemplateMappingScript> postMappingScripts = ruleManager.getPostMappingScripts();
    if (postMappingScripts.isEmpty()) {
      return currentModel;
    }

    boolean needToCloneModel = !myDiscardTransients; // clone model - needed for tracing
    SModel toRecycle = null;
    if (needToCloneModel) {
      ttrace.push("model clone", false);
      SModel currentOutputModel_clone = createTransientModel();
      if (myLogger.needsInfo()) {
        myLogger.info("clone model '" + currentModel.getSModelFqName() + "' --> '" + currentOutputModel_clone.getSModelFqName() + "'");
      }
      CloneUtil.cloneModel(currentModel, currentOutputModel_clone, false);
      ttrace.pop();

      mySessionContext.getGenerationTracer().registerPostMappingScripts(currentModel, currentOutputModel_clone, postMappingScripts);
      toRecycle = currentModel;
      currentModel = currentOutputModel_clone;
      myDependenciesBuilder.scriptApplied(currentModel);
    }

    boolean postProcessed = false;
    for (TemplateMappingScript postMappingScript : postMappingScripts) {
      if (postMappingScript.getKind() != TemplateMappingScript.POSTPROCESS) {
        myLogger.warning(postMappingScript.getScriptNode().getNode(), "skip script " + postMappingScript.getLongName() + " - wrong script kind");
        continue;
      }
      if (myLogger.needsInfo()) {
        myLogger.info(postMappingScript.getScriptNode().getNode(), "post-process " + postMappingScript.getLongName());
      }
      TemplateGenerator templateGenerator = new TemplateGenerator(mySessionContext, myProgressMonitor, myLogger, ruleManager, currentModel, currentModel, myGenerationOptions, myDependenciesBuilder, ttrace);
      try {
        GenerateBroadcaster.getInstance().fireGenerateEvent(currentModel, GenerateEventType.POST_GEN_SCRIPT_STARTED, postMappingScript.getLongName()); // RE-4215
        templateGenerator.getDefaultExecutionContext(null).executeScript(postMappingScript, currentModel);
        GenerateBroadcaster.getInstance().fireGenerateEvent(currentModel, GenerateEventType.POST_GEN_SCRIPT_ENDED, postMappingScript.getLongName()); // RE-4215
      } catch (Exception t) {
        myLogger.handleException(t);
        myLogger.error(postMappingScript.getScriptNode().getNode(), "error executing script " + postMappingScript.getLongName() + " (see exception)");
        throw new GenerationFailureException(t);
      }
      postProcessed = true;
    }
    if (needToCloneModel) {
      myDependenciesBuilder.scriptApplied(currentModel);
      if (myNewCache != null) {
        TransientModelWithMetainfo modelWithMetaInfo = TransientModelWithMetainfo.create(currentModel, myDependenciesBuilder);
        myNewCache.store(myMajorStep, myMinorStep, modelWithMetaInfo);
      }
      recycleWasteModel(toRecycle);
    }
    if (myLogger.needsInfo() && postProcessed) {
      myLogger.info("post-processing finished");
    }
    return currentModel;
  }

  @CodeOrchestraPatch
  private SModel createTransientModel() {
    String longName = myOriginalInputModel.getLongName();
    String stereotype = Integer.toString(myMajorStep + 1) + "_" + ++myMinorStep;
    SModelDescriptor transientModel = mySessionContext.getModule().createTransientModel(longName, stereotype);
    SModel sModel = transientModel.getSModel();
    sModel.setLoading(true); // we dont need any events to be cast

    // CO-4812
    if (sModel instanceof TransientSModel) { // Seems to be always true
      ((TransientSModel) sModel).setOriginalModel(myOriginalInputModel.getSModel());
    }

    return sModel;
  }

  @CodeOrchestraPatch
  private void recycleWasteModel(@NotNull SModel model) {
    SModelDescriptor md = model.getModelDescriptor();
    if (model instanceof TransientSModel) {
      ttrace.push("recycling", false);
      model.disposeFastNodeFinder();
      if (myDiscardTransients && !mySessionContext.isTransientModelToKeep(model)) {
        mySessionContext.getModule().removeModel(md);
      }
      ttrace.pop();

      // RE-3993
      ((TransientSModel) model).setObsolete(true);
    }
  }

  private boolean checkGenerationPlan(GenerationPlan generationPlan) {
    if (generationPlan.hasConflictingPriorityRules()) {
      Map<MappingPriorityRule, TemplateModule> myRule2Generator = new HashMap<MappingPriorityRule, TemplateModule>();
      for (TemplateModule generator : generationPlan.getGenerators()) {
        Collection<TemplateMappingPriorityRule> priorities = generator.getPriorities();
        if(priorities == null) {
          continue;
        }

        for (TemplateMappingPriorityRule rule : priorities) {
          myRule2Generator.put((MappingPriorityRule) rule, generator);
        }
      }


      myLogger.error("Conflicting mapping priority rules encountered:");
      List<Pair<MappingPriorityRule, String>> errors = generationPlan.getConflictingPriorityRulesAsStrings();
      for (Pair<MappingPriorityRule, String> error : errors) {
        MappingPriorityRule rule = error.o1;
        String text = error.o2;

        TemplateModule templateModule = myRule2Generator.get(rule);
        myLogger.error(templateModule.getReference(), text);
      }
      myLogger.error("");
      return false;
    }
    return true;
  }

  private void printGenerationStepData(SModel inputModel) {
    List<String> references = new ArrayList<String>(ModelContentUtil.getUsedLanguageNamespaces(inputModel, false));
    Collections.sort(references);
    myLogger.info("languages used:");
    for (String reference : references) {
      myLogger.info("    " + reference);
    }
//    List<Generator> generators = stepController.getGenerators();
//    Collections.sort(generators, new Comparator<Generator>() {
//      public int compare(Generator o1, Generator o2) {
//        if (o1 == o2) return 0;
//        return o1.getAlias().compareTo(o2.getAlias());
//      }
//    });
//    addMessage(new Message(MessageKind.INFORMATION, "engaged generators:"));
//    for (Generator generator : generators) {
//      addMessage(new Message(MessageKind.INFORMATION, "    " + generator.getAlias()));
//    }

    myLogger.info("apply mapping configurations:");
    List<String> messages = GenerationPartitioningUtil.toStrings(myGenerationPlan.getMappingConfigurations(myMajorStep));
    for (String message : messages) {
      myLogger.info("    " + message);
    }
  }

  public ILoggingHandler getLoggingHandler() {
    if (myLoggingHandler == null) {
      myLoggingHandler = new LoggingHandlerAdapter() {
        public void addLogEntry(LogEntry e) {
          if (mySessionContext == null) return;
          Object o = e.getHintObject();
          if (o instanceof SNode) {
            mySessionContext.keepTransientModel(((SNode) o).getModel(), false);
          } else if (o instanceof NodeWithContext) {
            SNode node = ((NodeWithContext) o).getNode();
            if (node != null) {
              mySessionContext.keepTransientModel(node.getModel(), false);
            }
          }
        }
      };
    }
    return myLoggingHandler;
  }

  public void discardTransients() {
    if (mySessionContext == null) return;
    if (myDiscardTransients) {
      mySessionContext.clearTransientModels();
    }
    myLogger.setOperationContext(null);
    mySessionContext = null;
  }
}
