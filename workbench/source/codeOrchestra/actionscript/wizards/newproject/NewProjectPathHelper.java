package codeOrchestra.actionscript.wizards.newproject;

import jetbrains.mps.project.MPSExtentions;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public final class NewProjectPathHelper {

  public static String getProjectFilePath(String projectDirPath, String projectName) {
    return projectDirPath + File.separator + projectName + MPSExtentions.DOT_MPS_PROJECT;
  }

  public static String getSolutionFilePath(String moduleDirPath, String moduleName) {
    return moduleDirPath + File.separator + moduleName + MPSExtentions.DOT_SOLUTION;
  }

}
