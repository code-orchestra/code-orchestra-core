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
package jetbrains.mps.generator;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.generator.impl.GenerationController;
import jetbrains.mps.generator.impl.GeneratorLoggerAdapter;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.messages.IMessageHandler;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.UndoHelper;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GeneratorManager {

  private static final Logger LOG = Logger.getLogger(GeneratorManager.class);

  private final List<GenerationListener> myGenerationListeners = new ArrayList<GenerationListener>();

  private Project myProject;

  public GeneratorManager(Project project) {
    myProject = project;
  }

  /**
   * use GenerationFacade
   */
  @Deprecated
  public boolean generateModels(final List<SModelDescriptor> inputModels,
                                final IOperationContext invocationContext,
                                final IGenerationHandler generationHandler,
                                final ProgressIndicator progress,
                                final IMessageHandler messages) {
    return generateModels(inputModels, invocationContext, generationHandler, progress, messages, GenerationOptions.getDefaults().create());
  }

  /**
   * use GenerationFacade
   */
  @Deprecated
  public boolean generateModels(final List<SModelDescriptor> inputModels,
                                final IOperationContext invocationContext,
                                final IGenerationHandler generationHandler,
                                final ProgressIndicator progress,
                                final IMessageHandler messages,
                                final boolean saveTransientModels,
                                final boolean rebuildAll) {

    // default options
    GenerationOptions options = GenerationOptions.getDefaults()
      .saveTransientModels(saveTransientModels)
      .rebuildAll(rebuildAll).create();

    return generateModels(inputModels, invocationContext, generationHandler, progress, messages, options);
  }

 /**
   * use GenerationFacade
   */
  @Deprecated
  public boolean generateModels(final List<SModelDescriptor> inputModels,
                                final IOperationContext invocationContext,
                                final IGenerationHandler generationHandler,
                                final ProgressIndicator progress,
                                final IMessageHandler messages,
                                final GenerationOptions options) {
    final boolean[] result = new boolean[1];
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        TransientModelsComponent transientModelsComponent = myProject.getComponent(TransientModelsComponent.class);
        transientModelsComponent.startGeneration(options.getNumberOfModelsToKeep());

        options.getGenerationTracer().startTracing();
        fireBeforeGeneration(inputModels, options, invocationContext);
		
		// CodeOrchestra TODO: do we need this?
        for (SModelDescriptor d : inputModels) {
          transientModelsComponent.createModule(d.getModule());
        }

        GeneratorLoggerAdapter logger = new GeneratorLoggerAdapter(messages, options.isShowInfo(), options.isShowWarnings(), options.isKeepModelsWithWarnings());

        final GenerationController gc = new GenerationController(inputModels, transientModelsComponent, options, generationHandler, logger, invocationContext, progress);
        result[0] = UndoHelper.getInstance().runNonUndoableAction(new Computable<Boolean>() {
          @Override
          public Boolean compute() {
            boolean success = gc.generate();
            if(success) {
              fireModelsGenerated(Collections.unmodifiableList(inputModels), success);
            }
            return success;
          }
        });
        options.getGenerationTracer().finishTracing();
        fireAfterGeneration(inputModels, options, invocationContext);

        transientModelsComponent.publishAll();

        // RE-786
        if (result[0]) {
          for (SModelDescriptor inputModel : inputModels) {
            inputModel.markAsRequiringGeneration(false);
          }
        }

        CleanupManager.getInstance().cleanup();
      }
    });
    generationHandler.generationCompleted();
    return result[0];
  }

  private void fireBeforeGeneration(List<SModelDescriptor> inputModels, GenerationOptions options, IOperationContext operationContext) {
    for (GenerationListener l : myGenerationListeners) {
      try {
        l.beforeGeneration(inputModels, options, operationContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireAfterGeneration(List<SModelDescriptor> inputModels, GenerationOptions options, IOperationContext operationContext) {
    for (GenerationListener l : myGenerationListeners) {
      try {
        l.afterGeneration(inputModels, options, operationContext);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModelsGenerated(List<SModelDescriptor> models, boolean success) {
    for (GenerationListener l : myGenerationListeners) {
      try {
        l.modelsGenerated(models, success);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void addGenerationListener(GenerationListener l) {
    myGenerationListeners.add(l);
  }

  public void removeGenerationListener(GenerationListener l) {
    myGenerationListeners.remove(l);
  }

  @Deprecated
  public void addCompilationListener(CompilationListener l) {
  }

  @Deprecated
  public void removeCompilationListener(CompilationListener l) {
  }

  public static boolean isDoNotGenerate(SModelDescriptor sm) {
    return sm instanceof EditableSModelDescriptor && ((EditableSModelDescriptor) sm).isDoNotGenerate();
  }

  public static void setDoNotGenerate(SModelDescriptor sm, boolean value) {
    if (!(sm instanceof EditableSModelDescriptor)) return;
    ((EditableSModelDescriptor) sm).setDoNotGenerate(value);
  }
}
