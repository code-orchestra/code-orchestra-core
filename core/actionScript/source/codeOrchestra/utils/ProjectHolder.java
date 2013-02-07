package codeOrchestra.utils;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.ide.smodel.CurrentProjectAccessUtil;

/**
 * @author Alexander Eliseyev
 */
public final class ProjectHolder {

  private static Project backupProject;

  private ProjectHolder() {
  }

  public static void setBackupProject(Project backupProject) {
    ProjectHolder.backupProject = backupProject;
  }

  public static Project getProject() {
    Project[] openProjects = ProjectManager.getInstance().getOpenProjects();
    if (openProjects.length > 0) {
      return openProjects[0];
    }
    Project projectFromUI = CurrentProjectAccessUtil.getProjectFromUI();
    if (projectFromUI != null) {
      return projectFromUI;
    }
    return backupProject;
  }

}
