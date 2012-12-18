package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.wizards.newproject.NewProjectPathHelper;
import codeOrchestra.actionscript.wizards.newproject.util.ASNewModuleUtil;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.UndoHelper;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.util.misc.hash.HashSet;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalType {

  protected ASExternalPanel configPanel;
  protected ASExternalPanel additionalPanel;

  private Map<String, String> libraryPathSolutionNameMap = new HashMap<String, String>();

  protected ASExternalSettings settings;
  
  public abstract ASExternalPanel getConfigPanel();

  public abstract ASExternalPanel getAdditionalPanel();
  
  public abstract String getName();

  public abstract boolean isEnabled();

  public abstract boolean usesAdditionalStep();

  public void prepareCreatedProject(final Project createdProject) {

    final MPSProject mpsProject = createdProject.getComponent(MPSProject.class);

    UndoHelper.getInstance().runNonUndoableAction(new Computable<Object>() {
      @Override
      public Object compute() {

        ModelAccess.instance().runWriteActionInCommand(new Runnable() {
          @Override
          public void run() {

            Map<String, Solution> pathModuleMap = new HashMap<String, Solution>();
            Map<Solution, ASExternalModule> solutionExternalModuleMap = new HashMap<Solution, ASExternalModule>();

            for (ASExternalModule externalModule : settings.getImporter().getModules()) {

              // Libraries
              for (String libraryPath : externalModule.getLibraryDependencies()) {
                String libSolutionName = libraryPathSolutionNameMap.get(libraryPath);
                String libSolutionFilePath = getLibrarySolutionFilePath(libSolutionName);

                // Copy lib if needed
                if (settings.getImporter().isCopyLibraries()) {
                  String targetLibDirectory = settings.getProjectPath() + File.separator + "modules" + File.separator + libSolutionName;
                  File libFile = new File(libraryPath);
                  // At this moment directory should be created by createDirs method
                  FileUtil.copyFile(libFile, new File(targetLibDirectory));
                  libraryPath = targetLibDirectory + File.separator + libFile.getName();
                }

                Solution libSolution = ASNewModuleUtil.createModule(mpsProject, libSolutionFilePath, libraryPath);
                pathModuleMap.put(libraryPath, libSolution);
                ModelRoot stubModelEntry = new ModelRoot();
                stubModelEntry.setPath(libraryPath);
                stubModelEntry.setManager(LanguageID.SWC_MANAGER);
                libSolution.getModuleDescriptor().getStubModelEntries().add(stubModelEntry);
              }

              String moduleRootPath = settings.getProjectPath() + File.separator + externalModule.getModuleName();
              
              // Copy config files if needed
              if (settings.getImporter().isCopyConfigFiles()) {
                if (externalModule.getCustomCompilerConfig() != null) {
                  File configFile = new File(externalModule.getCustomCompilerConfig());
                  FileUtil.copyFile(configFile, new File(moduleRootPath));
                  externalModule.setCustomCompilerConfig(moduleRootPath + File.separator + configFile.getName());
                }
              }

              // Module
              String sourcesSolutionFileName =
                NewProjectPathHelper.getSolutionFilePath(moduleRootPath, externalModule.getModuleName());
              final Solution parsedSolution = ASNewModuleUtil.createModule(mpsProject, sourcesSolutionFileName, null);
              pathModuleMap.put(externalModule.getModulePath(), parsedSolution);

              // Set solution type to library where needed
              if (externalModule.isLibraryModule()) {
                parsedSolution.getModuleDescriptor().getCompilerSettings().outputTypeIndex = OutputType.FLEX_LIBRARY.getIndex();
              }

              solutionExternalModuleMap.put(parsedSolution, externalModule);
            }

            // Launch parser on project initialization
            ASNewModuleUtil.launchParserOnInitialization(
              createdProject,
              solutionExternalModuleMap,
              settings.getImporter().getRunConfigurations(),
              mpsProject
            );

            // Dependencies
            for (ASExternalModule externalModule : settings.getImporter().getModules()) {
              Solution solution = pathModuleMap.get(externalModule.getModulePath());

              if (solution == null) {
                // Unbelievable!
                continue;
              }

              // Add module dependencies
              for (String depName : externalModule.getModuleDependencies()) {
                Solution depSolution = pathModuleMap.get(depName);
                if (depSolution != null) {
                  solution.addDependency(depSolution.getModuleReference(), false);
                }
              }

              // Add library dependencies
              for (String depName : externalModule.getLibraryDependencies()) {
                Solution depSolution = pathModuleMap.get(depName);
                if (depSolution != null) {
                  solution.addDependency(depSolution.getModuleReference(), false);
                }
              }
            }

          }
        }, createdProject);

        return null;
      }
    });

  }

  public String createDirs() {
    libraryPathSolutionNameMap.clear();
    Set<String> createdSolutions = new HashSet<String>();

    for (ASExternalModule externalModule : settings.getImporter().getModules()) {

      // Create module to parse sources to
      String path =
        NewProjectPathHelper.getSolutionFilePath(settings.getProjectPath() + File.separator + externalModule.getModuleName(), externalModule.getModuleName());
      File solutionDescriptorFile = new File(path);
      File dir = solutionDescriptorFile.getParentFile();
      if (!(dir.exists())) {
        if (!dir.mkdirs()) return "Module directory creation failed: " + dir.getPath();
      }

      // Create source dir
      File sourceDir = new File(dir.getPath() + File.separator + "source");
      if (!sourceDir.exists()) {
        sourceDir.mkdir();
      }

      // Create library dirs
      for (String libraryPath : externalModule.getLibraryDependencies()) {
        File file = new File(libraryPath);
        String swcFilename = file.getName();

        if (swcFilename == null || !swcFilename.contains(".")) {
          continue;
        }

        String libSolutionName = getUniqueSolutionName(swcFilename.replace(".", "_"), createdSolutions);
        File libSolutionDir = new File(getLibrarySolutionFilePath(libSolutionName)).getParentFile();
        if (!(libSolutionDir.exists())) {
          if (!libSolutionDir.mkdirs()) return "Library directory creation failed: " + dir.getPath();
        }

        createdSolutions.add(libSolutionName);
        libraryPathSolutionNameMap.put(libraryPath, libSolutionName);
      }
    }

    return null;
  }

  public String getProjectName() {
    return settings.getProjectName();
  }

  public String getProjectPath() {
    return settings.getProjectPath();
  }

  private String getUniqueSolutionName(String solutionName, Set<String> createdSolutions) {
    String result = solutionName;
    int i = 0;
    while (createdSolutions.contains(result)) {
      result = solutionName + "_" + i++;
    }
    return result;
  }

  private String getLibrarySolutionFilePath(String libSolutionName) {
    return settings.getProjectPath() + File.separator + "modules" + File.separator + libSolutionName
      + File.separator + libSolutionName + MPSExtentions.DOT_SOLUTION;
  }

}
