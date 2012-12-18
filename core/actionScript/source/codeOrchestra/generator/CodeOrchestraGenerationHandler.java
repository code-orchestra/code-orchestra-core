package codeOrchestra.generator;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.rgs.generation.RGSDigestProvider;
import jetbrains.mps.MPSCore;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.generationTypes.GenerationHandlerBase;
import jetbrains.mps.generator.generationTypes.IFileGenerationHandler;
import jetbrains.mps.generator.generationTypes.TextGenerator;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.make.MPSCompilationResult;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.make.java.BLDependenciesCache;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;

import java.io.IOException;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraGenerationHandler extends GenerationHandlerBase implements IFileGenerationHandler {

  private CodeOrchestraGenerationFileProcessor myProcessor;
  private Project project;

  public CodeOrchestraGenerationHandler(Project project) {
    this.project = project;
  }

  @Override
  public boolean canHandle(SModelDescriptor inputModel) {
    return SModelStereotype.isUserModel(inputModel);
  }

  @Override
  public void startGeneration(IGeneratorLogger logger) {
    super.startGeneration(logger);
    info("generating files");
    myProcessor = new CodeOrchestraGenerationFileProcessor(project);
  }

  @Override
  public boolean handleOutput(IModule module, SModelDescriptor inputModel, GenerationStatus status, IOperationContext invocationContext, ITaskProgressHelper progressHelper) {
    info("handling output...");
    IFile targetDir = FileSystem.getInstance().getFileByPath(module.getOutputFor(inputModel));

    long startJobTime = System.currentTimeMillis();

    boolean result = false;
    if (status.isOk()) {
      CodeOrchestraStreamHandler streamHandler = new CodeOrchestraStreamHandler(inputModel, targetDir, myProcessor);
      try {
        result = new TextGenerator(streamHandler,
          BLDependenciesCache.getInstance().getGenerator(),
          TraceInfoCache.getInstance().getGenerator(),
          GenerationDependenciesCache.getInstance().getGenerator()
        ).handleOutput(invocationContext, status);
      } finally {
        streamHandler.dispose();
      }
    }

    if (!result) {
      info("there were errors.");
      return false;
    }
    if (myLogger.needsInfo()) {
      myLogger.info("output generated in " + (System.currentTimeMillis() - startJobTime) + " ms");
    }
    return true;
  }

  public void startModule(IModule module, List<SModelDescriptor> inputModels, IOperationContext operationContext, ITaskProgressHelper progressHelper) {
    progressHelper.setText2("module " + module);

    String outputFolder = module != null ? module.getGeneratorOutputPath() : null;

    if (myLogger.needsInfo()) {
      myLogger.info("module " + module + "; folder = " + outputFolder + "");
    }
  }

  @Override
  public boolean compile(IOperationContext operationContext, List<Pair<IModule, List<SModelDescriptor>>> input, boolean generationOK, ITaskProgressHelper progressHelper) throws IOException, GenerationCanceledException {
    boolean compiledSuccessfully = generationOK;

    writeFiles();

    if (generationOK) {
      long compilationStart = System.currentTimeMillis();
      boolean needToReload = false;

      for (Pair<IModule, List<SModelDescriptor>> moduleListPair : input) {
        IModule module = moduleListPair.o1;
        if (module != null && module.reloadClassesAfterGeneration()) {
          needToReload = true;
        }
        boolean compilationResult = compileModuleInMPS(module, progressHelper);
        compiledSuccessfully = compiledSuccessfully && compilationResult;
      }
      if (compiledSuccessfully && needToReload) {
        reloadClasses(progressHelper);
      }

      info("Compilation finished in " + (System.currentTimeMillis() - compilationStart) + " ms");
    }
    return compiledSuccessfully;
  }

  protected boolean compileModuleInMPS(IModule module, ITaskProgressHelper progressHelper) throws IOException, GenerationCanceledException {
    boolean compiledSuccessfully = true;

    if (module != null) {
      if (!module.isCompileInMPS()) {
        error("Module is compiled in IntelliJ IDEA, can't compile it.");
        compiledSuccessfully = false;
      } else {
        checkMonitorCanceled(progressHelper);
        progressHelper.startLeafTask(ModelsProgressUtil.TASK_NAME_COMPILE_IN_MPS);
        String info = "compiling in JetBrains MPS...";
        progressHelper.setText2(info);
        info(info);
        MPSCompilationResult compilationResult = new ModuleMaker().make(CollectionUtil.set(module), new EmptyProgressIndicator());
        progressHelper.finishTask();
        if (compilationResult == null || compilationResult.getErrors() > 0) {
          compiledSuccessfully = false;
        }

        if (compilationResult != null) {
          if (compilationResult.getErrors() > 0) {
            error("" + compilationResult);
          } else if (compilationResult.getWarnings() > 0) {
            warning("" + compilationResult);
          } else {
            info("" + compilationResult);
          }
        }
      }

      progressHelper.setText2("");
      checkMonitorCanceled(progressHelper);
    }
    return compiledSuccessfully;
  }

  protected void reloadClasses(ITaskProgressHelper progressHelper) {
    if (MPSCore.getInstance().isTestMode()) {
      return;
    }

    long start = System.currentTimeMillis();

    info("");
    String info = "reloading MPS classes...";
    info(info);

    progressHelper.setText2(info);
    progressHelper.startLeafTask(ModelsProgressUtil.TASK_NAME_RELOAD_ALL);
    ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
    progressHelper.finishTask();
    progressHelper.setText2("");

    info("Reloaded in " + (System.currentTimeMillis() - start) + " ms");
  }

  @Override
  public long estimateCompilationMillis(List<Pair<IModule, List<SModelDescriptor>>> input) {
    long totalJob = 0;
    for (Pair<IModule, List<SModelDescriptor>> pair : input) {
      IModule module = pair.o1;
      if (module != null) {
        long jobTime = ModelsProgressUtil.estimateCompilationMillis(!module.isCompileInMPS());
        totalJob += jobTime;
      }
    }
    totalJob += ModelsProgressUtil.estimateReloadAllTimeMillis();
    return totalJob;
  }

  @Override
  public void write() {
    try {
      writeFiles();
    } catch (Throwable t) {
      // ignore
    }
  }

  protected void writeFiles() {
    if (myProcessor != null) {
      performWritingFilesTask(new Runnable() {
        @Override
        public void run() {
          myProcessor.saveGeneratedFiles();
        }
      });
      myProcessor = null;
    }
  }

  @CodeOrchestraPatch
  protected void performWritingFilesTask(final Runnable writingTask) {
    // RE-2416
    if (ApplicationManager.getApplication().isWriteAccessAllowed()) {
      writingTask.run();
    } else {
      ModelAccess.instance().writeFilesInEDT(writingTask);
    }
  }

  @Override
  public void generationCompleted() {
    // Note this can be called twice per one generation
    writeFiles();

    RGSDigestProvider.getInstance().invalidate();
    LiveCodingManager.instance().toggleLiveGeneration(false);
  }

  @Override
  public String toString() {
    return "Generate Files";
  }

}
