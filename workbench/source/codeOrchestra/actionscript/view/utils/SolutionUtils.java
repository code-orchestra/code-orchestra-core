package codeOrchestra.actionscript.view.utils;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import jetbrains.mps.ide.vfs.IdeaFile;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.model.ModelRootManager;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.stubs.StubLocation;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @author Alexander Eliseyev
 */
public final class SolutionUtils {

  private static final String PLAYERGLOBAL_SWC = "playerglobal_swc";

  private static final String[] BUILT_IN_LIBRARIES = {
    "flex_swc",
    "framework_swc",
    "playerglobal_swc",
    "rpc_swc",
    "utilities_swc",
    "spark_swc",
    "mx_swc",
    "osmf_swc",
    "jangaroo-browser",
    "jangaroo-runtime",
    "jooflash",
    "casalib",
    "operators"
  };

  private static Pattern VALID_IDENTIFIER_PATTERN = Pattern.compile("^[a-zA-Z[_][$]][a-zA-Z0-9[_][$]]*$");

  public static Solution createNewSolution(final IFile solutionDescriptorFile, Project project) {
    return createNewSolution(solutionDescriptorFile, project, OutputType.FLEX_APPLICATION);
  }

  public static Solution createNewSolution(final IFile solutionDescriptorFile, Project project, OutputType outputType) {
    return createNewSolution(solutionDescriptorFile, project, outputType, new String[0]);
  }

  public static Solution createNewSolution(final IFile solutionDescriptorFile, Project project, OutputType outputType, String... dependencies) {
    MPSProject mpsProject = project.getComponent(MPSProject.class);

    // Prepare files
    File dir = new File(solutionDescriptorFile.getAbsolutePath()).getParentFile();
    if (!(dir.exists())) {
      dir.mkdirs();
    }
    String solutionFileName = solutionDescriptorFile.getName();
    String solutionName = solutionFileName.substring(0, solutionFileName.length() - 4);

    // Create
    // RE-2448
    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(solutionDescriptorFile.getParent().getAbsolutePath());
    final Solution solution = Solution.createSolution(solutionName, solutionDescriptorFile, mpsProject, modelRoot);

    SolutionDescriptor solutionDescriptor = solution.getModuleDescriptor();

    // Add languages refs
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_INTERNAL));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_LOGGING));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_ASSETS));

    // Dependencies
    for (String dependency : dependencies) {
      solutionDescriptor.getDependencies().add(new Dependency(ModuleReference.fromString(dependency), false));
    }

    solutionDescriptor.getCompilerSettings().outputTypeIndex = outputType.ordinal();
    try {
      solutionDescriptor.getCompilerSettings().outputFileName = solutionName + (outputType == OutputType.FLEX_LIBRARY ? ".swc" : ".swf");
    } catch (Throwable t) {
      //
    }

    // Add playerglobal reference
    Dependency playerGlobalDependency = new Dependency();
    playerGlobalDependency.setModuleRef(ModuleReference.fromString(PLAYERGLOBAL_SWC));
    solutionDescriptor.getDependencies().add(playerGlobalDependency);

    // Save the solution descriptor
    ModelAccess.instance().writeFilesInEDT(new Runnable() {
      public void run() {
        solution.save();
      }
    });
    mpsProject.addProjectModule(solution, true);

    return solution;
  }

  public static String getSWFOutputPath(Solution solution) {
    CompilerSettings compilerSettings = solution.getModuleDescriptor().getCompilerSettings();

    // RF-730
    String outputDirPath = null;
    if (compilerSettings.inheritProjectOutputPath) {
      outputDirPath = getProjectModuleOutputDir(solution);
    } else {
      outputDirPath = compilerSettings.outputPath;
    }

    return outputDirPath + File.separator + compilerSettings.outputFileName;
  }

  private static String getProjectModuleOutputDir(Solution solution) {
    // Try to get the output path through the descriptor path
    IFile moduleDescriptorFile = solution.getDescriptorFile();
    if (moduleDescriptorFile != null) {
      return moduleDescriptorFile.getParent().getAbsolutePath() + File.separator + CompilerSettings.DEFAULT_OUTPUT_PROJECT_DIR;
    }

    // Try to get the output path through the model root
    if (!solution.getModuleDescriptor().getModelRoots().isEmpty()) {
      // Model root for the solutions is expected to be the solution dir itself
      ModelRoot firstModelRoot = solution.getModuleDescriptor().getModelRoots().iterator().next();
      return firstModelRoot.getPath() + File.separator + CompilerSettings.DEFAULT_OUTPUT_PROJECT_DIR;
    }

    return null;
  }

  public static void fetchDependencies(Solution solution, Set<Solution> dependencies) {
    for (IModule dependencyModule : solution.getDependOnModules()) {
      if (dependencyModule instanceof Solution) {
        Solution dependencyCandidate = (Solution) dependencyModule;
        if (!dependencies.contains(dependencyCandidate)) {
          dependencies.add(dependencyCandidate);
          fetchDependencies(dependencyCandidate, dependencies);
        }
      }
    }
  }

  public static void fetchDependencies(Solution solution, Map<Solution, Boolean> dependenciesMap) {
    Map<ModuleReference, Boolean> moduleRefMap = new HashMap<ModuleReference, Boolean>();
    fetchDependenciesWithExcludes(solution, moduleRefMap);

    for (ModuleReference moduleReference : moduleRefMap.keySet()) {
      IModule module = MPSModuleRepository.getInstance().getModule(moduleReference);
      if (module != null && module instanceof Solution) {
        dependenciesMap.put((Solution) module, moduleRefMap.get(moduleReference));
      }
    }
  }

  public static void fetchDependenciesWithExcludes(Solution solution, Map<ModuleReference, Boolean> dependenciesMap) {
    for (Dependency dependency : solution.getDependencies()) {
      ModuleReference dependencyModuleRef = dependency.getModuleRef();
      IModule dependencyModule = MPSModuleRepository.getInstance().getModule(dependencyModuleRef);
      if (dependencyModule instanceof Solution) {
        Solution dependencyCandidate = (Solution) dependencyModule;

        if (dependenciesMap.containsKey(dependencyModuleRef)) {
          dependenciesMap.put(dependencyModuleRef, dependency.isExclude() || dependenciesMap.get(dependencyModuleRef));
        } else {
          dependenciesMap.put(dependencyModuleRef, dependency.isExclude());
          fetchDependenciesWithExcludes(dependencyCandidate, dependenciesMap);
        }
      }
    }
  }

  public static Solution getSolution(SModelDescriptor sModelDescriptor) {
    if (sModelDescriptor == null) {
      return null;
    }
    IModule module = sModelDescriptor.getModule();
    if (module == null || !(module instanceof Solution)) {
      return null;
    }
    return (Solution) module;
  }

  private static final Set<String> BUILT_IN_LIBRARIES_SET = new HashSet<String>();
  static {
    BUILT_IN_LIBRARIES_SET.addAll(Arrays.asList(BUILT_IN_LIBRARIES));
  }

  public static boolean isBuiltinLibrary(Solution solution) {
    String name = solution.getModuleDescriptor().getNamespace();
    if (name == null) {
      return false;
    }

    return BUILT_IN_LIBRARIES_SET.contains(name.trim().toLowerCase());
  }

  public static boolean isActionScriptDependent(Solution solution) {
    //TODO: Rewrite using language inheritance
    for (ModuleReference languageRef : solution.getUsedLanguagesReferences()) {
      if (languageRef.getModuleFqName().startsWith("codeOrchestra.actionScript")) {
        return true;
      }
    }
    return false;
  }

  public static boolean isActionScriptDependent(SolutionDescriptor solutionDescriptor) {
    //TODO: Rewrite using language inheritance
    for (ModuleReference languageRef : solutionDescriptor.getUsedLanguages()) {
      if (languageRef.getModuleFqName().startsWith("codeOrchestra.actionScript")) {
        return true;
      }
    }
    return false;
  }

  public static ModelRootManager getStubModelRootManager(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries_()) {
      if (LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())
        ||
        LanguageID.AS_MANAGER.equals(stubModelsEntry.getManager())) {
        return stubModelsEntry.getManager();
      }
    }
    return null;
  }

  public static boolean isSWCSolution(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries_()) {
      if (LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }

  public static boolean isSWCSolution(SolutionDescriptor solution) {
    for (ModelRoot stubModelsEntry : solution.getStubModelEntries_()) {
      if (LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }

  public static boolean isASStubSolution(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries_()) {
      if (LanguageID.AS_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }

  public static StubLocation getStubLocation(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries()) {
      if (LanguageID.AS_MANAGER.equals(stubModelsEntry.getManager()) || LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())) {
        return new StubLocation(stubModelsEntry.getPath(), "", solution.getModuleReference());
      }
    }
    return null;
  }

  public static boolean isASStubSolution(SolutionDescriptor solution) {
    for (ModelRoot stubModelsEntry : solution.getStubModelEntries_()) {
      if (LanguageID.AS_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }

  public static boolean isStubSolution(Solution solution) {
    return isSWCSolution(solution) || isASStubSolution(solution);
  }

  public static boolean isLiveCodingSolution(Solution solution, Project project) {
    return LiveCodingManager.getLiveCodingModuleName(project).equals(solution.getModuleFqName());
  }

  public static boolean isStubSolution(SolutionDescriptor solution) {
    return isSWCSolution(solution) || isASStubSolution(solution);
  }

  public static StubModuleType getStubModuleType(Solution solution) {
    if (isSWCSolution(solution)) {
      return StubModuleType.SWC;
    } else if (isASStubSolution(solution)) {
      return StubModuleType.AS_SOURCES;
    }
    return null;
  }

  public static String getLibrarySourcesPath(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries()) {
      if (stubModelsEntry.isASStubs()) {
        return stubModelsEntry.getPath();
      }
    }
    return null;
  }

  public static String getSWCClassPathItemPath(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries()) {
      String stubModelPathLoweCase = stubModelsEntry.getPath().toLowerCase();
      if (stubModelPathLoweCase.endsWith(".swc") || stubModelPathLoweCase.endsWith(".ane")) {
        return stubModelsEntry.getPath();
      }
    }
    return null;
  }

  public static String getModulePresentation(Solution solution) {
    if (SolutionUtils.isSWCSolution(solution)) {
      ModuleDescriptor moduleDescriptor = solution.getModuleDescriptor();
      if (moduleDescriptor != null) {
        List<ModelRoot> stubModelEntries = moduleDescriptor.getStubModelEntries();
        if (stubModelEntries != null && !stubModelEntries.isEmpty()) {
          ModelRoot modelRoot = stubModelEntries.get(0);
          String libPath = modelRoot.getPath();

          if (libPath != null) {
            return new File(libPath).getName();
          }
        }
      }
    }
    return solution.getModuleFqName();
  }

  public static boolean isValidModuleName(String moduleName) {
    return StringUtils.isEmpty(moduleName) || VALID_IDENTIFIER_PATTERN.matcher(moduleName).matches();
  }

  public static SNodePointer getMainClassPointer(Solution module) {
    String mainClassNodeId;
    String mainClassModelUID;

    try {
      mainClassNodeId = module.getModuleDescriptor().getCompilerSettings().mainClassNodeId;
      mainClassModelUID = module.getModuleDescriptor().getCompilerSettings().mainClassModelUID;
    } catch (Throwable t) {
      return null;
    }

    if (mainClassNodeId != null && mainClassModelUID != null) {
      return new SNodePointer(mainClassModelUID, mainClassNodeId);
    }

    return null;
  }

  public static List<SNodePointer> getRootClassesPointers(IModule module) {
    List<SNodePointer> result = new ArrayList<SNodePointer>();

    if (module instanceof Solution) {
      OutputType outputType = CodeOrchestraGenerateManager.getOwnOutputType(module.getModuleReference());
      if (outputType != null) {
        if (outputType.mustHaveMainClass()) {
          // Single root class
          result.add(getMainClassPointer((Solution) module));
        } else {
          // All the modules classes are the root ones
          for (SModelDescriptor modelDescriptor : module.getOwnModelDescriptors()) {
            for (SNode root : modelDescriptor.getSModel().roots()) {
              result.add(new SNodePointer(root));
            }
          }
        }
      }
    }

    return result;
  }

  public static void refreshModuleFiles(String path) {
    final IFile iFile = FileSystem.getInstance().getFileByPath(path).getParent().getParent();
    if (iFile instanceof IdeaFile) {
      ApplicationManager.getApplication().runWriteAction(new Runnable() {
        @Override
        public void run() {
          ((IdeaFile) iFile).refresh();
        }
      });
    }
  }

}
