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
package jetbrains.mps.generator.generationTypes.java;

import com.intellij.openapi.application.Application;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.MPSCore;
import jetbrains.mps.make.java.BLDependenciesCache;
import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.generator.generationTypes.GenerationHandlerBase;
import jetbrains.mps.generator.generationTypes.TextGenerator;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.make.MPSCompilationResult;
import jetbrains.mps.make.ModuleMaker;
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
 * Stores files on disk, compiles and reloads classes.
 * <p/>
 * Evgeny Gryaznov, Jan 21, 2010
 */
public class JavaGenerationHandler extends GenerationHandlerBase {

  private FileProcessor myProcessor;

  @Override
  public boolean canHandle(SModelDescriptor inputModel) {
    return SModelStereotype.isUserModel(inputModel);
  }

  @Override
  public void startGeneration(IGeneratorLogger logger) {
    super.startGeneration(logger);
    info("generating files");
    myProcessor = new FileProcessor();
  }

  @Override
  public boolean handleOutput(IModule module, SModelDescriptor inputModel, GenerationStatus status, IOperationContext invocationContext, ITaskProgressHelper progressHelper) {
    info("handling output...");
    IFile targetDir = FileSystem.getInstance().getFileByPath(module.getOutputFor(inputModel));

    long startJobTime = System.currentTimeMillis();

    boolean result = false;
    if (status.isOk()) {
      JavaStreamHandler javaStreamHandler = new JavaStreamHandler(inputModel, targetDir, myProcessor);
      try {
        result = new TextGenerator(javaStreamHandler,
          BLDependenciesCache.getInstance().getGenerator(),
          TraceInfoCache.getInstance().getGenerator(),
          GenerationDependenciesCache.getInstance().getGenerator()
        ).handleOutput(invocationContext, status);
      } finally {
        javaStreamHandler.dispose();
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
    writeFiles();
  }

  @Override
  public String toString() {
    return "Generate Files";
  }
}
