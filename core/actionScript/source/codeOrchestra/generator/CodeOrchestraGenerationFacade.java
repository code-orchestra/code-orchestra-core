package codeOrchestra.generator;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import codeOrchestra.actionScript.assets.AssetsSolution;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.environment.Environment;
import codeOrchestra.environment.EnvironmentLibrary;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.client.facade.RemoteGenerationUIFacade;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.generator.GenParameters;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
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
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JOptionPane;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraGenerationFacade {

  private static final Logger LOG = Logger.getLogger("CodeGenerator");

  private Project project;
  private boolean rebuildAll;
  private IModule rootModule;
  private IOperationContext operationContext;

  private IRemoteGenerationCallback remoteGenerationCallback;
  private BuildProvider buildProvider;

  private List<SModelDescriptor> modelsToCheck = new ArrayList<SModelDescriptor>();
  private List<SModelDescriptor> rawModels = new ArrayList<SModelDescriptor>();
  private List<SModelDescriptor> modelsToGenerate = new ArrayList<SModelDescriptor>();
  private List<SModelDescriptor> rootModelsToGenerate = new ArrayList<SModelDescriptor>();

  final Set<IModule> modulesToGenerate = new HashSet<IModule>();

  private CodeOrchestraGenerateManager codeOrchestraGenerateManager;
  private OutputType rootModuleOutputType;

  private boolean codeOrchestraModuleGeneration;
  private boolean codeOrchestraGenerateContextInitialized;

  private IOperationContext invocationContext;

  public CodeOrchestraGenerationFacade(final Project project, final boolean rebuildAll, final IModule rootModule) {
    this(project, rebuildAll, rootModule, null, BuildProvider.LOCAL);
  }

  public CodeOrchestraGenerationFacade(final Project project, final boolean rebuildAll, final IModule rootModule, BuildProvider buildProvider) {
    this(project, rebuildAll, rootModule, null, buildProvider);
  }

  public CodeOrchestraGenerationFacade(final Project project, final boolean rebuildAll, final IModule rootModule, @Nullable IRemoteGenerationCallback remoteGenerationCallback) {
    this(project, rebuildAll, rootModule, remoteGenerationCallback, BuildProvider.LOCAL);
  }

  public CodeOrchestraGenerationFacade(final Project project, final boolean rebuildAll, final IModule rootModule, @Nullable IRemoteGenerationCallback remoteGenerationCallback, BuildProvider buildProvider) {
    this.buildProvider = buildProvider;
    this.operationContext = new ModuleContext(rootModule, project);
    this.project = project;
    this.rebuildAll = rebuildAll;
    this.rootModule = rootModule;
    this.remoteGenerationCallback = remoteGenerationCallback;

    this.codeOrchestraGenerateManager = project.getComponent(CodeOrchestraGenerateManager.class);
    this.rootModuleOutputType = CodeOrchestraGenerateManager.getOwnOutputType(rootModule.getModuleReference());
    this.codeOrchestraGenerateContextInitialized = rootModule instanceof Solution && rootModuleOutputType != null && SolutionUtils.isActionScriptDependent((Solution) rootModule);

    this.modulesToGenerate.add(rootModule);
  }

  public boolean generate() {
    // Clean the root module first
    clear();

    // Generate on RGS
    if (!RGSParametersCLI.isInServerMode() && RGSClientSettings.getInstance().isUseRemoteGeneration()) {
      RemoteGenerationUIFacade remoteFacade = new RemoteGenerationUIFacade(project, rebuildAll, rootModule);
      remoteFacade.generateRemotely();
      return true;
    }

    try {
      fetchDependencies();

      prepareInvocationContext();

      prepareModelsToGenerateFromDependencies();
      prepareModelsToExcludeRootOnesAndStubs();
      prepareModelsToPlaceMainOneFirsAndCheckMainClass();

      checkIfNothingWouldBeGenerated();

    } catch (CodeOrchestraGenerationException e) {
      // TODO: implement
    }


    return false;
  }

  private void checkIfNothingWouldBeGenerated() {
    // TODO: implement
  }

  private void prepareModelsToPlaceMainOneFirsAndCheckMainClass() throws CodeOrchestraGenerationException {
    if (codeOrchestraModuleGeneration && rootModuleOutputType.mustHaveMainClass()) {
      final SNodePointer mainClassPointer = SolutionUtils.getMainClassPointer((Solution) rootModule);
      if (mainClassPointer == null) {
        BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);
        throw new CodeOrchestraGenerationException("Main class for the " + rootModule + " is not specified");
      }
      SNode mainClass = ModelAccess.instance().runReadAction(new Computable<SNode>() {
        @Override
        public SNode compute() {
          return mainClassPointer.getNode();
        }
      });
      if (mainClass == null) {
        BuildBroadcaster.getInstance().fireBuildEvent(rootModule.getModuleReference(), rootModuleOutputType, buildProvider, false);
        throw new CodeOrchestraGenerationException("Main class specified for the " + rootModule + " doesn't exist");
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
  }

  private void prepareModelsToExcludeRootOnesAndStubs() {
    // RF-856 - Extract the root module models to the separate collection to generate them the last
    // RE-3460 - Filter out stub models
    if (!codeOrchestraModuleGeneration) {
      return;
    }

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

    // Sort the models to generate by name
    Collections.sort(modelsToGenerate, new Comparator<SModelDescriptor>() {
      public int compare(SModelDescriptor o1, SModelDescriptor o2) {
        return o1.getLongName().compareTo(o2.getLongName());
      }
    });
  }

  private void prepareInvocationContext() {
    for (IModule module : modulesToGenerate) {
      if (module instanceof Generator) {
        module = ((Generator) module).getSourceLanguage();
        invocationContext = new ModuleChangingOperationContext(module, operationContext);
      }
    }
  }

  private void prepareModelsToGenerateFromDependencies() {
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

      List<SModelDescriptor> moduleModelsToGenerate = getModelsToGenerate(project, rebuildAll, module, codeOrchestraModuleGeneration, operationContext);
      modelsToGenerate.addAll(moduleModelsToGenerate);
      rawModels.addAll(getModelsToGenerate(project, true, module, codeOrchestraModuleGeneration, operationContext));

      if (module instanceof Solution) {
        modelsToCheck.addAll(moduleModelsToGenerate);
      }
    }
  }

  private void fetchDependencies() {
    // Fetch the dependencies and push the generation context if the root module is a Solution
    if (!codeOrchestraModuleGeneration) {
      return;
    }

    // Solution dependencies
    Set<Solution> dependencies = fetchDependantModules((Solution) rootModule);
    Set<Solution> environmentSpecificLibImpls = new HashSet<Solution>();
    for (Solution dependency : dependencies) {
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
    dependencies.addAll(environmentSpecificLibImpls);

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
    for (Solution dependency : dependencies) {
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

    // TODO: implement
  }

  private void clear() {
    // Clean the root module first
    if (rootModule instanceof Solution && rebuildAll) {
      ModelAccess.instance().runWriteAction(new Runnable() {
        @Override
        public void run() {
          IFile outputDir = FileSystem.getInstance().getFileByPath(rootModule.getGeneratorOutputPath());
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
  }


  public static
  @NotNull
  Set<Solution> fetchDependantModules(@NotNull Solution rootSolution) {
    Set<Solution> dependencies = new HashSet<Solution>();
    fetchDependencies(rootSolution, dependencies);
    return dependencies;
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

    ModelAccess.instance().runReadAction(new Runnable() {
      @Override
      public void run() {
        for (SModelDescriptor modelDescriptor : generatedModule.getOwnModelDescriptors()) {
          for (Language language : modelDescriptor.getModule().getDependenciesManager().getAllUsedLanguages()) {
            result.add(language.getModuleReference());
          }
        }
      }
    });

    return result;
  }

  private static void fetchDependencies(@NotNull Solution solution, @NotNull Set<Solution> result) {
    for (IModule dependencyModule : solution.getDependOnModules()) {
      if (dependencyModule instanceof Solution) {
        Solution dependencyCandidate = (Solution) dependencyModule;
        if (!result.contains(dependencyCandidate)) {
          result.add(dependencyCandidate);
          fetchDependencies(dependencyCandidate, result);
        }
      }
    }
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

}
