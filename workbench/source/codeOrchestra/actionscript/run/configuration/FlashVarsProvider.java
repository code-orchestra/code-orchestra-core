package codeOrchestra.actionscript.run.configuration;

import com.intellij.execution.RunManagerEx;
import com.intellij.execution.RunnerAndConfigurationSettings;
import com.intellij.execution.actions.ASRunConfigHelper;
import com.intellij.execution.configurations.RunConfiguration;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import jetbrains.mps.execution.api.configurations.BaseMpsRunConfiguration;
import jetbrains.mps.plugins.pluginparts.runconfigs.BaseRunConfig;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;

import java.lang.reflect.Field;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class FlashVarsProvider {

  private static final String SERIALIZED_FLASH_VARS_FIELD = "serializedFlashVars";

  public static SNode getCurrentRunConfigurationMainClass(Project project) {
    RunnerAndConfigurationSettings settings = RunManagerEx.getInstanceEx(project).getSelectedConfiguration();
    if (settings == null) {
      return null;
    }

    RunConfiguration configuration = settings.getConfiguration();
    if (configuration == null) {
      return null;
    }

    String solutionName = null;

    // RE-2806
    if (configuration instanceof BaseRunConfig) {
      solutionName = ASRunConfigHelper.getConfiguredModuleName((BaseRunConfig) configuration);
    } else if (configuration instanceof BaseMpsRunConfiguration) {
      solutionName = ASRunConfigHelper.getConfiguredModuleName((BaseMpsRunConfiguration) configuration);
    }

    if (solutionName == null) {
      return null;
    }

    MPSProject mpsProject = project.getComponent(MPSProject.class);
    for (Solution solution : mpsProject.getProjectSolutions()) {
      if (solutionName.equals(solution.toString())) {
        CompilerSettings compilerSettings = solution.getModuleDescriptor().getCompilerSettings();
        String mainClassNodeId = compilerSettings.mainClassNodeId;
        String mainClassModelUID = compilerSettings.mainClassModelUID;

        if (mainClassNodeId != null && mainClassModelUID != null) {
          SNodePointer mainClassPointer = new SNodePointer(mainClassModelUID, mainClassNodeId);
          return mainClassPointer.getNode();
        }
      }
    }
    
    return null;
  }

  public static List<FlashVar> getCurrentRunConfigurationFlashVars(Project project) {
    RunnerAndConfigurationSettings settings = RunManagerEx.getInstanceEx(project).getSelectedConfiguration();
    if (settings == null) {
      return null;
    }

    RunConfiguration configuration = settings.getConfiguration();
    if (configuration == null) {
      return null;
    }

    if (!(configuration instanceof BaseRunConfig)) {
      return null;
    }

    Object stateObject = ASRunConfigHelper.getStateObject((BaseRunConfig) configuration);
    if (stateObject == null) {
      return null;
    }

    try {
      Field field = stateObject.getClass().getField(SERIALIZED_FLASH_VARS_FIELD);
      Object varsObj = field.get(stateObject);

      if (varsObj == null) {
        return null;
      }

      if (varsObj instanceof String) {
        return FlashVarsSerializer.deserialize((String) varsObj);
      }
      return null;
    } catch (NoSuchFieldException e) {
      return null;
    } catch (IllegalAccessException e) {
      return null;
    }
  }

}
