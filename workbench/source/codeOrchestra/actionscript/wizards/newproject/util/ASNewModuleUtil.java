package codeOrchestra.actionscript.wizards.newproject.util;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.application.impl.LaterInvocator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import codeOrchestra.actionScript.assets.AssetsManager;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASDummyExternalModule;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalRunConfiguration;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ASNewModuleUtil {

  private static final String PARSER_ACTION_CLASS = "codeOrchestra.actionScript.core.plugin.ASLaunchParser_Action";

  public static Solution createModule(final MPSProject mpsProject, final String solutionFilePath, final String classPathItem) {
    Solution module = createNewModule(mpsProject, solutionFilePath, classPathItem != null);
    SolutionDescriptor solutionDescriptor = module.getModuleDescriptor();

    // Add class path entry
    if (classPathItem != null) {
      ModelRoot stubModelsEntry = new ModelRoot();
      stubModelsEntry.setPath(classPathItem);
      stubModelsEntry.setManager(LanguageID.SWC_MANAGER);

      solutionDescriptor.getStubModelEntries().add(stubModelsEntry);

      module.save();
    }

    return module;
  }

  private static Solution createNewModule(MPSProject mpsProject, String solutionFilePath, boolean isLib) {
    // 1 - Create
    IFile solutionFile = FileSystem.getInstance().getFileByPath(solutionFilePath);
    String solutionFileName = solutionFile.getName();
    String solutionName = solutionFileName.substring(0, solutionFileName.length() - 4);

    // RE-2448
    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(solutionFile.getParent().getAbsolutePath());

    Solution solution;
    if (isLib) {
      solution = Solution.createStubSolution(solutionName, solutionFile, mpsProject, modelRoot);
    } else {
      solution = Solution.createSolution(solutionName, solutionFile, mpsProject, modelRoot);
    }

    // 2 - Adjust

    // Model root
    ModuleDescriptor descriptor = solution.getModuleDescriptor();

    // Source paths
    if (!isLib) {
      descriptor.getSourcePaths().add(solutionFile.getParent().getAbsolutePath() + File.separator + "source");
    }

    // Add languages dependencies
    descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_INTERNAL));
    if (!isLib) {
      descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_LOGGING));
      descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_ASSETS));
    }

    // Add assets solution dependency
    descriptor.getDependencies().add(new Dependency(AssetsManager.createProjectAssetsModuleReference(mpsProject.getProject().getName()), false));

    // Add playerglobal dependency
    Dependency playerglobalDependency = new Dependency();
    playerglobalDependency.setModuleRef(ModuleReference.fromString("playerglobal_swc"));
    descriptor.getDependencies().add(playerglobalDependency);

    // Save and add to project
    solution.save();
    mpsProject.addProjectModule(solution, true);

    return solution;
  }

  public static void launchParserOnInitialization(Project createdProject,
                                                  Solution solution,
                                                  String sourcesPath,
                                                  MPSProject mpsProject) {
    Map<Solution, ASExternalModule> solutionExternalModuleMap = new HashMap<Solution, ASExternalModule>();
    ASDummyExternalModule mod = new ASDummyExternalModule();
    List<ASExternalRunConfiguration> emptyList = new ArrayList<ASExternalRunConfiguration>();
    mod.setSourcesPath(sourcesPath);
    solutionExternalModuleMap.put(solution, mod);

    launchParserOnInitialization(createdProject, solutionExternalModuleMap, emptyList, mpsProject);
  }
  
  public static void launchParserOnInitialization(final Project createdProject,
                                                  final Map<Solution, ASExternalModule> solutionExternalModuleMap,
                                                  final List<ASExternalRunConfiguration> runConfigurationList,
                                                  final MPSProject mpsProject) {

    StartupManager.getInstance(createdProject).runWhenProjectIsInitialized(new Runnable() {
      public void run() {

        new Thread(new Runnable() {
          @Override
          public void run() {
            
            final BaseAction[] launchParserAction = {null};
            
            while (null == (launchParserAction[0] = (BaseAction) ActionManager.getInstance().getAction(PARSER_ACTION_CLASS))) {
              try {
                Thread.sleep(500);
              } catch (InterruptedException e) {
                // Ignore
              }
            }

            final AnActionEvent actionEvent = ActionUtils.createEvent("PROJECT_PANE", new DataContext() {
              public Object getData(@NonNls String s) {
                Object data = null;

                if (s.equalsIgnoreCase("solutionExternalModuleMap")) {
                  data = solutionExternalModuleMap;
                } else if (s.equalsIgnoreCase("runConfigurationList")) {
                  data = runConfigurationList;
                } else if (s.equalsIgnoreCase(MPSDataKeys.MPS_PROJECT.getName())) {
                  data = mpsProject;
                } else if (s.equalsIgnoreCase(MPSDataKeys.PROJECT.getName())) {
                  data = createdProject;
                }

                if (data == null) {
                  throw new IllegalArgumentException("No data for key " + s);
                }

                return data;
              }
            });

            LaterInvocator.invokeLater(new Runnable() {
              @Override
              public void run() {
                Map<String, Object> params = new HashMap<String, Object>();
                launchParserAction[0]._collectionActionData(actionEvent, params);
                launchParserAction[0]._doExecute(actionEvent, params);
              }
            });
    
          }
        }).start();

      }
    });
  }
  
}
