package codeOrchestra.actionscript.modulemaker;

import codeOrchestra.actionScript.compiler.fcsh.FCSHException;
import codeOrchestra.actionScript.compiler.fcsh.FCSHFlexSDKRunner;
import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionScript.compiler.fcsh.FSCHCompilerKind;
import codeOrchestra.actionScript.compiler.fcsh.console.command.impl.LivecodingStartCommand;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.settings.LiveCodingSettings;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.make.ASModuleMakeTypeManager;
import codeOrchestra.actionscript.modulemaker.config.FlexConfig;
import codeOrchestra.actionscript.modulemaker.config.FlexConfigBuilder;
import codeOrchestra.actionscript.modulemaker.process.AbstractFlexSDKRunner;
import codeOrchestra.actionscript.modulemaker.process.COMPCRunner;
import codeOrchestra.actionscript.modulemaker.process.MXMLRunner;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.flex.FalconRunner;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import codeOrchestra.generator.CodeOrchestraGenerationUtil;
import codeOrchestra.generator.listener.BuildProvider;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.messages.FileWithLogicalPosition;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.FileSystem;

import java.io.File;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * ActionScript module maker utilizing Flex SDK compiler.
 *
 * @author Alexander Eliseyev
 */
public class ASModuleMaker {

  private static Logger LOG = Logger.getLogger(ASModuleMaker.class.getSimpleName());

  private CodeOrchestraGenerateManager codeOrchestraGenerateManager;

  public ASModuleMaker(Project project) {
    this.codeOrchestraGenerateManager = project.getComponent(CodeOrchestraGenerateManager.class);
  }

  public CompilationResult make(IModule module, Object progressObject, Project project) throws MakeException {
    assert module instanceof Solution;
    Solution solution = (Solution) module;

    // Report the progress
    String progressText = "Compiling " + module.toString() + " with Flex SDK";
    if (progressObject instanceof ITaskProgressHelper) {
      ITaskProgressHelper taskProgressHelper = (ITaskProgressHelper) progressObject;
      taskProgressHelper.startLeafTask("flexcompilation");
      taskProgressHelper.setText2(progressText);
    } else if (progressObject instanceof ProgressIndicator) {
      ProgressIndicator progressIndicator= (ProgressIndicator) progressObject;
      progressIndicator.setText2(progressText);
    }

    // Calculate dependencies
    Map<ModuleReference, Boolean> dependenciesMap = new HashMap<ModuleReference, Boolean>();
    SolutionUtils.fetchDependenciesWithExcludes(solution, dependenciesMap);

    // Live root module dependencies
    LiveCodingSession liveCodingSession = LiveCodingManager.instance().getCurrentSession();
    CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();
    if (liveCodingSession != null) {
      ModuleReference rootModuleReference = liveCodingSession.getRootModuleReference();
      IModule rootModule = MPSModuleRepository.getInstance().getModule(rootModuleReference);

      if (rootModule != null && rootModule instanceof Solution && currentContext != null && currentContext.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL) {
        SolutionUtils.fetchDependenciesWithExcludes((Solution) rootModule, dependenciesMap);
      }
    }

    CompilerSettings compilerSettings = solution.getModuleDescriptor().getCompilerSettings();

    // Make sure the solution doesn't get into self's dependencies because of a self reference
    if (dependenciesMap.containsKey(solution.getModuleReference())) {
      dependenciesMap.remove(solution.getModuleReference());
    }

    // Pop module make type
    ASModuleMakeTypeManager moduleMakeTypeManager = project.getComponent(ASModuleMakeTypeManager.class);
    ASModuleMakeType moduleMakeType = moduleMakeTypeManager.getModuleMakeType(solution.toString());

    // Flex config file
    FlexConfigBuilder configBuilder = new FlexConfigBuilder(solution, project);
    for (ModuleReference dependencyModuleRef : dependenciesMap.keySet()) {
      Solution dependencySolution = MPSModuleRepository.getInstance().getSolution(dependencyModuleRef);
      Boolean dependencyExclude = dependenciesMap.get(dependencyModuleRef);

      configBuilder.addDependency(dependencySolution, dependencyExclude);
    }

    FlexConfig flexConfig = configBuilder.build();

    // Module make type specific flex config preparations
    moduleMakeType.contributeFlexConfiguration(flexConfig);

    // Save the config
    String configFilePath = getConfigFilePath(solution);

    File configFile = new File(configFilePath);
    if (configFile.exists()) {
      // Skip file rewrite if the content is the same
      if (!flexConfig.isEqualToConfig(configFile)) {
        configFile = flexConfig.saveToFile(configFilePath);
        try {
          project.getComponent(FCSHManager.class).clear();
        } catch (FCSHException e) {
          LOG.warning("Error while cleaning fcsh compile targets", e);
        }
      }
    } else {
      configFile = flexConfig.saveToFile(configFilePath);
    }

    if (currentContext != null && currentContext.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL && !CodeOrchestraGenerationUtil.livecodingFCSH) {
      try {
        FCSHManager fcshManager = project.getComponent(FCSHManager.class);
        fcshManager.submitCommand(new LivecodingStartCommand());
      } catch (FCSHException e) {
        LOG.error("Unable to start livecoding mode in FCSH", e);
      }
      CodeOrchestraGenerationUtil.livecodingFCSH = true;
    }

    // Copy source file dir contents to the source_gen dir
    for (Solution dependency : configBuilder.getDependencies()) {
      if (!SolutionUtils.isStubSolution(dependency)) {
        prepareSources(dependency);
      }
    }
    prepareSources(solution);

    // Custom SDK config file
    if (compilerSettings.useCustomSDKConfiguration) {
      File customConfigFile = new File(compilerSettings.configurationFile);
      if (!customConfigFile.exists()) {
        throw new MakeException("Custom compile configuration file [" + compilerSettings.configurationFile + "] doesn't exist");
      }
    }

    // Delete the previous compile result
    File prevCompilationResult = new File(configBuilder.getOutputPath());
    if (prevCompilationResult.exists()) {
      prevCompilationResult.delete();
    }

    // Application / component compiler run
    OutputType outputType = codeOrchestraGenerateManager.getContextAwareOutputType(module);

    // Choose the right compiler & compile
    CompilerKind compilerKind;
    if (liveCodingSession == null) {
      compilerKind = FlexSDKSettings.getInstance().getCompilerKind();
    } else {
      compilerKind = LiveCodingSettings.getInstance().getCompilerKind();
    }

    // Get the flex SDK runner (compc, mxmlc, fcsh, etc)
    AbstractFlexSDKRunner flexSDKProcessRunner = getFlexSDKRunner(project, compilerSettings, moduleMakeType, configFile, outputType, compilerKind, solution);

    // Check the compilation result
    CompilationResult compilationResult = flexSDKProcessRunner.run();
    if (compilationResult.getErrors() > 0) {
      final String outputFile = flexSDKProcessRunner.getErrorLogFilePath();
      String errorMessage = String.format(
        "Compilation failed with (%d) error(s): %s",
        compilationResult.getErrors(),
        FileUtil.getRelativePath(new File(outputFile).getPath(), new File(project.getBaseDir().getPath()).getPath(), File.separator));
      FileWithLogicalPosition fileWithLogicalPosition = new FileWithLogicalPosition(FileSystem.getInstance().getFileByPath(outputFile), 0, 0);

      LOG.errorWithMarker(errorMessage, fileWithLogicalPosition, ASMessageMarker.MARKER);
    } else {
      LOG.infoWithMarker("Compilation is completed successfully", ASMessageMarker.MARKER);
    }

    return compilationResult;
  }

  private AbstractFlexSDKRunner getFlexSDKRunner(Project project,
                                                 CompilerSettings compilerSettings,
                                                 ASModuleMakeType moduleMakeType,
                                                 File configFile,
                                                 OutputType outputType,
                                                 CompilerKind compilerKind,
                                                 Solution solution) {
    if (outputType == OutputType.FLEX_LIBRARY) {
      switch (compilerKind) {
        case MXMCL_COMPC:
          return new COMPCRunner(configFile, compilerSettings, moduleMakeType);
        case FCSH:
          return new FCSHFlexSDKRunner(configFile, compilerSettings, moduleMakeType, FSCHCompilerKind.COMPC, project);
        case FALCON:
          return new FalconRunner(configFile, compilerSettings, moduleMakeType, solution, true);
      }
    } else if (outputType == OutputType.FLEX_APPLICATION) {
      switch (compilerKind) {
        case MXMCL_COMPC:
          return new MXMLRunner(configFile, compilerSettings, moduleMakeType);
        case FCSH:
          return new FCSHFlexSDKRunner(configFile, compilerSettings, moduleMakeType, FSCHCompilerKind.MXMLC, project);
        case FALCON:
          return new FalconRunner(configFile, compilerSettings, moduleMakeType, solution, false);
      }
    }
    throw new IllegalStateException("Unsupported output type: " + outputType);
  }

  private void prepareSources(Solution module) {
    // RF-1280
    String generatorOutputPath = module.getGeneratorOutputPath();
    if (generatorOutputPath == null) {
      return;
    }

    File sourceGenDir = new File(generatorOutputPath);

    // RF-688
    if (!sourceGenDir.exists()) {
      sourceGenDir.mkdirs();
    }

    for (String auxSourcePath : module.getModuleDescriptor().getSourcePaths()) {
      File auxSourceDir = new File(auxSourcePath);
      if (!auxSourceDir.exists() || !auxSourceDir.isDirectory()) {
        LOG.warning("Illegal aux sources dir path: " + auxSourcePath);
        continue;
      }

      FileUtil.copyDir(auxSourceDir, sourceGenDir);
    }
  }

  private String getConfigFilePath(Solution solution) {
    return solution.getClassesGen().getParent().getAbsolutePath()
      + File.separator
      + solution.getModuleDescriptor().getNamespace()
      + FlexConfig.CONFIG_FILE_POSTFIX;
  }

  public String getId() {
    return "FlexSDK Module Maker";
  }

  public boolean canBeCompiled(IModule module) {
    if (module instanceof Solution) {
      Solution solution = (Solution) module;

      // RE-1649
      // RE-2931
      if (codeOrchestraGenerateManager.getContextAwareOutputType(module) == OutputType.FLEX_APPLICATION && !hasMainClass(solution)) {
        return false;
      }

      return isApplicable(solution);
    }
    return false;
  }

  public boolean hasMainClass(IModule module) {
    if (module instanceof Solution) {
      Solution solution = (Solution) module;
      return solution.getModuleDescriptor().getCompilerSettings().mainClassNodeId != null;
    }
    return false;
  }

  public boolean isApplicable(IModule module) {
    if (module instanceof Solution) {
      Solution solution = (Solution) module;

      OutputType outputType = codeOrchestraGenerateManager.getContextAwareOutputType(solution);
      if (!EnumSet.of(OutputType.FLEX_APPLICATION, OutputType.FLEX_LIBRARY).contains(outputType)) {
        return false;
      }

      return SolutionUtils.isActionScriptDependent((Solution) module) && !SolutionUtils.isSWCSolution((Solution) module);
    }
    return false;
  }

  public CodeOrchestraGenerateManager getCodeOrchestraGenerateManager() {
    return codeOrchestraGenerateManager;
  }
}
