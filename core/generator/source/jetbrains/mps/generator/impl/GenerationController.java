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
import codeOrchestra.actionscript.modulemaker.ASModuleMaker;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.generator.*;
import jetbrains.mps.generator.generationTypes.IFileGenerationHandler;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.generator.impl.IGenerationTaskPool.ITaskPoolProvider;
import jetbrains.mps.generator.impl.IGenerationTaskPool.SimpleGenerationTaskPool;
import jetbrains.mps.ide.generator.OutputViewGenerationHandler;
import jetbrains.mps.ide.messages.MessagesViewTool;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.ide.progress.TaskProgressHelper;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.messages.IMessage;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.performance.IPerformanceTracer;
import jetbrains.mps.util.performance.IPerformanceTracer.NullPerformanceTracer;
import jetbrains.mps.util.performance.PerformanceTracer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GenerationController implements ITaskPoolProvider {
  protected static Logger LOG = Logger.getLogger(GenerationController.class);

  private final TransientModelsComponent myTransientModelsComponent;
  private List<SModelDescriptor> myInputModels;
  private final IOperationContext myOperationContext;
  protected final IGenerationHandler myGenerationHandler;
  protected ProgressIndicator myProgress;
  protected GeneratorLoggerAdapter myLogger;
  private GenerationOptions myOptions;
  private IGenerationTaskPool myParallelTaskPool;

  protected List<Pair<IModule, List<SModelDescriptor>>> myModuleSequence = new ArrayList<Pair<IModule, List<SModelDescriptor>>>();

  public GenerationController(List<SModelDescriptor> _inputModels, TransientModelsComponent transientModelsComponent, GenerationOptions options,
                              IGenerationHandler generationHandler, GeneratorLoggerAdapter generatorLogger, IOperationContext operationContext, ProgressIndicator progress) {
    myTransientModelsComponent = transientModelsComponent;
    myInputModels = _inputModels;
    myOperationContext = operationContext;
    myGenerationHandler = generationHandler;
    myProgress = progress;
    myLogger = generatorLogger;
    myOptions = options;
  }

  private void initMaps() {
    IModule current = null;
    ArrayList<SModelDescriptor> currentList = null;
    for (SModelDescriptor inputModel : myInputModels) {
      IModule newModule = inputModel.getModule();
      if (newModule == null) {
        myLogger.warning("Model " + inputModel.getLongName() + " won't be generated");
        continue;
      }

      if (current == null || newModule != current) {
        current = newModule;
        currentList = new ArrayList<SModelDescriptor>();
        myModuleSequence.add(new Pair<IModule, List<SModelDescriptor>>(current, currentList));
      }
      currentList.add(inputModel);
    }
  }

  @CodeOrchestraPatch
  public boolean generate() {
    myLogger.clear();
    long startJobTime = System.currentTimeMillis();

    myGenerationHandler.startGeneration(myLogger);
    initMaps();
    long totalJob = estimateGenerationTime();
    ITaskProgressHelper progressHelper = new TaskProgressHelper(myProgress, totalJob, startJobTime);
    CodeOrchestraGenerateManager codeOrchestraGenerateManager = myOperationContext.getProject().getComponent(CodeOrchestraGenerateManager.class);
    try {
      boolean generationOK = true;

      // RE-2737
      boolean hjsGeneration = false;

      try {
        for (Pair<IModule, List<SModelDescriptor>> moduleAndDescriptors : myModuleSequence) {
          IModule module = moduleAndDescriptors.o1;

          // RE-2737
          if (!hjsGeneration) {
            if (module instanceof Solution) {
              SolutionDescriptor moduleDescriptor = (SolutionDescriptor) module.getModuleDescriptor();
              if (moduleDescriptor != null) {
                OutputType outputType = codeOrchestraGenerateManager.getContextAwareOutputType(module);
                if (outputType == OutputType.HTML5_LIBRARY || outputType == OutputType.HTML5_APPLICATION) {
                  hjsGeneration = true;
                }
              }
            }
          }

          boolean result = generateModelsInModule(module, moduleAndDescriptors.o2, progressHelper);
          generationOK = generationOK && result;
        }
      } finally {
        if (myParallelTaskPool != null) {
          myParallelTaskPool.dispose();
          myParallelTaskPool = null;
        }
      }
      if (generationOK) {
        // RE-2737
        if (myLogger.needsInfo() || hjsGeneration) {
          /*
          String message = "Generation completed successfully in " + (System.currentTimeMillis() - startJobTime) + " ms";
          if (hjsGeneration) {
            Logger.getLogger("astojs").infoWithMarker(message, ASMessageMarker.MARKER);
          } else {
            myLogger.info(message);
          }
          */
        }
        // compile
        //generationOK = myGenerationHandler.compile(myOperationContext, myModuleSequence, true, progressHelper);
      } else {
        myLogger.error("Generation completed with errors in " + (System.currentTimeMillis() - startJobTime) + " ms");
      }

      // Don't compile if the generation failed in ActionScript View
      // RE-1234
      if (ViewUtils.isInActionScriptView(myOperationContext.getProject())) {
        if (generationOK) {
          // compile
          generationOK = compile(progressHelper, generationOK);
        } else {
          final MessagesViewTool viewTool = myOperationContext.getProject().getComponent(MessagesViewTool.class);
          final IMessage message = viewTool.getFirstErrorMessageWithHintObject();

          String generationFailedMessage;
          String generationFailedMessageSource;
          if (hjsGeneration) {
            generationFailedMessageSource = "astojs";
            generationFailedMessage = "Code generation failed";
          } else {
            generationFailedMessageSource = "ASModuleMaker";
            generationFailedMessage = "Code generation failed, skipping compilation";
          }

          if (message != null) {
            Logger.getLogger(generationFailedMessageSource).errorWithMarker(generationFailedMessage, message.getHintObject(), ASMessageMarker.MARKER);
          } else {
            Logger.getLogger(generationFailedMessageSource).errorWithMarker(generationFailedMessage, ASMessageMarker.MARKER);
          }
        }
      } else {
        // compile
        if (generationOK) {
          generationOK = compile(progressHelper, generationOK);
        }
      }

      return generationOK;
    } catch (GenerationCanceledException gce) {
      myLogger.warning("generation canceled");
      return false;
    } catch (GenerationFailureException e) {
      if (e.getMessage() != null && e.getCause() == null) {
        myLogger.error(e.getMessage());
      }
      return false;
    } catch (Exception t) {
      myLogger.handleException(t);
      return false;
    } finally {
      myGenerationHandler.finishGeneration(progressHelper);
    }
  }

  @CodeOrchestraPatch
  private boolean compile(ITaskProgressHelper progressHelper, boolean generationOK) throws IOException, GenerationCanceledException {
    ASModuleMaker moduleMaker = new ASModuleMaker(myOperationContext.getProject());
    CodeOrchestraGenerateManager codeOrchestraGenerateManager = moduleMaker.getCodeOrchestraGenerateManager();

    // RE-1077 - don't compile if output is for preview
    boolean generateTextMode = myGenerationHandler instanceof OutputViewGenerationHandler;

    // RE-1945 - force files write
    if (!generateTextMode && myGenerationHandler instanceof IFileGenerationHandler) {
      ((IFileGenerationHandler) myGenerationHandler).write();
    }

    // RE-2626 - if only one module is up for compilation and it doesn't have a main class, display a warning
    // RE-3137 - make use of CodeOrchestra generation context
    CodeOrchestraGenerationContext codeOrchestraGenerationContext = codeOrchestraGenerateManager.getCurrentContext();
    if (codeOrchestraGenerationContext != null && codeOrchestraGenerationContext.getRootOutputType() == OutputType.FLEX_APPLICATION) {
      IModule rootModule = MPSModuleRepository.getInstance().getModule(codeOrchestraGenerationContext.getRootModule());
      if (rootModule != null && !moduleMaker.hasMainClass(rootModule)) {
        // RE-3070
        Logger.getLogger("ASModuleMaker").errorWithMarker("Can't compile the " + rootModule + ".\nMain class is not specified for the module ", ASMessageMarker.MARKER);
        return false;
      }
    }

    // AS compile
    boolean asCompileOK = true;
    boolean allModulesAreAS = true;
    List<SModelDescriptor> toInvalidate = new ArrayList<SModelDescriptor>();
    for (Pair<IModule, List<SModelDescriptor>> moduleModelListPair : myModuleSequence) {
      IModule module = moduleModelListPair.o1;

      // Skip compilation for non-root modules
      if (codeOrchestraGenerationContext != null) {
        if (!codeOrchestraGenerationContext.getRootModule().equals(module.getModuleReference())) {
          continue;
        }
      }

      if (moduleMaker.canBeCompiled(module)) {
        if (!generateTextMode) {
          try {
            codeOrchestra.actionscript.modulemaker.CompilationResult result = moduleMaker.make(module, progressHelper, myOperationContext.getProject());

            if (codeOrchestraGenerationContext != null) {
              codeOrchestraGenerationContext.setCompilationResult(result);
            }

            if (result.getErrors() > 0) {
              asCompileOK = false;
            }
            toInvalidate.addAll(moduleModelListPair.o2);
          } catch (MakeException e) {
            asCompileOK = false;
            LOG.errorWithMarker("Can't compile module " + module.getModuleFqName() + ": " + e.getMessage(), ASMessageMarker.MARKER);
          } catch (Throwable t) {
            asCompileOK = false;
            LOG.errorWithMarker("Fatal error while compiling module " + module.getModuleFqName() + ": " + t.getMessage(), t, t, ASMessageMarker.MARKER);
          }
        }
      } else if (codeOrchestraGenerateManager.getContextAwareOutputType(module) != OutputType.UNKNOWN) {
        if (module instanceof Solution && !codeOrchestra.actionscript.view.utils.SolutionUtils.isActionScriptDependent((Solution) module)) {
          allModulesAreAS = false;
        }
      } else {
        allModulesAreAS = false;
      }
    }

    // Java compile
    boolean javaCompileOK = true;
    if (!allModulesAreAS) {
      javaCompileOK = myGenerationHandler.compile(myOperationContext, myModuleSequence, generationOK, progressHelper);
    } else {
      ModelGenerationStatusManager.getInstance().invalidateData(toInvalidate);
    }

    generationOK = generationOK && asCompileOK && javaCompileOK;

    return generationOK;
  }

  protected boolean generateModelsInModule(IModule module, List<SModelDescriptor> inputModels, ITaskProgressHelper progressHelper) throws Exception {
    boolean currentGenerationOK = true;

    // TODO fix context
    IOperationContext invocationContext = new ModuleContext(module, myOperationContext.getProject());
    myGenerationHandler.startModule(module, inputModels, myOperationContext, progressHelper);

    //++ generation
    String wasLoggingThreshold = null;
    try {
      if (myOptions.isShowErrorsOnly()) {
        wasLoggingThreshold = Logger.setThreshold("ERROR");
      }

      for (SModelDescriptor inputModel : inputModels) {
        currentGenerationOK = currentGenerationOK && generateModel(inputModel, module, invocationContext, progressHelper);
      }
    } finally {
      if (wasLoggingThreshold != null) {
        Logger.setThreshold(wasLoggingThreshold);
      }
    }

    checkMonitorCanceled();
    myLogger.info("");

    //myProgress.finishTask("generating in module " + module);   //todo finish timer
    progressHelper.setText2("");

    return currentGenerationOK;
  }

  private boolean generateModel(final SModelDescriptor inputModel, final IModule module, final IOperationContext invocationContext, final ITaskProgressHelper progressHelper) throws GenerationCanceledException {
    boolean currentGenerationOK = false;

    IPerformanceTracer ttrace = myOptions.getTracingMode() != GenerationOptions.TRACE_OFF
      ? new PerformanceTracer("model " + NameUtil.shortNameFromLongName(inputModel.getLongName()))
      : new NullPerformanceTracer();

    boolean traceTypes = myOptions.getTracingMode() == GenerationOptions.TRACE_TYPES;
    TypeChecker.getInstance().generationStarted(traceTypes ? ttrace : null);

    final GenerationSession generationSession = new GenerationSession(inputModel, invocationContext, this,
      myProgress, myLogger, myTransientModelsComponent.getModule(module), ttrace, myOptions);

    try {
      Logger.addLoggingHandler(generationSession.getLoggingHandler());
      if (!myGenerationHandler.canHandle(inputModel)) {
        LOG.error("Can't generate " + inputModel.getSModelReference().getSModelFqName());
        return true;
      }

      if (myLogger.needsInfo()) {
        myLogger.info("");
      }
      String taskName = ModelsProgressUtil.generationModelTaskName(inputModel);
      progressHelper.setText2("Generating " + inputModel.getSModelReference().getSModelFqName());
      progressHelper.startLeafTask(taskName);
      if (myLogger.needsInfo()) {
        myLogger.info("[model " + inputModel.getSModelReference().getSModelFqName() +
          (myOptions.isRebuildAll()
            ? ", rebuilding"
            : "") +
          (myOptions.isGenerateInParallel()
            ? ", using " + myOptions.getNumberOfThreads() + " threads]"
            : "]"));
      }


      try {
        currentGenerationOK = GeneratorUtil.runReadInWrite(new GenerationComputable<Boolean>() {
          @Override
          public Boolean compute() throws GenerationCanceledException {
            GenerationStatus status = generationSession.generateModel();
            status.setOriginalInputModel(inputModel);
            boolean currentGenerationOK = status.isOk();

            checkMonitorCanceled();

            currentGenerationOK = currentGenerationOK && myGenerationHandler.handleOutput(module, inputModel, status, invocationContext, progressHelper);

            return currentGenerationOK;
          }
        });
      } catch (GenerationFailureException e) {
        // never happens
      }
    } finally {
      Logger.removeLoggingHandler(generationSession.getLoggingHandler());
      generationSession.discardTransients();

      progressHelper.finishTask();

      //We need this in order to clear subtyping cache which might occupy too much memory
      //if we generate a lot of models. For example, Charisma generation wasn't possible
      //with -Xmx1200 before this change
      TypeChecker.getInstance().generationFinished();
      progressHelper.setText2("");
    }

    String report = ttrace.report();
    if (report != null) {
      myLogger.trace(report);
    }
    return currentGenerationOK;
  }

  public IGenerationTaskPool getTaskPool() {
    if (myParallelTaskPool != null || !myOptions.isGenerateInParallel()) {
      return myParallelTaskPool;
    }
    myParallelTaskPool = GenerationOptions.USE_PARALLEL_POOL
      ? new GenerationTaskPool(myProgress, myOptions.getNumberOfThreads())
      : new SimpleGenerationTaskPool();
    return myParallelTaskPool;
  }

  private long estimateGenerationTime() {
    long totalJob = myGenerationHandler.estimateCompilationMillis(myModuleSequence);

    for (Pair<IModule, List<SModelDescriptor>> pair : myModuleSequence) {
      IModule module = pair.o1;
      if (module != null) {
        long jobTime = ModelsProgressUtil.estimateGenerationTimeMillis((List) pair.o2);
        totalJob += jobTime;
      }
    }
    return Math.max(totalJob, 1000);
  }

  protected void checkMonitorCanceled() throws GenerationCanceledException {
    if (myProgress.isCanceled()) throw new GenerationCanceledException();
  }
}
