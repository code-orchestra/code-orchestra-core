package codeOrchestra.utils;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.ide.smodel.CurrentProjectAccessUtil;

/**
 * @author Alexander Eliseyev
 */
public final class ProjectHolder {

  private ProjectHolder() {
  }

  public static Project getProject() {
    Project[] openProjects = ProjectManager.getInstance().getOpenProjects();
    if (openProjects != null && openProjects.length > 0) {
      return openProjects[0];
    }
    return CurrentProjectAccessUtil.getProjectFromUI();
  }

}
