package codeOrchestra.actionscript.modulemaker.config;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.assets.AssetsSolution;
import codeOrchestra.actionScript.flexsdk.FlexSDKLib;
import codeOrchestra.actionScript.flexsdk.FlexSDKLibsManager;
import codeOrchestra.actionScript.flexsdk.FlexSDKNotPresentException;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.modulemaker.LanguageUtils;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.modulemaker.config.FlexConfig.FileWrapper;
import codeOrchestra.actionscript.modulemaker.config.linkreport.LinkReport;
import codeOrchestra.actionscript.modulemaker.config.linkreport.LinkReportBuilder;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.util.JarSWCHelper;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import codeOrchestra.generator.listener.BuildProvider;
import jetbrains.mps.findUsages.FindUsagesManager;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.dependency.DependenciesManager;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.NameUtil;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Flex compiler configuration builder.
 *
 * @author Alexander Eliseyev
 */
public class FlexConfigBuilder {

  private static final Set<String> builtInMetadata;

  static {
    builtInMetadata = new HashSet<String>();
    builtInMetadata.add("ArrayElementType");
    builtInMetadata.add("Bindable");
    builtInMetadata.add("DefaultProperty");
    builtInMetadata.add("Deprecated");
    builtInMetadata.add("Effect");
    builtInMetadata.add("Embed");
    builtInMetadata.add("Event");
    builtInMetadata.add("Exclude");
    builtInMetadata.add("ExcludeClass");
    builtInMetadata.add("IconFile");
    builtInMetadata.add("Inspectable");
    builtInMetadata.add("InstanceType");
    builtInMetadata.add("NonCommittingChangeEvent");
    builtInMetadata.add("RemoteClass");
    builtInMetadata.add("Style");
    builtInMetadata.add("Transient");
    builtInMetadata.add("SWF");
  }

  private static final String ANNOTATION_INSTANCE_CONCEPT = "codeOrchestra.actionScript.structure.AnnotationInstance";
  private static final String PLAYERGLOBAL_SWC_MODULE = "playerglobal_swc";

  public static final boolean DEFAULT_LIBRARY_APPEND = true;

  private Project project;
  private Solution compiledModule;
  private boolean omitPlayerGlobalDependency;

  private List<Solution> dependencies = new ArrayList<Solution>();
  private List<Solution> excludedDependencies = new ArrayList<Solution>();

  public FlexConfigBuilder(Solution compiledModule, Project project) {
    assert compiledModule != null;

    this.compiledModule = compiledModule;
    this.project = project;
    this.omitPlayerGlobalDependency = compiledModule.getModuleDescriptor().getCompilerSettings().useDefaultSDKConfiguration;

    initRuntimeDependencies();
  }

  private void initRuntimeDependencies() {
    for (ModuleReference langReference : compiledModule.getUsedLanguagesReferences()) {
      Language language = MPSModuleRepository.getInstance().getLanguage(langReference);

      for (ModuleReference runtimeDependencyModuleRef : language.getRuntimeModulesReferences()) {
        IModule dependencyModule = MPSModuleRepository.getInstance().getModule(runtimeDependencyModuleRef);

        if (dependencyModule != null
          && dependencyModule instanceof Solution
          && SolutionUtils.isSWCSolution((Solution) dependencyModule)) {
          addDependency((Solution) dependencyModule);
        }
      }
    }
  }

  public List<Solution> getDependencies() {
    return dependencies;
  }

  public void addDependency(Solution solution) {
    addDependency(solution, false);
  }

  public void addDependency(Solution solution, boolean exclude) {
    if (exclude && !excludedDependencies.contains(solution)) {
      excludedDependencies.add(solution);
    }

    if (solution == null || solution instanceof AssetsSolution) {
      return;
    }

    if (dependencies.contains(solution)) {
      return;
    }

    // Don't add the playerglobal.swc dependency if the default Flex SDK configuration is used 
    if (omitPlayerGlobalDependency && PLAYERGLOBAL_SWC_MODULE.equals(solution.getModuleDescriptor().getNamespace())) {
      return;
    }

    dependencies.add(solution);
  }

  public FlexConfig build() throws MakeException {
    CodeOrchestraGenerateManager codeOrchestraGenerateManager = this.project.getComponent(CodeOrchestraGenerateManager.class);

    CompilerSettings compilerSettings = compiledModule.getModuleDescriptor().getCompilerSettings();
    OutputType outputType = project.getComponent(CodeOrchestraGenerateManager.class).getContextAwareOutputType(compiledModule);
    FlexConfig flexConfig = new FlexConfig(outputType == OutputType.FLEX_LIBRARY, compilerSettings.includeResources);

    // Source path    
    flexConfig.addSourcePath(compiledModule.getGeneratorOutputPath());

    // RE-4273
    boolean liveIncrementalGeneration = false;
    LiveCodingSession liveCodingSession = LiveCodingManager.instance().getCurrentSession();
    if (liveCodingSession != null) {
      ModuleReference rootModuleReference = liveCodingSession.getRootModuleReference();
      IModule rootModule = MPSModuleRepository.getInstance().getModule(rootModuleReference);
      CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();

      liveIncrementalGeneration = rootModule != null && currentContext != null && currentContext.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL;

      // Live incremental generation
      if (liveIncrementalGeneration) {
        // Add root module generated sources
//        flexConfig.addSourcePath(rootModule.getGeneratorOutputPath());
        String outputFileName = ((Solution) rootModule).getModuleDescriptor().getCompilerSettings().outputFileName.replaceFirst("\\.swf$", ".swc");
        String outputPath = rootModule.getGeneratorOutputPath().replaceFirst("source_gen$", "output_swf");
        flexConfig.addLibraryPath(outputPath + "/" + outputFileName);  // TODO: hack!

        // Load root module link report file for externs for Live-Coding incremental module
        flexConfig.setLoadExternsFilePath(getLinkReportFilePath(MPSModuleRepository.getInstance().getModule(liveCodingSession.getRootModuleReference())));

        // RE-4487
        flexConfig.setStrict(false);
        flexConfig.setVerifyDigests(false);
        flexConfig.setWarnings(false);
        flexConfig.setIncremental(true);

        // RE-4449
        // flexConfig.setStrict(false);
        // flexConfig.setIncludeInheritanceDependenciesOnly(true);
      }
    }

    // Link-report for Live-Coding root module
    if (LiveCodingManager.instance().nextGenerationMustBeLive()) {
      flexConfig.setLinkReportFilePath(getLinkReportFilePath(compiledModule));
    }

    // Output path
    flexConfig.setOutputPath(getOutputPath());

    // Dependencies paths
    for (Solution dependencySolution : dependencies) {
      if (excludedDependencies.contains(dependencySolution)) {
        continue;
      }

      if (SolutionUtils.isSWCSolution(dependencySolution)) {
        String swcPath = getSWCPath(dependencySolution);
        if (swcPath != null) {
          flexConfig.addLibraryPath(swcPath);
        }
      } else if (SolutionUtils.isASStubSolution(dependencySolution)) {
        String sourcesPath = SolutionUtils.getLibrarySourcesPath(dependencySolution);
        flexConfig.addSourcePath(sourcesPath);
      }
    }

    // Main class
    if (outputType == OutputType.FLEX_APPLICATION) {
      String mainClassPath = null;

      CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();
      if (currentContext != null) {
        String overridingMainClassFqName = currentContext.getOverridingMainClassFqName();
        if (overridingMainClassFqName != null) {
          mainClassPath = getMainClassPath(overridingMainClassFqName, currentContext.getOverridingMainClassFileExtension());
        }
      }

      if (mainClassPath == null) {
        mainClassPath = getMainClassPath();
      }

      flexConfig.addFileSpecPathElement(mainClassPath);
    }

    // Player version
    // RE-4356
    if (liveIncrementalGeneration) {
      Solution baseLiveModule = MPSModuleRepository.getInstance().getSolution(liveCodingSession.getRootModuleReference());
      flexConfig.setTargetPlayerVersion(baseLiveModule.getModuleDescriptor().getCompilerSettings().playerVersion);
    } else {
      flexConfig.setTargetPlayerVersion(compilerSettings.playerVersion);
    }

    // Include classes (SWC)
    if (outputType == OutputType.FLEX_LIBRARY) {
      addClassesToLibrary(compilerSettings, flexConfig);
    }

    // RSL
    flexConfig.setRuntimeSharedLibrary(compilerSettings.useFrameworkAsRSL);

    // Locale
    if (compilerSettings.nonDefaultLocale) {
      flexConfig.setLocale(compilerSettings.localeOptions);
    }

    // Include resources
    if (compilerSettings.includeResources) {
      // Source dir resources
      String modulePath = compiledModule.getDescriptorFile().getParent().getAbsolutePath();
      List<FileWrapper> resources = ResourceHelper.getResources(modulePath);
      for (FileWrapper resourceFile : resources) {
        flexConfig.addIncludedFile(resourceFile.getFilePath(), resourceFile.getRelativePath());
      }
    }

    // Custom metadata
    if (liveIncrementalGeneration) {
      for (String customMetadata : LiveCodingManager.instance().getCustomMetadataSet()) {
        flexConfig.addCustomMetadata(customMetadata);
      }
    } else {
      Set<String> customMetadata = new HashSet<String>();
      Set<Solution> solutionsToSearch = new HashSet<Solution>(dependencies);
      solutionsToSearch.add(compiledModule);
      for (Solution solutionToSearchAnnotations : solutionsToSearch) {
        IScope scope = solutionToSearchAnnotations.getScope();
        List<SNode> annotationInstances = FindUsagesManager.getInstance().
          findInstances(SConceptOperations.findConceptDeclaration(ANNOTATION_INSTANCE_CONCEPT), scope);
        for (SNode annotationInst : annotationInstances) {
          SNode annotationDeclaration = SLinkOperations.getTarget(annotationInst, "annotation", false);
          if (annotationDeclaration != null) {
            String customMetadataName = annotationDeclaration.getName();
            // Skip built-in metadata tags
            if (!builtInMetadata.contains(customMetadataName)) {
              customMetadata.add(customMetadataName);
            }
          }
        }
      }
      for (String customMetadataName : customMetadata) {
        if (LiveCodingManager.instance().nextGenerationMustBeLive()) {
          LiveCodingManager.instance().addCustomMetadata(customMetadataName);
        }
        flexConfig.addCustomMetadata(customMetadataName);
      }
    }

    // CO-4880 - 'Exclude'-marked dependencies
    boolean hasExcludedSWCs = false;
    LinkReportBuilder linkReportBuilder = new LinkReportBuilder(compiledModule);
    for (Solution excludedDependency : excludedDependencies) {
      if (SolutionUtils.isSWCSolution(excludedDependency)) {
        // SWC libraries
        String swcPath = getSWCPath(excludedDependency);
        if (swcPath != null) {
          flexConfig.addExternalLibraryPath(swcPath);
          hasExcludedSWCs = true;
        }
      } else {
        // Regular source modules

        if (liveIncrementalGeneration) {
          continue;
        }

        linkReportBuilder.addDependencyModule(excludedDependency);
      }
    }
    if (hasExcludedSWCs) {
      String playerSWCPath = getPlayerSWCPath();
      if (playerSWCPath != null) {
        flexConfig.addExternalLibraryPath(playerSWCPath);
      }
    }
    if (linkReportBuilder.hasDependenciesToReport()) {
      LinkReport linkReport = linkReportBuilder.build();
      String linkReportPath = linkReport.save();

      if (linkReportPath != null) {
        flexConfig.setLoadExternsFilePath(linkReportPath);
      }
    }

    return flexConfig;
  }

  public void addClassesToLibrary(CompilerSettings compilerSettings, FlexConfig flexConfig) {
    List<String> excludedPackages = compilerSettings.getExcludedPackages();
    for (SModelDescriptor sModelDescriptor : compiledModule.getOwnModelDescriptors()) {
      for (SNode root : sModelDescriptor.getSModel().roots()) {
        String fqName = null;
        String namespace = sModelDescriptor.getLongName();

        if (excludedPackages.contains(namespace)) {
          continue;
        }

        if (StringUtils.isEmpty(namespace)) {
          fqName = root.getName();
        } else {
          fqName = namespace + "." + root.getName();
        }
        flexConfig.addClass(fqName);
      }
    }
  }

  private String getPlayerSWCPath() {
    String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();

    // 1 - try to get the player with version specified in "target player"
    CompilerSettings compilerSettings = compiledModule.getModuleDescriptor().getCompilerSettings();
    if (compilerSettings.playerVersion != null) {
      String[] subversion = compilerSettings.playerVersion.split("\\.");
      if (subversion.length > 1) {
        String specifiedVersionPlayerDirName = subversion[0] + "." + subversion[1];
        File playerDirPath = new File(new File(new File(new File(flexSDKPath, "frameworks"), "libs"), "player"), specifiedVersionPlayerDirName);
        File playerSWC = new File(playerDirPath, FlexSDKLib.PLAYERGLOBAL_SWC.getLibPath());

        if (playerSWC.exists()) {
          return playerSWC.getPath();
        }
      }
    }

    // 2 - return the most recent playerglobal.swc
    try {
      return FlexSDKLibsManager.getInstance().getMostRecentPlayerglobalSWCPath(new File(flexSDKPath));
    } catch (FlexSDKNotPresentException e) {
      return null;
    }
  }

  private String getSWCPath(Solution swcDependencySolution) throws MakeException {
    String rawSWCPath = SolutionUtils.getSWCClassPathItemPath(swcDependencySolution);
    if (rawSWCPath == null) {
      return null;
    }

    if (rawSWCPath.contains(JarSWCHelper.JAR_MARKER)) {
      File extractedSWC = JarSWCHelper.extractJarSWCResource(rawSWCPath);

      // RF-582
      if (extractedSWC == null) {
        throw new MakeException("Can't extract JAR resource: " + rawSWCPath);
      }

      return extractedSWC.getPath();
    } else {
      return rawSWCPath;
    }
  }

  private String getLinkReportFilePath(IModule module) {
    return new File(module.getBundleHome().getPath(), "link-report.xml").getPath();
  }

  private List<String> getAccessorySourcePaths() {
    List<String> sourcePaths = new ArrayList<String>();
    Set<ModuleReference> initialLanguagesReferences = new java.util.HashSet<ModuleReference>();
    Set<Language> allUsedLanguages = new java.util.HashSet<Language>();

    // Add module used languages refs
    initialLanguagesReferences.addAll(compiledModule.getUsedLanguagesReferences());

    // Add models used languages refs - RE-2446
    for (SModelDescriptor compiledModel : compiledModule.getEditableUserModels()) {
      initialLanguagesReferences.addAll(compiledModel.getSModel().importedLanguages());
    }

    // Add language dependencies recursively - RE-2446
    for (ModuleReference languageRef : initialLanguagesReferences) {
      IModule moduleViaLangRef = MPSModuleRepository.getInstance().getModule(languageRef);
      if (moduleViaLangRef != null && moduleViaLangRef instanceof Language) {
        Language language = (Language) moduleViaLangRef;
        allUsedLanguages.add(language);

        // Chain-dependencies
        DependenciesManager dependenciesManager = language.getDependenciesManager();
        allUsedLanguages.addAll(language.getAllExtendedLanguages());
        allUsedLanguages.addAll(dependenciesManager.getAllUsedLanguages());
      }
    }

    // Add accessory sources paths for each used language
    for (Language usedLanguage : allUsedLanguages) {
      if (!LanguageUtils.isExtendingActionScript(usedLanguage)) {
        continue;
      }

      // Generated sources path
      String sourceGenPath = usedLanguage.getGeneratorOutputPath();

      // Packaged language:
      // e.g.: /Users/eliseev/TMP/20M3/CodeOrchestra.app/platform/ui/jetbrains.mps.ui.mpsarch.jar!/module/source_gen

      // Unpackaged language:
      // e.g.: /Users/eliseev/Projects/CodeOrchestra/languages/actionScript/source_gen

      // Collect accessory models source paths
      for (SModelDescriptor accessoryModel : usedLanguage.getAccessoryModels()) {
        if (accessoryModel instanceof EditableSModelDescriptor) {
          String relativeAccessorySourcePath = accessoryModel.getLongName().replaceAll("\\.", "/");
          String absoluteAccessorySourcePath = sourceGenPath + '/' + relativeAccessorySourcePath;

          if (usedLanguage.isPackaged()) {
            String extractedSourcesPath = SourceGenInJarHelper.extractGeneratedSourcesFromJar(sourceGenPath, accessoryModel.getLongName());
            if (extractedSourcesPath != null) {
              sourcePaths.add(extractedSourcesPath);
            }
          } else {
            String copiedSourcesPath = SourceGenInDirHelper.copyGeneratedSourcesToTempDir(absoluteAccessorySourcePath, accessoryModel.getLongName());
            if (copiedSourcesPath != null) {
              sourcePaths.add(copiedSourcesPath);
            }
          }
        }
      }
    }

    return sourcePaths;
  }

  public String getOutputPath() throws MakeException {
    String swfOutputPath = codeOrchestra.actionscript.view.utils.SolutionUtils.getSWFOutputPath(compiledModule);
    if (swfOutputPath == null) {
      // Report an error
      throw new MakeException("Can't determine the output path for the module " + compiledModule.toString());
    }
    return swfOutputPath;
  }

  private String getMainClassPath() throws MakeException {
    // Get main class 
    String mainClassNodeId = compiledModule.getModuleDescriptor().getCompilerSettings().mainClassNodeId;
    String mainClassModelUID = compiledModule.getModuleDescriptor().getCompilerSettings().mainClassModelUID;
    if (mainClassNodeId == null || mainClassModelUID == null) {
      throw new MakeException("Main class not specified");
    }

    final SNodePointer mainClassPointer = new SNodePointer(mainClassModelUID, mainClassNodeId);

    final SNode mainClassNode = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      public SNode compute() {
        return mainClassPointer.getNode();
      }
    });
    if (mainClassNode == null) {
      throw new MakeException("Can't locate main class");
    }

    String fqMainClassName = ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        return NameUtil.longNameFromNamespaceAndShortName(mainClassNode.getModel().getLongName(), mainClassNode.getName());
      }
    });
    String fqConceptName = ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        return mainClassNode.getConceptFqName();
      }
    });
    String extension = FlexFileExtensions.get(fqConceptName);

    return getMainClassPath(fqMainClassName, extension);
  }

  private String getMainClassPath(String fqMainClassName, String extension) {
    return compiledModule.getGeneratorOutputPath() + File.separator + fqMainClassName.replace(".", File.separator) + extension;
  }

}
