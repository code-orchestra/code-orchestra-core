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
package jetbrains.mps.ide.generator;

import com.intellij.ide.IdeEventQueue;
import com.intellij.openapi.extensions.ExtensionPointName;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Progressive;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.ui.DialogWrapper;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import codeOrchestra.generator.CodeOrchestraGenerationHandler;
import jetbrains.mps.generator.*;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.generator.generationTypes.java.JavaGenerationHandler;
import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.impl.plan.GenerationPartitioningUtil;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.messages.DefaultMessageHandler;
import jetbrains.mps.ide.messages.MessagesViewTool;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import javax.swing.JOptionPane;
import java.util.*;

/**
 * Evgeny Gryaznov, Aug 24, 2010
 */
public class GeneratorUIFacade {
  private static final GeneratorUIFacade INSTANCE = new GeneratorUIFacade();

  private GeneratorUIFacade() {
  }

  public static GeneratorUIFacade getInstance() {
    return INSTANCE;
  }

  public static ExtensionPointName<GenerationHandlerProvider> EP_NAME =
    ExtensionPointName.create("com.intellij.mps.GenerationHandler");

  public interface GenerationHandlerProvider {
    IGenerationHandler create();
  }

  @CodeOrchestraPatch
  public IGenerationHandler getDefaultGenerationHandler(Project project) {
    return new CodeOrchestraGenerationHandler(project);
  }

  @Deprecated
  public IGenerationHandler getDefaultGenerationHandler() {
    // RE-2103
    return new JavaGenerationHandler();
  }

  /**
   * @return false if canceled
   */
  public boolean generateModels(final IOperationContext operationContext,
                                final List<SModelDescriptor> inputModels,
                                final IGenerationHandler generationHandler,
                                boolean rebuildAll,
                                boolean skipRequirementsGeneration) {
    return generateModelsWithProgressWindow(operationContext, inputModels, generationHandler, rebuildAll, skipRequirementsGeneration);
  }

  /**
   * @return false if canceled
   */
  private boolean generateModelsWithProgressWindow(final IOperationContext invocationContext,
                                                   final List<SModelDescriptor> inputModels,
                                                   final IGenerationHandler generationHandler,
                                                   final boolean rebuildAll, boolean skipRequirementsGeneration) {
    if (inputModels.isEmpty()) return true;

    final Project project = invocationContext.getProject();
    assert project != null : "Cannot generate models without a project";

    final DefaultMessageHandler messages = new DefaultMessageHandler(project);
    final GenerationSettings settings = GenerationSettings.getInstance();

    // confirm saving transient models
    final boolean saveTransientModels;
    if (settings.isSaveTransientModels()) {
      Object[] options = {
        "Save Transient Models",
        "Not this time",
        "No, and cancel saving"};
      int option = JOptionPane.showOptionDialog(invocationContext.getMainFrame(),
        "Would you like to save transient models?",
        "",
        JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,
        null,
        options,
        options[0]);

      if (option == 0) {
        saveTransientModels = true;
      } else {
        saveTransientModels = false;
        if (option == 2) {
          settings.setSaveTransientModels(false);
        }
        if (option == -1) {
          return false;
        }
      }
    } else {
      saveTransientModels = false;
    }

    if (DumbService.getInstance(project).isDumb()) {
      DumbService.getInstance(project).showDumbModeNotification("Generation is not available until indices are built.");
      return false;
    }

    if (!skipRequirementsGeneration && generateRequirements(settings)) {
      boolean wasSaveTransientModels = settings.isSaveTransientModels();
      try {
        final Set<SModelDescriptor> requirements = new LinkedHashSet<SModelDescriptor>();
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            for (SModelDescriptor inputModel : inputModels) {
              requirements.addAll(getModelsToGenerateBeforeGeneration(inputModel, project));
            }
          }
        });

        for (SModelDescriptor inputModel : inputModels) {
          requirements.remove(inputModel);
        }

        if (!requirements.isEmpty()) {
          int result = 2;

          if (false && settings.getGenerateRequirementsPolicy() == GenerationSettings.GenerateRequirementsPolicy.ASK) {
            final StringBuffer message = new StringBuffer("The following models might be required for generation\n" +
              "but aren't generated. Do you want to generate them?\n");
            for (SModelDescriptor sm : requirements) {
              message.append("\n").append(sm.getSModelReference().getSModelFqName());
            }

            if (IdeMain.getTestMode() != TestMode.CORE_TEST) {
              DialogWrapper questionDialog = new GenerateRequirementsDialog(project, settings, message.toString());
              questionDialog.show();
              result = questionDialog.getExitCode();
            }
          } else {
            result = 0; // Answer YES implicitly
          }

          // dialog cancelled
          if (result == 1) return false;
          // answer was "yes"
          if (result == 0) {
            generateModels(invocationContext, new ArrayList<SModelDescriptor>(requirements), getDefaultGenerationHandler(), rebuildAll, true);
          }
        }
      } finally {
        settings.setSaveTransientModels(wasSaveTransientModels);
      }
    }

    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        SModelRepository.getInstance().saveAll();
      }
    });

    showMessageView(project);
    IdeEventQueue.getInstance().flushQueue();

    final boolean[] result = new boolean[]{false};

    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
        public void run(@NotNull ProgressIndicator progress) {
          if (!saveTransientModels) {
            IGenerationTracer component = project.getComponent(IGenerationTracer.class);
            if (component != null) {
              component.discardTracing();
            }
          }

          IGenerationTracer tracer = saveTransientModels
            ? project.getComponent(IGenerationTracer.class)
            : null;

          if (tracer == null) {
            tracer = new NullGenerationTracer();
          }

          final boolean incremental = settings.isIncremental();
          final GenerationCacheContainer cache = incremental && settings.isIncrementalUseCache() ? GeneratorCacheComponent.getInstance().getCache() : null;
          IncrementalGenerationStrategy strategy = new IncrementalGenerationStrategy() {
            @Override
            public Map<String, String> getModelHashes(SModelDescriptor sm, IOperationContext operationContext) {
              // RE-3103
              CodeOrchestraGenerationContext sharedContext = CodeOrchestraGenerateManager.getSharedContext();
              if (sharedContext == null && !sm.isGeneratable()) {
                return null;
              }
              //if (!sm.isGeneratable()) return null;

              if (!(sm instanceof EditableSModelDescriptor)) {
                String hash = sm.getModelHash();
                return hash != null ? Collections.singletonMap(ModelDigestHelper.FILE, hash) : null;
              }
              EditableSModelDescriptor esm = (EditableSModelDescriptor) sm;

              IFile modelFile = esm.getModelFile();
              if (modelFile == null) return null;

              return ModelDigestHelper.getInstance().getGenerationHashes(modelFile, operationContext);
            }

            @Override
            public GenerationCacheContainer getContainer() {
              return cache;
            }

            @Override
            public GenerationDependencies getDependencies(SModelDescriptor sm) {
              return incremental ? GenerationDependenciesCache.getInstance().get(sm) : null;
            }

            @Override
            public boolean isIncrementalEnabled() {
              return incremental;
            }
          };

          GenerationOptions options = GenerationOptions.getDefaults()
            .saveTransientModels(saveTransientModels)
            .strictMode(settings.isStrictMode())
            .rebuildAll(rebuildAll)
            .incremental(strategy)
            .generateInParallel(settings.isParallelGenerator(), settings.getNumberOfParallelThreads())
            .tracing(settings.getPerformanceTracingLevel(), tracer)
            .reporting(settings.isShowInfo(), settings.isShowWarnings(), settings.isKeepModelsWithWarnings(), settings.getNumberOfModelsToKeep())
            .create();

          result[0] = GenerationFacade.generateModels(project, inputModels, invocationContext, generationHandler, progress, messages, options);
        }
      }, "Generation", true, invocationContext.getProject());

    return result[0];
  }

  private void showMessageView(Project project) {
    MessagesViewTool messagesView = project.getComponent(MessagesViewTool.class);
    if (messagesView != null) {
      messagesView.openToolLater(false);
    }
  }

  private boolean generateRequirements(GenerationSettings settings) {
    return false && settings.getGenerateRequirementsPolicy() != GenerationSettings.GenerateRequirementsPolicy.NEVER;
  }

  private Collection<SModelDescriptor> getModelsToGenerateBeforeGeneration(SModelDescriptor model, Project project) {
    IModule module = model.getModule();
    if (module == null) return Collections.emptyList();

    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();

    for (TemplateModule templateModule : GenerationPartitioningUtil.getTemplateModules(model.getSModel())) {
      Generator g = MPSModuleRepository.getInstance().getGenerator(templateModule.getReference());
      if (g == null) continue;

      for (SModelDescriptor sm : g.getOwnModelDescriptors()) {
        if (SModelStereotype.isUserModel(sm)) {
          result.add(sm);
        }
      }

      for (SModelDescriptor sm : g.getSourceLanguage().getAspectModelDescriptors()) {
        result.add(sm);
      }
    }

    return GenerationFacade.getModifiedModels(result, ProjectOperationContext.get(project));
  }
}
