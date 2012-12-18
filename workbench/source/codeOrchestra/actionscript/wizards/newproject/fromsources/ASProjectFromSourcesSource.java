package codeOrchestra.actionscript.wizards.newproject.fromsources;

import codeOrchestra.actionscript.wizards.newproject.*;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.wizards.newproject.util.ASNewModuleUtil;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.misc.hash.HashSet;

import java.io.File;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromSourcesSource extends ASAbstractProjectSource implements ASProjectSource {

  private ASProjectFromSourcesSettings settings = new ASProjectFromSourcesSettings();
  private Map<String, String> libraryPathSolutionNameMap = new HashMap<String, String>();

  public String getID() {
    return "sources";
  }

  public String getDescription() {
    return "Create Code Orchestra project over existing sources";
  }

  public String getName() {
    return "Create project from existing sources";
  }

  public boolean isEnabled() {
    return true;
  }

  public List<ASNewProjectStep> getSteps() {
    List<ASNewProjectStep> steps = new ArrayList<ASNewProjectStep>();

    steps.add(new ASProjectFromSourcesProjectStep(settings));
    steps.add(new ASProjectFromSourcesLibrariesStep(settings));

    return steps;
  }

  @Override
  protected void prepareCreatedProject(final Project createdProject) {
    final MPSProject mpsProject = createdProject.getComponent(MPSProject.class);

    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        // Create library modules
        for (String libraryPath : settings.getUniquePaths()) {
          String libSolutionName = libraryPathSolutionNameMap.get(libraryPath);
          String libSolutionFilePath = getLibrarySolutionFilePath(libSolutionName);

          Solution libSolution = ASNewModuleUtil.createModule(mpsProject, libSolutionFilePath, libraryPath);
          ModelRoot stubModelEntry = new ModelRoot();
          stubModelEntry.setPath(libraryPath);
          stubModelEntry.setManager(LanguageID.SWC_MANAGER);
          libSolution.getModuleDescriptor().getStubModelEntries().add(stubModelEntry);
        }

        // Create module to parse sources to
        String sourcesSolutionFileName = getSourceSolutionFileName();
        final Solution parsedSolution = ASNewModuleUtil.createModule(mpsProject, sourcesSolutionFileName, null);

        // Launch parser on project initialization
        ASNewModuleUtil.launchParserOnInitialization(createdProject, parsedSolution, settings.getSourcesPath(), mpsProject);
      }
    });
  }

  private String getLibrarySolutionFilePath(String libSolutionName) {
    return settings.getProjectPath() + File.separator + "modules" + File.separator + libSolutionName
      + File.separator + libSolutionName + MPSExtentions.DOT_SOLUTION;
  }

  private String getSourceSolutionFileName() {
    return NewProjectPathHelper.getSolutionFilePath(settings.getModulePath(), settings.getModuleName());
  }

  private String getUniqueSolutionName(String solutionName, Set<String> createdSolutions) {
    String result = solutionName;
    int i = 0;
    while (createdSolutions.contains(result)) {
      result = solutionName + "_" + i++;
    }
    return result;
  }

  public String createDirs() {
    libraryPathSolutionNameMap.clear();
    Set<String> createdSolutions = new HashSet<String>();

    // Create project dir
    File projectDirFile = new File(settings.getProjectPath());
    if (!(projectDirFile.exists())) {
      if (!projectDirFile.mkdirs()) return "Project directory creation failed: " + projectDirFile.getPath();
    }

    // Create parsed module dir
    String path = getSourceSolutionFileName();
    File solutionDescriptorFile = new File(path);
    File dir = solutionDescriptorFile.getParentFile();
    if (!(dir.exists())) {
      if (!dir.mkdirs()) return "Module directory creation failed: " + dir.getPath();
    }
    createdSolutions.add(settings.getModuleName());

    // Create source dir
    File sourceDir = new File(dir.getPath() + File.separator + "source");
    if (!sourceDir.exists()) {
      sourceDir.mkdir();
    }

    // Create library dirs
    for (String libraryPath : settings.getUniquePaths()) {
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

    return null;
  }

  public ASNewProjectSettings getSettings() {
    return settings;
  }


}
