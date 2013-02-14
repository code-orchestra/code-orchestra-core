package codeOrchestra.generator;

import codeOrchestra.actionScript.compiler.fcsh.FCSHException;
import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import codeOrchestra.actionScript.assets.AssetsManager;
import codeOrchestra.actionScript.assets.AssetsSolution;
import codeOrchestra.actionScript.compiler.report.CompilerMessagesComponent;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.util.FileUtils;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.environment.Environment;
import codeOrchestra.environment.EnvironmentLibrary;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.generator.optimize.UsagesCollectorFacade;
import codeOrchestra.generator.optimize.UsedRoots;
import codeOrchestra.generator.report.GeneratedFileSize;
import codeOrchestra.generator.report.GeneratedFileSizeReporter;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.client.facade.RemoteGenerationUIFacade;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.generation.RGSGenerationHandler;
import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.rgs.state.generation.GenerationResult;
import jetbrains.mps.generator.GenParameters;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.ide.generator.GeneratorUIFacade;
import jetbrains.mps.ide.projectPane.ModuleChangingOperationContext;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.project.testconfigurations.BaseTestConfiguration;
import jetbrains.mps.project.structure.project.testconfigurations.IllegalGeneratorConfigurationException;
import jetbrains.mps.project.structure.project.testconfigurations.ModuleTestConfiguration;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.stubs.BaseStubModelDescriptor;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JOptionPane;
import java.io.File;
import java.io.FileFilter;
import java.rmi.RemoteException;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public final class CodeOrchestraGenerationUtil {

  private static final Logger LOG = Logger.getLogger("CodeGenerator");

  public static boolean livecodingFCSH;

  private CodeOrchestraGenerationUtil() {
  }

  @NotNull
  public static List<SModelDescriptor> getModelsToGenerate(final Project project, final boolean rebuildAll, final IModule module, boolean solutionIsGenerated, IOperationContext operationContext) {
    if (solutionIsGenerated) {
      List<SModelDescriptor> modelsToGenerate = new ArrayList<SModelDescriptor>(module.getOwnModelDescriptors());
      if (rebuildAll) {
        return modelsToGenerate;
      }

      Iterator<SModelDescriptor> modelsIterator = modelsToGenerate.iterator();
      while (modelsIterator.hasNext()) {
        SModelDescriptor modelDescriptor = modelsIterator.next();
        // Check if model is changed
        if (modelDescriptor instanceof EditableSModelDescriptor && ((EditableSModelDescriptor) modelDescriptor).isChanged()) {
          continue;
        }

        // Check if model is forced to be generated
        if (modelDescriptor.isGenerationRequired()) {
          continue;
        }

        if (!ModelGenerationStatusManager.getInstance().generationRequiredByHash(modelDescriptor, operationContext)) {
          modelsIterator.remove();
        }
      }

      return modelsToGenerate;
    } else {
      GenParameters params = ModelAccess.instance().runReadAction(new Computable<GenParameters>() {
        public GenParameters compute() {
          SModel tmp = new SModel(SModelReference.fromString("test.model"));
          tmp.setLoading(true);

          BaseTestConfiguration conf = null;

          if (module instanceof Solution) {
            ModuleTestConfiguration solutionConfig = new ModuleTestConfiguration();
            solutionConfig.setModuleRef(module.getModuleReference());
            solutionConfig.setName("tmp");
            conf = solutionConfig;
          }

          if (module instanceof Language) {
            ModuleTestConfiguration languageConfig = new ModuleTestConfiguration();
            languageConfig.setModuleRef(module.getModuleReference());
            languageConfig.setName("tmp");
            conf = languageConfig;
          }

          assert conf != null;

          try {
            return conf.getGenParams(project, rebuildAll);
          } catch (IllegalGeneratorConfigurationException e) {
            if (!RGSParametersCLI.isInServerMode()) {
              JOptionPane.showMessageDialog(WindowManager.getInstance().getFrame(project), e.getMessage());
            }

            return null;
          }
        }
      });

      if (params == null) return new ArrayList<SModelDescriptor>();
      return params.getModelDescriptors();
    }
  }

  private static @NotNull Map<Solution, Boolean> fetchDependantModules(@NotNull Solution rootSolution) {
    Map<Solution, Boolean> dependencies = new HashMap<Solution, Boolean>();
    SolutionUtils.fetchDependencies(rootSolution, dependencies);
    return dependencies;
  }

  private static void clear(final Solution solution) {
    ModelAccess.instance().runWriteAction(new Runnable() {
      @Override
      public void run() {
        IFile outputDir = FileSystem.getInstance().getFileByPath(solution.getGeneratorOutputPath());
        if (outputDir.exists()) {
          outputDir.delete();
          FileSystem.getInstance().refresh(outputDir);
        }

        IFile cachesDir = FileGenerationUtil.getCachesDir(outputDir);
        if (cachesDir.exists()) {
          cachesDir.delete();
          FileSystem.getInstance().refresh(cachesDir);
        }
      }
    });
  }

  public static boolean generateModuleWithDependencies(@Nullable IOperationContext operationContext, final Project project, final boolean rebuildAll, final IModule rootModule, @Nullable IRemoteGenerationCallback remoteGenerationCallback) {
    return generateModuleWithDependencies(operationContext, project, rebuildAll, rootModule, remoteGenerationCallback, BuildProvider.LOCAL);
  }

  public static boolean generateModuleWithDependencies(@Nullable IOperationContext operationContext, final Project project, boolean rebuildAll, final IModule rootModule, @Nullable IRemoteGenerationCallback remoteGenerationCallback, BuildProvider buildProvider) {
    OutputType rootModuleOutputType = CodeOrchestraGenerateManager.getOwnOutputType(rootModule.getModuleReference());
    boolean codeOrchestraModuleGeneration = rootModule instanceof Solution && rootModuleOutputType != null && SolutionUtils.isActionScriptDependent((Solution) rootModule);

    if (codeOrchestraModuleGeneration) {
      CompilerKind currentCompiler = FlexSDKSettings.getInstance().getCompilerKind();
      CompilerSettings compilerSettings = ((Solution) rootModule).getModuleDescriptor().getCompilerSettings();

      if ((compilerSettings.previousCompiler == null && currentCompiler == CompilerKind.FALCON) ||
        (compilerSettings.previousCompiler != null && compilerSettings.previousCompiler != currentCompiler)) {
        rebuildAll = true;
      }

      compilerSettings.previousCompiler = currentCompiler;
    }

    // Clean the root module first
    if (rootModule instanceof Solution && rebuildAll) {
      clear((Solution) rootModule);
    }

    CodeOrchestraGenerateManager codeOrchestraGenerateManager = project.getComponent(CodeOrchestraGenerateManager.class);
    boolean codeOrchestraGenerateContextInitialized = false;
    CodeOrchestraGenerationContext codeOrchestraGenerationContext = null;
    Map<Solution, Boolean> dependencies = null;

    // Generate on RGS
    if (codeOrchestraModuleGeneration && !RGSParametersCLI.isInServerMode() && RGSClientSettings.getInstance().isUseRemoteGeneration()) {
      RemoteGenerationUIFacade remoteFacade = new RemoteGenerationUIFacade(project, rebuildAll, rootModule, buildProvider);
      remoteFacade.generateRemotely();
      return true;
    }

    if (buildProvider == BuildProvider.LIVE_CODING_INCREMENTAL && !livecodingFCSH) {
      try {
        FCSHManager fcshManager = project.getComponent(FCSHManager.class);
        fcshManager.setLivecodingMode(true);
        fcshManager.restart();
      } catch (FCSHException e) {
        LOG.error("Unable to start livecoding mode in FCSH", e);
      }
    } else if (buildProvider != BuildProvider.LIVE_CODING_INCREMENTAL && livecodingFCSH) {
      try {
        FCSHManager fcshManager = project.getComponent(FCSHManager.class);
        fcshManager.setLivecodingMode(false);
        fcshManager.restart();
      } catch (FCSHException e) {
        LOG.error("Unable to stop livecoding mode in FCSH", e);
      }
      livecodingFCSH = false;
    }

    boolean generationOK = false;
    try {
      if (operationContext == null) {
        operationContext = new ModuleContext(rootModule, project); // Bad practice, I know
      }

      final List<SModelDescriptor> modelsToCheck = new ArrayList<SModelDescriptor>();
      final List<SModelDescriptor> rawModels = new ArrayList<SModelDescriptor>();
      final List<SModelDescriptor> modelsToGenerate = new ArrayList<SModelDescriptor>();
      final List<SModelDescriptor> rootModelsToGenerate = new ArrayList<SModelDescriptor>();

      // Union of the current root module & and its dependencies
      final Set<IModule> modulesToGenerate = new HashSet<IModule>();
      modulesToGenerate.add(rootModule);

      // Fetch the dependencies and push the generation context if the root module is a Solution
      if (codeOrchestraModuleGeneration) {
        // Solution dependencies
        dependencies = fetchDependantModules((Solution) rootModule);
        Set<Solution> environmentSpecificLibImpls = new HashSet<Solution>();
        for (Solution dependency : dependencies.keySet()) {
          if (SolutionUtils.isStubSolution(dependency)) {
            // Check if we have environment-specific implementations for the stub solution
            EnvironmentLibraryManager environmentLibraryManager = project.getComponent(EnvironmentLibraryManager.class);
            List<EnvironmentLibrary> environmentLibraries = environmentLibraryManager.getEnvironmentLibraries(dependency, Environment.byOutputType(rootModuleOutputType));
            for (EnvironmentLibrary environmentLibrary : environmentLibraries) {
              IModule environmentSpecificImpl = MPSModuleRepository.getInstance().getModule(environmentLibrary.getImplementationReference());
              if (environmentSpecificImpl == null) {
                LOG.warningWithMarker("Can't find an Environment-Specific implementation of " + environmentLibrary.getLibraryReference() + ": " + environmentLibrary.getImplementationReference().getModuleFqName(),
                  null, ASMessageMarker.MARKER);
                continue;
              }

              modulesToGenerate.add(environmentSpecificImpl);
              environmentSpecificLibImpls.add((Solution) environmentSpecificImpl);
            }
            continue;
          }
          if (dependency instanceof AssetsSolution) {
            continue;
          }

          modulesToGenerate.add(dependency);
        }
        for (Solution environmentSpecificLibImpl : environmentSpecificLibImpls) {
          dependencies.put(environmentSpecificLibImpl, false);
        }


        // RE-3103 - Language dependencies + force adding accessory models to modelsToGenerate right here
        Set<ModuleReference> usedLanguages = new HashSet<ModuleReference>();
        Set<Language> accessoryLanguages = new HashSet<Language>();
        Set<SModelDescriptor> allAccessoryModels = new HashSet<SModelDescriptor>();

        // Add the language accessories models to the generation
        if (EnumSet.of(OutputType.FLEX_APPLICATION, OutputType.FLEX_LIBRARY, OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY).contains(rootModuleOutputType)) {
          for (IModule generatedModule : modulesToGenerate) {
            usedLanguages.addAll(getLanguagesDependencies(generatedModule));
          }
          for (ModuleReference usedLanguage : usedLanguages) {
            Language language = MPSModuleRepository.getInstance().getLanguage(usedLanguage);
            if (language != null) {
              List<SModelDescriptor> accessoryModels = language.getAccessoryModels();

              if (!accessoryModels.isEmpty()) {
                allAccessoryModels.addAll(accessoryModels);
                accessoryLanguages.add(language);
              }
            }
          }
        }

        // Push a CodeOrchestra generation context
        ModuleReference[] dependenciesRefs = new ModuleReference[dependencies.size() + accessoryLanguages.size()];
        int i = 0;
        for (Solution dependency : dependencies.keySet()) {
          dependenciesRefs[i++] = dependency.getModuleReference();
        }
        for (Language accessoryLanguage : accessoryLanguages) {
          dependenciesRefs[i++] = accessoryLanguage.getModuleReference();
        }
        codeOrchestraGenerateManager.pushContext(rootModule.getModuleReference(), buildProvider, dependenciesRefs);
        codeOrchestraGenerateContextInitialized = true;

        // Accessory models
        if (rebuildAll) {
          // All the accessories
          modelsToGenerate.addAll(allAccessoryModels);
        } else {
          // Filter the already generated ones accessory models
          for (SModelDescriptor accessoryModel : allAccessoryModels) {
            if (ModelGenerationStatusManager.getInstance().generationRequiredByHash(accessoryModel, operationContext)) {
              modelsToGenerate.add(accessoryModel);
            }
          }
        }
        rawModels.addAll(allAccessoryModels);

        // RE-3542
        for (SModelDescriptor accessoryModelDescriptor : allAccessoryModels) {
          codeOrchestraGenerateManager.getCurrentContext().addAccessoryModel(accessoryModelDescriptor.getSModelReference());
        }

        // CO-4880
        for (Solution dependencySolution : dependencies.keySet()) {
          Boolean excluded = dependencies.get(dependencySolution);
          if (excluded != null && excluded) {
            codeOrchestraGenerateManager.getCurrentContext().addExcludedSolution(dependencySolution);
          }
        }
      }

      IOperationContext invocationContext = operationContext;
      for (IModule module : modulesToGenerate) {
        // RE-3438 - packaged solution modules
        if (module instanceof Solution && module.isPackaged()) {
          List<SModelDescriptor> packagedModelDescriptors = module.getOwnModelDescriptors();
          if (rebuildAll) {
            modelsToGenerate.addAll(packagedModelDescriptors);
          } else {
            for (SModelDescriptor packagedModelDescriptor : packagedModelDescriptors) {
              if (ModelGenerationStatusManager.getInstance().generationRequiredByHash(packagedModelDescriptor, operationContext)) {
                modelsToGenerate.add(packagedModelDescriptor);
              }
            }
          }
          rawModels.addAll(packagedModelDescriptors);
          continue;
        }

        if (module instanceof Generator) {
          module = ((Generator) module).getSourceLanguage();
          invocationContext = new ModuleChangingOperationContext(module, operationContext);
        }

        List<SModelDescriptor> moduleModelsToGenerate = getModelsToGenerate(project, rebuildAll, module, codeOrchestraModuleGeneration, operationContext);
        modelsToGenerate.addAll(moduleModelsToGenerate);
        rawModels.addAll(getModelsToGenerate(project, true, module, codeOrchestraModuleGeneration, operationContext));

        if (module instanceof Solution) {
          modelsToCheck.addAll(moduleModelsToGenerate);
        }
      }

      // Sort the models to generate (excluding the root ones) by name
      Collections.sort(modelsToGenerate, new Comparator<SModelDescriptor>() {
        public int compare(SModelDescriptor o1, SModelDescriptor o2) {
          return o1.getLongName().compareTo(o2.getLongName());
        }
      });

      // RF-856 - Extract the root module models to the separate collection to generate them the last
      // RE-3460 - Filter out stub models
      if (codeOrchestraModuleGeneration) {
        for (Iterator<SModelDescriptor> iterator = modelsToGenerate.iterator(); iterator.hasNext(); ) {
          SModelDescriptor modelDescriptor = iterator.next();

          if (modelDescriptor instanceof BaseStubModelDescriptor) {
            iterator.remove();
            continue;
          }

          if (modelDescriptor instanceof DefaultSModelDescriptor && ((DefaultSModelDescriptor) modelDescriptor).isDoNotGenerate()) {
            iterator.remove();
            continue;
          }

          if (rootModule.getOwnModelDescriptors().contains(modelDescriptor)) {
            iterator.remove();
            rootModelsToGenerate.add(modelDescriptor);
          }
        }
      }

      // RF-936 - Check if the main class is present
      // Sort the models to generate the main model first. Then add the main models to the dependency ones
      if (codeOrchestraModuleGeneration && rootModuleOutputType.mustHaveMainClass()) {
        final SNodePointer mainClassPointer = SolutionUtils.getMainClassPointer((Solution) rootModule);
        if (mainClassPointer == null) {
          reportError("Main class for the " + rootModule + " is not specified");
          BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);
          return false;
        }
        SNode mainClass = ModelAccess.instance().runReadAction(new Computable<SNode>() {
          @Override
          public SNode compute() {
            return mainClassPointer.getNode();
          }
        });
        if (mainClass == null) {
          reportError("Main class specified for the " + rootModule + " doesn't exist");
          BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);
          return false;
        }

        final SModelReference mainModelReference = mainClassPointer.getModelReference();
        if (mainModelReference != null) {
          Collections.sort(rootModelsToGenerate, new Comparator<SModelDescriptor>() {
            @Override
            public int compare(SModelDescriptor modelDescriptor1, SModelDescriptor modelDescriptor2) {
              if (modelDescriptor1.getSModelReference().equals(mainModelReference)) {
                return -1;
              }
              if (modelDescriptor2.getSModelReference().equals(mainModelReference)) {
                return 1;
              }
              return 0;
            }
          });
        }
      }
      modelsToGenerate.addAll(rootModelsToGenerate);
      rawModels.addAll(rootModule.getOwnModelDescriptors());

      if (codeOrchestraModuleGeneration) {
        codeOrchestraGenerationContext = codeOrchestraGenerateManager.getCurrentContext();
      }

      // Generation optimization - the actually used roots pointers must be populated here
      if (codeOrchestraModuleGeneration && buildProvider != BuildProvider.LIVE_CODING_INCREMENTAL) {
        final CodeOrchestraGenerationContext finalCodeOrchestraGenerationContext = codeOrchestraGenerationContext;

        ProgressManager.getInstance().run(new Task.Modal(project, "Calculating dependencies", false) {
          @Override
          public void run(final @NotNull ProgressIndicator indicator) {
            indicator.pushState();
            indicator.setIndeterminate(true);
            indicator.setText("Building the dependencies graph");

            ModelAccess.instance().runReadAction(new Runnable() {
              @Override
              public void run () {
                List<SNodePointer> rootClasses = SolutionUtils.getRootClassesPointers(rootModule);

                UsagesCollectorFacade usagesCollector = new UsagesCollectorFacade(project, finalCodeOrchestraGenerationContext, rootClasses, rawModels, indicator);
                usagesCollector.walk();
              }
            });
          }
        });

        // Filter out the models to generate based on the model usages
        Iterator<SModelDescriptor> modelsToGenerateIterator = modelsToGenerate.iterator();
        while(modelsToGenerateIterator.hasNext())

        {
          SModelDescriptor modelToGenerate = modelsToGenerateIterator.next();
          if (!codeOrchestraGenerationContext.isModelUsed(modelToGenerate.getSModelReference())) {
            modelsToGenerateIterator.remove();
          }
        }

        List<SModelReference> modelsWithNewRoots = codeOrchestraGenerationContext.getUsedRootsRegistry().getModelsWithNewRootsSince(UsedRoots.fromModule(rootModule));
        for(
          SModelReference modelWithNewRootsReference
          :modelsWithNewRoots)

        {
          SModelDescriptor modelWithNewRootsDescriptor = SModelRepository.getInstance().getModelDescriptor(modelWithNewRootsReference);
          if (modelWithNewRootsDescriptor != null) {
            modelsToGenerate.add(modelWithNewRootsDescriptor);
          }
        }
      }

      final List<SModelDescriptor> filteredModelsToGenerate = new ArrayList<SModelDescriptor>(new LinkedHashSet<SModelDescriptor>(modelsToGenerate));

      // CO-4880 - filter out the excluded models
      if (dependencies != null && rootModuleOutputType != null && rootModuleOutputType.isHTML5()) {
        Iterator<SModelDescriptor> modelsToGenerateIterator = filteredModelsToGenerate.iterator();
        while (modelsToGenerateIterator.hasNext()) {
          SModelDescriptor modelDescriptor = modelsToGenerateIterator.next();
          IModule module = modelDescriptor.getModule();

          if (module != null && module instanceof Solution) {
            Boolean excluded = dependencies.get(module);
            if (excluded != null && excluded) {
              modelsToGenerateIterator.remove();
            }
          }
        }
      }

      // Nothing to generate
      if (filteredModelsToGenerate.isEmpty()) {
        // TODO: RGS!

        if (!RGSParametersCLI.isInServerMode()) {
          WindowManager.getInstance().getIdeFrame(project).getStatusBar().setInfo("Nothing to generate");
        }

        BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);
        return true;
      }

      // Check models
      final IGenerationHandler generationHandler = remoteGenerationCallback == null
        ? GeneratorUIFacade.getInstance().getDefaultGenerationHandler(project)
        : new RGSGenerationHandler(project, remoteGenerationCallback);

      // RE-3852 - Copy assets to module source_gen/assets dir
      if (codeOrchestraModuleGeneration && buildProvider != BuildProvider.LIVE_CODING_INCREMENTAL) {
        File sourceGenAssetsDir = new File(rootModule.getGeneratorOutputPath(), AssetsManager.DEFAULT_ASSETS_DIR);
        File projectAssetsDir = project.getComponent(AssetsManager.class).createOrGetProjectAssetsDir();
        if (projectAssetsDir.exists() && projectAssetsDir.isDirectory()) {
          copyAssets(projectAssetsDir, sourceGenAssetsDir, codeOrchestraGenerationContext);
        }
      }

      // CO-5044 - Check if the rebuild is required based on the last generation settings
      rebuildAll |= BuildReport.isSufficientlyDifferentFrom(codeOrchestraGenerationContext);

      // The actual generation
      long generationStart = System.currentTimeMillis();
      try {
        generationOK = GeneratorUIFacade.getInstance().generateModels(
          invocationContext,
          filteredModelsToGenerate,
          generationHandler,
          rebuildAll, false);
      } finally {
        if (codeOrchestraGenerateContextInitialized) {
          codeOrchestraGenerateManager.popContext();
        }
      }
      long generationTook = System.currentTimeMillis() - generationStart;

      // Report the generated solution size
      if (generationOK && codeOrchestraGenerationContext != null) {
        GeneratedFileSizeReporter reporter = new GeneratedFileSizeReporter(codeOrchestraGenerationContext);
        GeneratedFileSize report = reporter.report();

        if (report != null) {
          String message = "Generation completed successfully in " + generationTook + " ms (file size: " + report.getUncompressedSizeKB() + "kb, gziped: " + report.getCompressedSizeKB() + "kb)";
          Logger.getLogger("astojs").infoWithMarker(message, ASMessageMarker.MARKER);
        }
      }

      // Report compilation errors
      if (!RGSParametersCLI.isInServerMode() && codeOrchestraGenerationContext != null && codeOrchestraGenerationContext.getCompilationResult() != null) {
        CompilerMessagesComponent.instance().invalidate();
        for (CompilerMessage compilerMessage : codeOrchestraGenerationContext.getCompilationResult().getMessages()) {
          CompilerMessagesComponent.instance().addMessage(compilerMessage);
        }
      }

      if (generationOK && codeOrchestraModuleGeneration && codeOrchestraGenerationContext != null) {
        codeOrchestraGenerationContext.getUsedRootsRegistry().write(rootModule);
      }

    } catch (Throwable t) {
      BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);

      if (t instanceof RuntimeException) {
        throw (RuntimeException) t;
      }

      return false;
    }

    if (codeOrchestraModuleGeneration && codeOrchestraGenerationContext != null) {
      BuildBroadcaster.getInstance().fireBuildEvent(codeOrchestraGenerationContext, generationOK, buildProvider);

      // CO-5044
      BuildReport.memorize(codeOrchestraGenerationContext);
    }

    // Report the remote generation result
    if (RGSParametersCLI.isInServerMode() && remoteGenerationCallback != null) {
      try {
        GenerationResult generationResult = new GenerationResult(generationOK);
        if (codeOrchestraGenerationContext != null) {
          generationResult.setCompilationResult(codeOrchestraGenerationContext.getCompilationResult());
        }

        remoteGenerationCallback.onFinish(generationResult);
      } catch (RemoteException e) {
        throw new RuntimeException("Can't report the generation result", e);
      }
    }

    return generationOK;
  }

  public static boolean generateModuleWithDependencies(@Nullable IOperationContext operationContext, final Project project, final boolean rebuildAll, final IModule rootModule) {
    return generateModuleWithDependencies(operationContext, project, rebuildAll, rootModule, null);
  }

  private static void copyAssets(File projectAssetsDir, File sourceGenAssetsDir, CodeOrchestraGenerationContext codeOrchestraGenerationContext) {
    if (!sourceGenAssetsDir.exists()) {
      sourceGenAssetsDir.mkdirs();
    }

    FileUtil.copyDir(projectAssetsDir, sourceGenAssetsDir, false);

    if (codeOrchestraGenerationContext != null) {
      List<File> assetFiles = FileUtils.listFileRecursively(projectAssetsDir, new FileFilter() {
        @Override
        public boolean accept(File file) {
          return file.isFile();
        }
      });
      for (File assetFile : assetFiles) {
        try {
          String relativePath = org.apache.tools.ant.util.FileUtils.getRelativePath(projectAssetsDir, assetFile);
          if (relativePath != null) {
            codeOrchestraGenerationContext.addAssetRelativePath(relativePath);
          }
        } catch (Exception e) {
          LOG.error("Error while copying project assets", e);
        }
      }
    }
  }

  private static void reportError(String message) {
    if (!RGSParametersCLI.isInServerMode()) {
      JOptionPane.showMessageDialog(null, message, "Code Generation", JOptionPane.ERROR_MESSAGE);
    }

    LOG.errorWithMarker(message, ASMessageMarker.MARKER);
  }

  private static Set<ModuleReference> getLanguagesDependencies(final IModule generatedModule) {
    final Set<ModuleReference> result = new HashSet<ModuleReference>();

    // RE-4273
    if (LiveCodingManager.instance().nextGenerationMustBeLive()) {
      Language liveCodingLanguage = MPSModuleRepository.getInstance().getLanguage(Languages.LIVE_CODING);
      if (liveCodingLanguage != null) {
        result.add(liveCodingLanguage.getModuleReference());
      }
    }

    final Set<Language> allUsedLanguages = new HashSet<Language>();
    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        // Initial dependencies
        for (ModuleReference moduleReference : result) {
          collectAllUsedLanguages(allUsedLanguages, MPSModuleRepository.getInstance().getLanguage(moduleReference));
        }
        // Tree dependencies
        for (Language usedLanguage : generatedModule.getDependenciesManager().getAllUsedLanguages()) {
          collectAllUsedLanguages(allUsedLanguages, usedLanguage);
        }
      }
    });
    for (Language usedLanguage : allUsedLanguages) {
      result.add(usedLanguage.getModuleReference());
    }

    return result;
  }

  private static void collectAllUsedLanguages(Set<Language> languages, Language currentLanguage) {
    if (languages.contains(currentLanguage)) {
      return;
    }
    if (!Languages.isCodeOrchestraLanguage(currentLanguage)) {
      return;
    }

    languages.add(currentLanguage);

    for (Language usedLanguage : currentLanguage.getDependenciesManager().getAllUsedLanguages()) {
      collectAllUsedLanguages(languages, usedLanguage);
    }
  }

}
